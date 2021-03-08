
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
	salvager_types = "kus_salvagecorvette, tai_salvagecorvette",
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
		old_stunnable_ships = SobGroup_CreateAndClear("gravwell-" .. ship_id .. "-stunnable-old"),
		range_groups = {
			already_passed = SobGroup_CreateAndClear("gravwell-" .. ship_id .. "-rg-ap"),
			this_range = SobGroup_CreateAndClear("gravwell-" .. ship_id .."-rg-tr"),
			todo = SobGroup_CreateAndClear("gravwell-" .. ship_id .. "-td")
		}
	} -- instance static data/methods
	
	-- should be called once, essentially a housekeep for the gravwell
	-- plays glow fx, applies self damage, and saves the stunned group for the next pass
	function GRAVWELL_PROTO:Tick()
		print("[" .. self.id .. "]:Tick start")
		FX_StartEvent(self.own_group, "PowerUp")
		SobGroup_TakeDamage(self.own_group, GW_MEM.tick_self_damage)
		SobGroup_Overwrite(self.old_stunnable_ships, self.stunnable_ships)
		print("[" .. self.id .. "]:Tick end")
	end
	
	-- calc which ships are in our radius, save them in the current stunnables group
	function GRAVWELL_PROTO:CalcStunnableShipsGroup()
		print("[" .. self.id .. "]:CalcStunnableShipsGroup start")
		local all_ships = Universe_GetAllActiveShips()
		local ships_in_radius = SobGroup_CreateAndClear("ships-in-radius-" .. self.id)
		local any_stunnables = SobGroup_FillProximitySobGroup(ships_in_radius, all_ships, self.own_group, GW_MEM.effect_range)
		if (any_stunnables == 1) then
			local stunnable_fill = SobGroup_CreateAndClear("temp-stunnable-ships-" .. self.id)
			for _, ship_type in GW_MEM.target_types do
				local temp_fill_group = SobGroup_CreateAndClear("acc" .. self.id)
				SobGroup_FillShipsByType(temp_fill_group, ships_in_radius, ship_type)
				local is_salvager = SobGroup_AreAnyOfTheseTypes(temp_fill_group, self.salvager_types)
				if (is_salvager ~= 1) then
					SobGroup_SobGroupAdd(stunnable_fill, temp_fill_group)
				end
			end
			SobGroup_Overwrite(self.stunnable_ships, stunnable_fill)
		end
		print("[" .. self.id .. "]:CalcStunnableShipsGroup end")
		return self
	end

	function GRAVWELL_PROTO:IncrementalStunAndTumble(stun)
		if (stun == nil) then
			stun = 1
		end
		for range = 0, self.effect_range, self.effect_range / 20 do
			local got_ships = SobGroup_FillProximitySobGroup(self.range_groups.this_range, self.stunnable_ships, self.own_group, range)
			if (got_ships == 1) then
				SobGroup_FillSubstract(self.range_groups.todo, self.range_groups.this_range, self.range_groups.already_passed)
				-- stun/tumble or unstun/cleartumble the todo group:
				SobGroup_SetGroupStunned(self.range_groups.todo, stun)
				if (stun) then
					self:TumbleGroup(self.range_groups.todo)
				else
					SobGroup_ClearTumble(self.range_groups.todo)
				end
			end
		end
		return self
	end

	-- applies 'random' multipliers to the pitch/yaw/roll values of the groups tumble vector
	-- random vals are actually a pregenned list indexed using Universe_GameTime()
	function GRAVWELL_PROTO:TumbleGroup(group)
		print("[" .. self.id .. "]:TumbleGroup start")
		local tumble_vector = SobGroup_GetPosition(group)
		for i = 1, 3 do
			local spice = GW_MEM.tumble_randtable[GW_MEM.tumble_randtable_index] or 0.5
			GW_MEM.tumble_randtable_index = modulo(GW_MEM.tumble_randtable_index + 1, getn(GW_MEM))
			tumble_vector[i] = modulo(tumble_vector[i] * spice, 0.45)
		end
		SobGroup_Tumble(group, tumble_vector)
		print("[" .. self.id .. "]:TumbleGroup end")
		return self
	end

	-- frees any ships in the old group which aren't in the current group
	function GRAVWELL_PROTO:FreeEscapedShips()
		print("[" .. self.id .. "]:FreeEscapedShips start")
		local escaped_ships = SobGroup_CreateAndClear("escaped-ships" .. "-" .. self.id)
		if (SobGroup_Count(self.old_stunnable_ships) > 0) then
			local temp_fill_group = SobGroup_CreateAndClear("escaped-ships-temp" .. "-" .. self.id)
			SobGroup_FillSubstract(temp_fill_group, self.old_stunnable_ships, self.stunnable_ships)
			SobGroup_SobGroupAdd(escaped_ships, temp_fill_group)
			if (SobGroup_Count(escaped_ships) > 0) then
				SobGroup_SetGroupStunned(escaped_ships, 0)
				SobGroup_ClearTumble(escaped_ships)
			end
		end
		print("[" .. self.id .. "]:FreeEscapedShips end")
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
	print("GW " .. ship_id .. " START")
	printTbl(this_gravwell)
	FX_StartEvent(this_gravwell.own_group, "gravwellon_sfx" .. 1)
	SobGroup_AbilityActivate(this_gravwell.own_group, AB_Hyperspace, 0)
	print("END GW " .. ship_id .. " START")
end

function GW_MEM:Do(group, player_index, ship_id)
	print("GW " .. ship_id .. " DO")
	self:Get(group, player_index, ship_id)
		:CalcStunnableShipsGroup()
		:IncrementalStunAndTumble(1)
		:FreeEscapedShips()
	print("END GW " .. ship_id .. " DO")
end

function GW_MEM:Finish(group, player_index, ship_id)
	print("GW " .. ship_id .. " FINISH")
	self:Get(group, player_index, ship_id)
		:IncrementalStunAndTumble(0)
		:FreeEscapedShips()
	FX_StartEvent(group, "gravwellcollapse_sfx" .. 1)
	SobGroup_AbilityActivate(group, AB_Hyperspace, 1)
	print("END GW " .. ship_id .. " DO")
end