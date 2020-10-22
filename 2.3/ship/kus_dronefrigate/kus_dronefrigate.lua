-- Drone frigate improved drone behavior (fire while moving)
-- By: Fear

DF_MEM = MemGroup.Create('drone_frigates', {
	too_far_die_distance = 950,
	max_ticks_to_finish = 6,
	max_drone_count = 14,
	--dronefrig_weapon_range = 2660,
	parade_positions = {
		{210, 0, 0+10},
		{-210, 0, 0+10},
		{0, 210, 0+10},
		{0, -210, 0+10},
		{0, 0, 210+10},
		{0, 0, -210+10},
		{120, 120, 120+10},
		{-120, 120, 120+10},
		{120, -120, 120+10},
		{-120, -120, 120+10},
		{120, 120, -120+10},
		{-120, 120, -120+10},
		{120, -120, -120+10},
		{-120, -120, -120+10},
		{1050, -525, 700}
	}
})

function Drone_GetParadePosition(frigate_position, drone_index)
	local parade_position = {}
	for i, v in frigate_position do
		parade_position[i] = v + DF_MEM.parade_positions[drone_index + 1][i]
	end
	return parade_position
end

function DroneFrigate_IsReady(frigate)
	return (SobGroup_IsDoingAbility(frigate, AB_Hyperspace) == 0 and
	SobGroup_IsDoingAbility(frigate, AB_HyperspaceViaGate) == 0 and
	SobGroup_AreAllInRealSpace(frigate) == 1 and
	SobGroup_IsDoingAbility(frigate, AB_Dock) == 0 and
	SobGroup_IsDoingAbility(frigate, AB_Retire) == 0 and
	SobGroup_AnyBeingCaptured(frigate) == 0)
end

function CreateNewDrone(index, drone, frigate, frigate_id)
	SobGroup_CreateIfNotExist(drone)
	if SobGroup_Count(drone) == 0 and -- group for this drone is empty, create the drone and add to group
		DroneFrigate_IsReady(frigate) then
		local new_drone = SobGroup_CreateShip(frigate, "kus_drone" .. index) -- CreateShip simulates a build completion - ship will be launched from parent
		SobGroup_SobGroupAdd(drone, new_drone)
		SobGroup_SobGroupAdd("all_drones" .. frigate_id, drone)
		if index == 0 or index == 4 or index == 8 or index == 12 then
			FX_StartEvent(frigate, "dronelaunch1")
		elseif index == 1 or index == 5 or index == 9 or index == 13 then
			FX_StartEvent(frigate, "dronelaunch2")
		elseif index == 2 or index == 6 or index == 10 then
			FX_StartEvent(frigate, "dronelaunch3")
		elseif index == 3 or index == 7 or index == 11 then
			FX_StartEvent(frigate, "dronelaunch4")
		end
	end
end

function Drone_LaunchIfPossible(index, drone, frigate)
	if SobGroup_IsDockedSobGroup(drone, frigate) == 1 then-- drone was docked
		if DroneFrigate_IsReady(frigate) then
			SobGroup_Launch(drone, frigate)
			if index == 0 or index == 4 or index == 8 or index == 12 then
				FX_StartEvent(frigate, "dronelaunch1")
			elseif index == 1 or index == 5 or index == 9 or index == 13 then
				FX_StartEvent(frigate, "dronelaunch2")
			elseif index == 2 or index == 6 or index == 10 then
				FX_StartEvent(frigate, "dronelaunch3")
			elseif index == 3 or index == 7 or index == 11 then
				FX_StartEvent(frigate, "dronelaunch4")
			end
			local left_with = "left_overs"
			SobGroup_CreateAndClear(left_with)
			SobGroup_GetSobGroupDockedWithGroup(frigate, left_with)
		end
	end
end

function Drone_SetActive(drone, active)
	SobGroup_AbilityActivate(drone, AB_Attack, active)
	SobGroup_AbilityActivate(drone, AB_Targeting, active)
end

