-- Ships utility functions

-- Show hw1 production subsystems
function ShowProductionSubsystems(CustomGroup, playerIndex, shipType)
	if Player_HasResearch(playerIndex, "FighterChassis") == 1 or Player_HasResearch(playerIndex, "DefenderSubSystems") == 1 then -- int/bomber tech, defender tech
		SobGroup_CreateSubSystem(CustomGroup, "FighterProduction")
	end
	if Player_HasResearch(playerIndex, "CorvetteDrive") == 1 then -- light vette tech
		SobGroup_CreateSubSystem(CustomGroup, "CorvetteProduction")
	end
	if Player_HasResearch(playerIndex, "CapitalShipDrive") == 1 then -- supp frigate tech
		SobGroup_CreateSubSystem(CustomGroup, "FrigateProduction")
	end
	if Player_HasResearch(playerIndex, "SuperCapitalShipDrive") == 1 then -- carrier tech
		if shipType == "MS" then -- only add capship to mothership
			SobGroup_CreateSubSystem(CustomGroup, "CapShipProduction")
		end
	end
end

-- Disable scuttle while a captured unit is being dropped off by salvage corvettes
function NoSalvageScuttle(CustomGroup, playerIndex, shipID)
	SobGroup_AbilityActivate(CustomGroup, AB_Scuttle, 1 - SobGroup_IsDoingAbility(CustomGroup, AB_Dock))
end

-- When a docking squadron is under attack, they sometimes glitch and stop. This issues another dock order to dock with the closest ship.
function UnderAttackReissueDock(group)
	if (SobGroup_GetCurrentOrder(group) == COMMAND_Dock) then -- en route to dock
		if (SobGroup_UnderAttack(group)) then -- under attack
			if (SobGroup_Count(group) < SobGroup_GetStaticF(group, "buildBatch")) then -- lost one or more members
				if (SobGroup_IsDocked(group) == 0) then -- no member of this squad is docked
					if (SobGroup_GetActualSpeed(group) < 50) then -- probably bugged into stopping - could get unlucky here and catch a pivoting squad
						SobGroup_DockSobGroupWithAny(group)
					end
				end
			end
		end
	end
end

-- allows strike to stay docked with a hyperspacing support frigate
function SupportFrigateHyperspaceDock(CustomGroup, shipID)
	print("ok?")
	if (SobGroup_AreAllInRealSpace(CustomGroup)==1) then
		if (SobGroup_Empty("LatchDockTempGroup"..shipID)==0) then --Exited Hyperspace with ships docked
			if (SobGroup_IsDoingAbility("LatchDockTempGroup"..shipID, AB_Dock)==0) then
				SobGroup_AbilityActivate("LatchDockTempGroup"..shipID, AB_Dock, 1)
				SobGroup_DockSobGroupAndStayDocked("LatchDockTempGroup"..shipID, CustomGroup)
			end
			SobGroup_Clear("LatchDockTempGroup")
			SobGroup_GetSobGroupDockedWithGroup(CustomGroup, "LatchDockTempGroup")
			if (SobGroup_Count("LatchDockTempGroup")>=SobGroup_Count("LatchDockTempGroup"..shipID)) then --All ships docked
				if (SobGroup_Empty("LatchDockTempGroup"..shipID)==0) then
					SobGroup_MakeSelectable("LatchDockTempGroup"..shipID,1)
					SobGroup_SetHidden( "LatchDockTempGroup"..shipID, 0)
					SobGroup_AbilityActivate("LatchDockTempGroup"..shipID, AB_Dock, 1)
					SobGroup_AbilityActivate("LatchDockTempGroup"..shipID, AB_Scuttle, 1)
					SobGroup_AbilityActivate("LatchDockTempGroup"..shipID, AB_Attack, 1)
					SobGroup_Clear("LatchDockTempGroup"..shipID)
				end
			end
		elseif(SobGroup_GetROE(CustomGroup)==0)then --In Offensive ROE, launch all ships
			SobGroup_Clear("LatchDockTempGroup")
			SobGroup_GetSobGroupDockedWithGroup(CustomGroup, "LatchDockTempGroup")
			SobGroup_Launch("LatchDockTempGroup", CustomGroup)
		elseif(SobGroup_GetROE(CustomGroup)==2)then --In Passive ROE, all ships stay docked
			SobGroup_GetSobGroupDockedWithGroup(CustomGroup, "LatchDockTempGroup")
			SobGroup_ForceStayDockedIfDocking("LatchDockTempGroup")
			SobGroup_Clear("LatchDockTempGroup")
		end
	elseif (SobGroup_Empty("LatchDockTempGroup"..shipID)==1) then --Hyperspacing, get all ships docked with
		SobGroup_GetSobGroupDockedWithGroup(CustomGroup, "LatchDockTempGroup"..shipID)
		SobGroup_AbilityActivate(CustomGroup, AB_Lights, 0)
		SobGroup_MakeSelectable("LatchDockTempGroup"..shipID,0)
		SobGroup_SetHidden( "LatchDockTempGroup"..shipID, 1)
		SobGroup_AbilityActivate("LatchDockTempGroup"..shipID, AB_Dock, 0)
		SobGroup_AbilityActivate("LatchDockTempGroup"..shipID, AB_Scuttle, 0)
		SobGroup_AbilityActivate("LatchDockTempGroup"..shipID, AB_Attack, 0)
	else --Hyperspacing with ships docked
		if (SobGroup_AreAllInHyperspace("LatchDockTempGroup"..shipID)==0)and(SobGroup_CanDoAbility(CustomGroup,AB_Lights)==0) then --Entering Hyperspace
			SobGroup_Despawn("LatchDockTempGroup"..shipID)
		elseif (SobGroup_AreAllInHyperspace("LatchDockTempGroup"..shipID)==1)and(SobGroup_AreAllInHyperspace(CustomGroup)==1) then --All In Hyperspace
			SobGroup_AbilityActivate(CustomGroup, AB_Lights, 1)
		elseif (SobGroup_AreAllInHyperspace(CustomGroup)==0)and(SobGroup_CanDoAbility(CustomGroup,AB_Lights)==1) then --Exiting Hyperspace
			Volume_AddSphere("LatchDockTempVolume", SobGroup_GetPosition(CustomGroup), 0)
			SobGroup_Spawn("LatchDockTempGroup"..shipID, "LatchDockTempVolume")
			Volume_Delete("LatchDockTempVolume")
		end
	end
