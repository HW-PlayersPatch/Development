
-- static data on the gravwell memgroup (constants etc)
local GW_MEM_PROTO = {
	target_types = {
		"hgn_scout",
		"hgn_interceptor",
		"hgn_attackbomber",
		"hgn_assaultcorvette",
		"hgn_pulsarcorvette",
		"hgn_minelayercorvette",
		"vgr_scout",
		"vgr_interceptor",
		"vgr_lancefighter",
		"vgr_bomber",
		"vgr_missilecorvette",
		"vgr_lasercorvette",
		"vgr_commandcorvette",
		"vgr_minelayercorvette",
		"kus_scout",
		"kus_interceptor",
		"kus_attackbomber",
		"kus_defender",
		"kus_cloakedfighter",
		"kus_lightcorvette",
		"kus_heavycorvette",
		"kus_repaircorvette",
		"kus_multiguncorvette",
		"kus_minelayercorvette",
		"tai_scout",
		"tai_interceptor",
		"tai_attackbomber",
		"tai_defender",
		"tai_defensefighter",
		"tai_lightcorvette",
		"tai_heavycorvette",
		"tai_repaircorvette",
		"tai_multiguncorvette",
		"tai_minelayercorvette",
		--32
		"junk_junkyarddog",
		"tur_fighter",
		"tur_missilecorvette",
		"tur_standardcorvette",
		"kad_swarmer",
		"kad_advancedswarmer"
	},
	effect_range = 3000,
	glow_animation = "PowerOff",
	tick_self_damage = 0.0190,
	tumble_randtable = { -- premade random table
		0.69,
		1 / 0.37,
		0.51,
		0.64,
		1 / 0.14,
		1 / 0.32,
		0.15,
		0.35,
		1 / 0.33,
		0.70,
		0.47,
		1 / 0.02
	},
	tumble_randtable_index = 1,
}

GW_MEM = MemGroup.Create('gravwells', GW_MEM_PROTO)

function GW_MEM:Get(group, player_index, ship_id)
	local gravwell = self:get(ship_id)
	if (gravwell == nil) then
		gravwell = self:Create(group, player_index, ship_id)
	end
	return gravwell
end

--
-- ===== AUTORUN: =====
--

-- register new gravwell in the memgroup
-- sets up various instance data fields, including
-- the methods a gravwell can perform
function GW_MEM:Create(own_group, player_index, ship_id)
	local GRAVWELL_PROTO = {
		own_group = nil,
		stunnable_ships = SobGroup_CreateAndClear("gravwell-" .. ship_id .. "-stunnable"),
		old_stunnable_ships = SobGroup_CreateAndClear("gravwell-" .. ship_id .. "-stunnable-old")
	} -- instance static data/methods
	
	-- should be called once, essentially a housekeep for the gravwell
	-- plays glow fx, applies self damage, and saves the stunned group for the next pass
	function GRAVWELL_PROTO:Tick()
		FX_StartEvent(self.own_group, "PowerUp")
		SobGroup_TakeDamage(self.own_group, GW_MEM.tick_self_damage)
		SobGroup_Overwrite(self.old_stunnable_ships, self.stunnable_ships)
	end
	
	-- stuns the stunnable group calculated by CalcStunnableShipsGroup
	function GRAVWELL_PROTO:SetGroupStunned(stunned)
		SobGroup_SetGroupStunned(self.stunnable_ships, stunned)
		return self
	end
	
	-- frees any ships in the old group which aren't in the current group
	function GRAVWELL_PROTO:FreeEscapedShips()
		local escaped_ships = SobGroup_CreateAndClear("escaped-ships" .. "-" .. self.id)
		if (SobGroup_Count(self.old_stunnable_ships) > 0) then
			local temp_fill_group = SobGroup_CreateAndClear("escaped-ships-temp" .. "-" .. self.id)
			SobGroup_FillSubstract(temp_fill_group, self.old_stunnable_ships, self.stunnable_ships)
			SobGroup_SobGroupAdd(escaped_ships, temp_fill_group)
			if (SobGroup_Count(escaped_ships) > 0) then
				SobGroup_SetGroupStunned(escaped_ships, 0)
			end
		end
		return self
	end
	
	-- calc which ships are in our radius, save them in the current stunnables group
	function GRAVWELL_PROTO:CalcStunnableShipsGroup()
		local all_ships = Sobgroup_GetAllActiveShips()
		local ships_in_radius = SobGroup_CreateAndClear("ships-in-radius-" .. self.id)
		SobGroup_FillProximitySobGroup(ships_in_radius, all_ships, self.own_group, GW_MEM.effect_range)
		local stunnable_fill = SobGroup_CreateAndClear("temp-stunnable-ships-" .. self.id .. "-" .. Universe_GameTime())
		for _, ship_type in GW_MEM.target_types do
			local temp_fill_group = SobGroup_CreateAndClear("acc" .. self.id)
			SobGroup_FillShipsByType(temp_fill_group, ships_in_radius, ship_type)
			SobGroup_SobGroupAdd(stunnable_fill, temp_fill_group)
		end
		SobGroup_Overwrite(self.stunnable_ships, stunnable_fill)
		return self
	end
	
	-- applies 'random' multipliers to the pitch/yaw/roll values of the groups tumble vector
	-- random vals are actually a pregenned list indexed using Universe_GameTime()
	function GRAVWELL_PROTO:TumbleGroup()
		local tumble_vector = SobGroup_GetPosition(self.stunnable_ships)
		for i = 1, 3 do
			local spice = GW_MEM.tumble_randtable[GW_MEM.tumble_randtable_index] or 0.5
			GW_MEM.tumble_randtable_index = modulo(floor(abs(Universe_GameTime() * pow(100, i))), getn(GW_MEM.tumble_randtable) + 1)
			tumble_vector[i] = modulo(tumble_vector[i] * spice, 1)
		end
		SobGroup_Tumble(self.stunnable_ships, tumble_vector)
		return self
	end

	GRAVWELL_PROTO.own_group = own_group

	return self:set(ship_id, GRAVWELL_PROTO)