function Start_DroneFrigate(CustomGroup, playerIndex, shipID)
	local r = random(1,6)
	FX_StartEvent(CustomGroup, "dronelaunch_sfx"..r)
	for k = 0, DF_MEM.max_drone_count - 1 do
		local this_drone = "kus_drone" .. tostring(shipID) .. tostring(k)
		if (SobGroup_Count(this_drone) == 0) then
			CreateNewDrone(k, this_drone, CustomGroup, shipID)
		end
	end
	local this_df = DF_MEM:get(shipID)
	this_df.attempting_finish = 0
end

function Do_DroneFrigate(CustomGroup, playerIndex, shipID)
	local docked_with_frigate_group = "docked_with_" .. shipID
	SobGroup_CreateAndClear(docked_with_frigate_group)
	SobGroup_GetSobGroupDockedWithGroup(CustomGroup, docked_with_frigate_group)
	for k = 0, DF_MEM.max_drone_count - 1 do
		local this_drone = "kus_drone" .. tostring(shipID) .. tostring(k)
		if (SobGroup_Count(this_drone) == 0) then
			CreateNewDrone(k, this_drone, CustomGroup, shipID)
		else
			Drone_LaunchIfPossible(k, this_drone, CustomGroup)
		end
	end
end

function Finish_DroneFrigate(CustomGroup, playerIndex, shipID)
	local r = random(1,6)
	FX_StartEvent(CustomGroup, "droneretract_sfx"..r)
	for k = 0, SobGroup_Count("all_drones" .. shipID) - 1 do
		local this_drone = "kus_drone" .. tostring(shipID) .. tostring(k)
		if SobGroup_Empty(this_drone) == 0 then
			SobGroup_AbilityActivate(this_drone, AB_Targeting, 0)
			SobGroup_AbilityActivate(this_drone, AB_Attack, 0)
			SobGroup_DockSobGroupAndStayDocked(this_drone, CustomGroup)
		end
	end
	local this_df = DF_MEM:get(shipID)
	this_df.ticks_since_finish_call = 0
	this_df.attempting_finish = 1
end

-----------------------------------------------------------------------------------

function Create_DroneFrigate(CustomGroup, playerIndex, shipID)
	SobGroup_SetSwitchOwnerFlag(CustomGroup, 0)
	SobGroup_CreateIfNotExist("all_drones" .. shipID)
	SobGroup_CreateIfNotExist("frigate_attack_targets" .. shipID)
	SobGroup_CreateIfNotExist("drone_attack_targets" .. shipID)

	DF_MEM:set(shipID, {
		ticks_since_finish_call = 0,
		attempting_finish = 0
	})
end