end

-- Group management --
-- Use this object to persist memory across script calls.
--
-- This is just a global table of tables with a small api.
-- MemGroups represents an associative array of ship groups.
-- The groups themselves also come with a default set of accessors,
-- which can be extended via custom_attribs when creating the group.
--
-- Accessing the groups themselves is not recommended, but obviously
-- entirely possible.

MemGroup = {
	_groups = {},
	-- _new
	-- 1: group_name: string
	-- 2: custom_attribs: table<any, any>
	--
	-- return: MemGroup
	--
	-- Internal function. Creates a new MemGroup on the _groups
	-- table. MemGroups are tables of Entities. Entities are tables
	-- with the following attributes:
	-- [entity]:
	--   _tick: string
	--   GetTick: function() => number
	--   NextTick: function() => number
	-- In addition, the entities will also host the attributes defined
	-- in custom_attributes.
	_new = function(group_name, custom_attribs)
		local new_group = {
			_entities = {},
			group_name = group_name,
		}
		for i, v in custom_attribs do
			new_group[i] = v
		end
		function new_group:get(entityID)
			return self._entities[entityID]
		end
		function new_group:set(entityID, entity)
			if (entity == nil) then
				entity = {}
			end
			self._entities[entityID] = entity
			local e = self._entities[entityID]
			if (e._tick == nil) then
				e._tick = 0
			end
			function e:NextTick()
				self._tick = self._tick + 1
				if (self._tick >= 127) then
					self._tick = 0
				end
				return self._tick
			end
			function e:GetTick()
				return self._tick
			end
			return e
		end
		function new_group:delete(entityID)
			self._entities[entityID] = nil
		end
		return new_group
	end,
	-- Create
	-- 1: group_name: string
	-- 2: custom_attribs: table<any: any>
	--
	-- return: MemGroup
	--
	-- 'Soft' creation of group. If the group already exists, the already
	-- present group is returned instead.
	Create = function (group_name, custom_attribs)
		if (MemGroup._groups[group_name] == nil) then
			return MemGroup.ForceCreate(group_name, custom_attribs)
		end
		return MemGroup._groups[group_name]
	end,

	-- ForceCreate
	-- 1: group_name: string
	-- 2: custom_attribs: table<any: any>
	--
	-- return: MemGroup
	--
	-- 'Hard' creation of group. If a group with this name already exists,
	-- it will be silently overwritten. Internally calls _new.
	ForceCreate = function (group_name, custom_attribs)
		if custom_attribs == nil then
			custom_attribs = {}
		end
		MemGroup._groups[group_name] = MemGroup._new(group_name, custom_attribs)
		return MemGroup._groups[group_name]
	end,

	-- Get
	-- 1: group_name: string
	--
	-- return: MemGroup
	--
	-- Returns the group indexed by group_name.
	Get = function (group_name)
		return MemGroup._groups[group_name]
	end,

	-- Exists
	-- 1: group_name
	--
	-- return: boolean
	--
	-- Checks the existence of the group indexed by group_name
	Exists = function (group_name)
		return MemGroup._groups[group_name] ~= nil
	end
}