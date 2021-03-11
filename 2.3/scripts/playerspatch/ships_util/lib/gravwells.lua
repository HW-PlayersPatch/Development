
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
	increment_count = 20,
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
	function GRAVWELL_PROTO:SelfEffects()
		-- print("[" .. self.id .. "]:SelfEffects start")
		FX_StartEvent(self.own_group, "PowerUp")
		SobGroup_TakeDamage(self.own_group, GW_MEM.tick_self_damage)
		-- print("[" .. self.id .. "]:SelfEffects end")
		return self
	end
	
	-- calc which ships are in our radius, save them in the current stunnables group
	function GRAVWELL_PROTO:CalcStunnableShipsGroup()
		-- print("[" .. self.id .. "]:CalcStunnableShipsGroup start")
		local all_ships = Universe_GetAllActiveShips()
		local ships_in_radius = SobGroup_CreateAndClear("ships-in-radius-" .. self.id)
		local any_stunnables = SobGroup_FillProximitySobGroup(ships_in_radius, all_ships, self.own_group, GW_MEM.effect_range * 2)
		if (any_stunnables == 1) then
			local stunnable_fill = SobGroup_CreateAndClear("temp-stunnable-ships-" .. self.id)
			for _, ship_type in GW_MEM.target_types do
				local temp_fill_group = SobGroup_CreateAndClear("acc" .. self.id)
				SobGroup_FillShipsByType(temp_fill_group, ships_in_radius, ship_type)
				local is_salvager = SobGroup_AreAnyOfTheseTypes(temp_fill_group, GW_MEM.salvager_types)
				if (is_salvager ~= 1) then
					SobGroup_SobGroupAdd(stunnable_fill, temp_fill_group)
				end
			end
			SobGroup_Overwrite(self.stunnable_ships, stunnable_fill)
		end
		-- print("[" .. self.id .. "]:CalcStunnableShipsGroup end")
		return self
	end

	-- It seems like setting attributes all at once on large sobgroups (or, maybe sobgroups more prone to client desyncing through size?)
	-- can cause syncing. The old code went out of its way to only apply effects in an incremental spherefill style (like an onion), which I
	-- gutted assuming it was just a mistake or relic of a previous iteration of the script. This fn goes through ships within 0-effect_range
	-- in incremental spheres of increasing size, subtract the spheres checked before - this means we are only applying effects to ships on the current
	-- 'layer' (again, think like an onion). The thickness of these layers is important, since its assumed the entire purpose is to prevent syncs
	-- on doing stuff to large groups. This is also how ships are freed (stun/unstun and the ranges to iterate through are passable)
	function GRAVWELL_PROTO:IncrementalStunAndTumble(stun, range_start, range_end, increment_count)
		-- print("[" .. self.id .. "]:IncrementalStunAndTumble start")
		if (range_start == nil) then
			range_start = 0
		end
		if (range_end == nil) then
			range_end = GW_MEM.effect_range
		end
		if (increment_count == nil) then
			increment_count = GW_MEM.increment_count
		end
		if (stun == nil) then
			stun = 1
		end
		local inner_exclude = SobGroup_CreateAndClear("gravwell-inner-exclude-" .. self.id)
		local range_sans_inner = SobGroup_CreateAndClear("gravwell-range-sans-inner-" .. self.id)
		for range = range_start, range_end, range_end / increment_count do
			-- print("range: [" .. range .. " / " .. range_end .. "]")
			local got_ships = SobGroup_FillProximitySobGroup(self.range_groups.this_range, self.stunnable_ships, self.own_group, range)
			if (range_start > 0) then
				-- print("try excluding from 0 - " .. range_start)
				SobGroup_FillProximitySobGroup(inner_exclude, self.stunnable_ships, self.own_group, range_start) -- 0 to inner
				SobGroup_FillSubstract(range_sans_inner, self.range_groups.this_range, inner_exclude) -- exclude inner range from search
				-- print("rg-tr: " .. SobGroup_Count(self.range_groups.this_range))
				-- print("range-sans-inner: " .. SobGroup_Count(range_sans_inner))
				SobGroup_Overwrite(self.range_groups.this_range, range_sans_inner)
				-- print("rg-tr': " .. SobGroup_Count(self.range_groups.this_range))
			end
			if (got_ships == 1) then
				-- print("got ships")
				SobGroup_FillSubstract(self.range_groups.todo, self.range_groups.this_range, self.range_groups.already_passed)
				if (SobGroup_Count(self.range_groups.todo) >= 1) then
					-- print("ok, try to affect " .. SobGroup_Count(self.range_groups.todo) .. " ships")
					-- print("stun: " .. stun)
					-- stun/tumble or unstun/cleartumble the todo group:
					SobGroup_SetGroupStunned(self.range_groups.todo, stun)
					if (stun == 1) then
						self:TumbleGroup(self.range_groups.todo)
					else
						SobGroup_ClearTumble(self.range_groups.todo)
					end
				end
				SobGroup_SobGroupAdd(self.range_groups.already_passed, self.range_groups.todo)
				SobGroup_Clear(self.range_groups.todo)
			end
		end
		SobGroup_Copy(self.old_stunnable_ships, self.range_groups.already_passed)
		SobGroup_Clear(self.range_groups.already_passed)
		-- print("[" .. self.id .. "]:IncrementalStunAndTumble end")
		return self
	end

	-- applies 'random' multipliers to the pitch/yaw/roll values of the groups tumble vector
	-- random vals are actually a pregenned list indexed using Universe_GameTime()
	function GRAVWELL_PROTO:TumbleGroup(group)
		-- print("[" .. self.id .. "]:TumbleGroup start")
		local tumble_vector = SobGroup_GetPosition(group)
		for i = 1, 3 do
			local spice = GW_MEM.tumble_randtable[GW_MEM.tumble_randtable_index] or 0.5
			GW_MEM.tumble_randtable_index = modulo(GW_MEM.tumble_randtable_index + 1, getn(GW_MEM))
			tumble_vector[i] = modulo(tumble_vector[i] * spice, 0.45)
		end
		SobGroup_Tumble(group, tumble_vector)
		-- print("[" .. self.id .. "]:TumbleGroup end")
		return self
	end

	-- frees any ships in the old group which aren't in the current group
	function GRAVWELL_PROTO:FreeEscapedShips()
		-- print("[" .. self.id .. "]:FreeEscapedShips start")
		-- basically just free anything outside the effect range
		local ships_in_double_range = SobGroup_CreateAndClear("gravwell-doublerange-" .. self.id)
		local any_to_free = SobGroup_FillProximitySobGroup(ships_in_double_range, self.stunnable_ships, self.own_group, GW_MEM.effect_range * 2)
		if (any_to_free == 1) then
			self:IncrementalStunAndTumble(0, GW_MEM.effect_range, GW_MEM.effect_range * 2, 5)
		end
		-- print("[" .. self.id .. "]:FreeEscapedShips end")
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
		:IncrementalStunAndTumble(0)
		:FreeEscapedShips()
	self:delete(ship_id)
end

---
--- ===== ABILITY: =====
---

function GW_MEM:Start(group, player_index, ship_id)
	local this_gravwell = self:Get(group, player_index, ship_id)
	print("GW " .. ship_id .. " START")
	-- printTbl(this_gravwell)
	FX_StartEvent(this_gravwell.own_group, "gravwellon_sfx" .. 1)
	SobGroup_AbilityActivate(this_gravwell.own_group, AB_Hyperspace, 0)
	print("END GW " .. ship_id .. " START")
end

function GW_MEM:Do(group, player_index, ship_id)
	print("GW " .. ship_id .. " DO")
	self:Get(group, player_index, ship_id)
		:SelfEffects()
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