function Update_DroneFrigate(CustomGroup, playerIndex, shipID)
	local this_df = DF_MEM:get(shipID)
	SobGroup_NoSalvageScuttle(CustomGroup, playerIndex, shipID)
	-- forces AI cpu drone activation if enemy ships are nearby
	if Player_GetLevelOfDifficulty(playerIndex) > 0 then
		if SobGroup_IsDoingAbility(CustomGroup, AB_Custom) == 0 then
			local playerIndex_ai = 0
			local enemyships = 0
			while playerIndex_ai < Universe_PlayerCount() do
				if Player_IsAlive(playerIndex_ai) == 1 then
					local distance = 4000
					if SobGroup_FillProximitySobGroup(SobGroup_CreateAndClear("temp_" .. shipID), "Player_Ships"..playerIndex_ai, CustomGroup, distance) == 1 then
						if AreAllied(playerIndex, playerIndex_ai) == 0 then
							enemyships = 1
						end
					end
				end
				playerIndex_ai = playerIndex_ai + 1
			end
			if enemyships > 0 then
				if DroneFrigate_IsReady(CustomGroup) then
					SobGroup_CustomCommand(CustomGroup)
				end
			end
		end
	end
	local should_quickdock = this_df.attempting_finish == 1 and this_df.ticks_since_finish_call >= DF_MEM.max_ticks_to_finish
	for k = 0, SobGroup_Count("all_drones" .. shipID) - 1 do
		local this_drone = "kus_drone" .. tostring(shipID) .. tostring(k)
		SobGroup_SetROE(this_drone, SobGroup_GetROE(CustomGroup))
		if (should_quickdock) then
			SobGroup_DockSobGroupInstant(this_drone, CustomGroup)
			this_df.attempting_finish = 0
			this_df.ticks_since_finish_call = 0
		else
			Drone_SetActive(this_drone, 1)
			if SobGroup_Empty(this_drone) == 0 then
				if SobGroup_IsDockedSobGroup(this_drone, CustomGroup) == 0 and SobGroup_IsDoingAbility(this_drone, AB_Dock) == 0 then
					if SobGroup_GetDistanceToSobGroup(this_drone, CustomGroup) > DF_MEM.too_far_die_distance then -- too far from frigate, die
						SobGroup_TakeDamage(this_drone, 1)
					elseif (SobGroup_AnyAreAttacking(CustomGroup) == 1) then -- override our target to attack anything the frigate itself is attacking
						local frigate_attack_targets = "frigate_attack_targets" .. shipID
						SobGroup_GetCommandTargets(frigate_attack_targets, CustomGroup, COMMAND_Attack)
						SobGroup_Attack(playerIndex, this_drone, frigate_attack_targets)
					elseif SobGroup_GetROE(CustomGroup) == PassiveROE then
						Drone_SetActive(this_drone, 0)
						SobGroup_ParadeSobGroup(this_drone, CustomGroup, 0)
					end
					if (SobGroup_AnyAreAttacking(this_drone) == 1) then -- this check is seperate so the frigate can (uniquely) do move commands while shooting
						local parade_position = Drone_GetParadePosition(SobGroup_GetPosition(CustomGroup), k)
						if SobGroup_GetDistanceToParade(this_drone, parade_position) > 25 then -- too far from parade, move closer
							SobGroup_MoveToPoint(SobGroup_GetPlayerOwner(this_drone), this_drone, parade_position) -- move close to parade position
						end
					else
						SobGroup_ParadeSobGroup(this_drone, CustomGroup, 0) -- reform parade around frigate
					end
				end
			end
			if (SobGroup_OwnedBy(this_drone) ~= playerIndex or not DroneFrigate_IsReady(CustomGroup)) then
				SobGroup_TakeDamage(this_drone, 1)
				--SobGroup_DockSobGroupInstant("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup)
			end
		end
	end

	this_df:NextTick()
	if (this_df.attempting_finish == 1) then
		this_df.ticks_since_finish_call = this_df.ticks_since_finish_call + 1
	end
end

function Destroy_DroneFrigate(CustomGroup, playerIndex, shipID)
	for k = 0,SobGroup_Count("all_drones" .. shipID) - 1,1 do
		local this_drone = "kus_drone" .. tostring(shipID) .. tostring(k)
		if SobGroup_Empty(this_drone) == 0 then
			SobGroup_TakeDamage(this_drone, 1)
		end
	end
	DF_MEM:delete(shipID)
end

function SobGroup_GetDistanceToSobGroup(sg_Group1, sg_Group2)
	if SobGroup_Empty(sg_Group1) == 0 and SobGroup_Empty(sg_Group2) == 0 then
		local t_position1 = SobGroup_GetPosition(sg_Group1)
		local t_position2 = SobGroup_GetPosition(sg_Group2)
		local li_distance = floor(sqrt((t_position1[1] - t_position2[1])*(t_position1[1] - t_position2[1]) + (t_position1[2] - t_position2[2])*(t_position1[2] - t_position2[2]) + (t_position1[3] - t_position2[3])*(t_position1[3] - t_position2[3])))
		return li_distance
	else
		return 0
	end
end

function SobGroup_GetDistanceToParade(sg_Group1, parade_pos)
	if SobGroup_Empty(sg_Group1) == 0 then
		local t_position1 = SobGroup_GetPosition(sg_Group1)
		local t_position2 = parade_pos
		local li_distance = floor(sqrt((t_position1[1] - t_position2[1])*(t_position1[1] - t_position2[1]) + (t_position1[2] - t_position2[2])*(t_position1[2] - t_position2[2]) + (t_position1[3] - t_position2[3])*(t_position1[3] - t_position2[3])))
		return li_distance
	else
		return 0
	end
end
