-- global.lua
-- For any functionality which isn't ship/race specific
-- By: Fear, QuadS

-- Disable scuttle while a captured unit is being dropped off by salvage corvettes
function SobGroup_NoSalvageScuttle(CustomGroup)
	SobGroup_AbilityActivate(CustomGroup, AB_Scuttle, 1 - SobGroup_IsDoingAbility(CustomGroup, AB_Dock))
end

-- When a docking squadron is under attack, they sometimes glitch and stop. This issues another dock order to dock with the closest ship.
function SobGroup_UnderAttackReissueDock(group)
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

-- Checks to see if any ship in `group` is being captured
function SobGroup_AnyBeingCaptured(group)
	local group_being_captured = group .. "_being_captured"
	SobGroup_CreateAndClear(group_being_captured)
	SobGroup_GetSobGroupBeingCapturedGroup(group, group_being_captured)
	if (SobGroup_Count(group_being_captured) > 0) then
		return 1
	end
	return 0
end

-- Checks to see if any ship in `group` has attack targets
function SobGroup_AnyAreAttacking(group)
	local group_attacking = group .. "_attacking"
	SobGroup_CreateAndClear(group_attacking)
	SobGroup_GetCommandTargets(group_attacking, group, COMMAND_Attack)
	if (SobGroup_Count(group_attacking) > 0) then
		return 1
	end
	return 0
end

-- Creates a new sobgroup if one doesn't exist, then clears the group to ensure
-- the group referenced by the return string is clear.
function SobGroup_CreateAndClear(name)
	SobGroup_CreateIfNotExist(name)
	SobGroup_Clear(name)
	return name;
end