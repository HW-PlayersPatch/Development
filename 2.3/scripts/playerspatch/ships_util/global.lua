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

-- returns a group of all active ships for all players
function Sobgroup_GetAllActiveShips(target_group)
	local all_ships = "all-ships"
	SobGroup_CreateIfNotExist(all_ships)
	for i = 0, Universe_PlayerCount() - 1 do
		SobGroup_SobGroupAdd(all_ships, "Player_Ships" .. i)
	end
	if (target_group ~= nil) then
		SobGroup_CreateIfNotExist(target_group)
		SobGroup_Clear(target_group)
		SobGroup_SobGroupAdd(target_group, all_ships)
		return target_group
	end
	return all_ships
end

-- multiplies the ship's max-speed multiplier by 'mult'
function SobGroup_AlterSpeedMult(target_group, mult)
	if (mult == nil) then
		mult = 1/2
	end
	local speed_mult = SobGroup_GetSpeed(target_group) * mult
	if (speed_mult < 0.05) then
		speed_mult = 0
	end
	SobGroup_SetSpeed(target_group, speed_mult)

	return target_group
end