end

-- didnt touch this; sp-only (Fear)
function GW_MEM:Update(CustomGroup, playerIndex, shipID)
	SobGroup_NoSalvageScuttle(CustomGroup)

	if
		(Player_GetLevelOfDifficulty(playerIndex) > 0 and
			Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(-1, "Special_Splitter") == 1)
	 then
		local listCount = getn(GravityWellGeneratorShipList)
		local alliedShips, enemyShips = 0, 0

		for i = 0, Universe_PlayerCount() - 1 do
			if (Player_IsAlive(i) == 1) then
				SobGroup_Clear("GravWell_Temp0")

				for x = 1, listCount do
					SobGroup_FillShipsByType("GravWell_Temp0", "Player_Ships" .. i, GravityWellGeneratorShipList[x])
					SobGroup_SobGroupAdd("GravWell_Temp1", "GravWell_Temp0")
				end

				if (SobGroup_FillProximitySobGroup("GravWell_Temp0", "GravWell_Temp1", CustomGroup, GravityWellDistance) == 1) then
					if (AreAllied(playerIndex, i) == 1) then
						alliedShips = alliedShips + SobGroup_Count("GravWell_Temp0")
					else
						enemyShips = enemyShips + SobGroup_Count("GravWell_Temp0")
					end
				end
			end
		end

		if (enemyShips > 8 and enemyShips > (alliedShips * 2)) then
			SobGroup_CustomCommand(CustomGroup)
		end

		SobGroup_FillShipsByType(
			"GravWell_Temp0",
			"Player_Ships" .. playerIndex,
			PlayerRace_GetString(playerIndex, "def_type_mothership", "")
		)

		if (SobGroup_Count("GravWell_Temp0") > 0) then
			SobGroup_ParadeSobGroup(CustomGroup, "GravWell_Temp0", 0)
		else
			SobGroup_FillShipsByType(
				"GravWell_Temp0",
				"Player_Ships" .. playerIndex,
				PlayerRace_GetString(playerIndex, "def_type_carrier", "")
			)

			if (SobGroup_Count("GravWell_Temp0") > 0) then
				SobGroup_ParadeSobGroup(CustomGroup, "GravWell_Temp0", 0)
			end
		end
	end

	--hw1 mission 12
	SobGroup_CreateIfNotExist("GravwellTeam1")
	SobGroup_CreateIfNotExist("GravwellTeam2")
	SobGroup_CreateIfNotExist("GravwellTeam3")
	if
		SobGroup_GroupInGroup("GravwellTeam1", CustomGroup) == 1 or SobGroup_GroupInGroup("GravwellTeam2", CustomGroup) == 1 or
			SobGroup_GroupInGroup("GravwellTeam3", CustomGroup) == 1
	 then
		SobGroup_AbilityActivate(CustomGroup, AB_Move, 0)
	end
end

function GW_MEM:Destroy(group, player_index, ship_id)
	print("destroy call")
	self:Get(group, player_index, ship_id)
		:SetGroupStunned(0)
		:FreeEscapedShips()
	self:delete(ship_id)
end

---
--- ===== ABILITY: =====
---

function GW_MEM:Start(group, player_index, ship_id)
	local this_gravwell = self:Get(group, player_index, ship_id)
	FX_StartEvent(this_gravwell.own_group, "gravwellon_sfx" .. random(1, 6))
	SobGroup_AbilityActivate(this_gravwell.own_group, AB_Hyperspace, 0)
end

function GW_MEM:Do(group, player_index, ship_id)
	self:Get(group, player_index, ship_id)
		:CalcStunnableShipsGroup() -- calc stunnable ships in radius
		:FreeEscapedShips() -- free any ships which escaped since last pass
		:SetGroupStunned(1) -- sets the stunnable ships to stunned
		:TumbleGroup() -- tumbles the stunned ships
		:Tick() -- play fx, take damage, save stunned group as old stunned group for next run
end

function GW_MEM:Finish(group, player_index, ship_id)
	print("finish call")
	self:Get(group, player_index, ship_id)
		:FreeEscapedShips()
		:SetGroupStunned(0)
	FX_StartEvent(group, "gravwellcollapse_sfx" .. random(1, 3))
	SobGroup_AbilityActivate(group, AB_Hyperspace, 1)
end