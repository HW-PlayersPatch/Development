-- Doesn't appear to be global across units
-- inhibitors = {}

function Update_NoSalvageScuttle(CustomGroup, playerIndex, shipID)
	-- Hack to disable scuttle while a unit is being dropped off by salvage corvettes
	SobGroup_AbilityActivate(CustomGroup, AB_Scuttle, 1 - SobGroup_IsDoingAbility(CustomGroup, AB_Dock))
end

-- This combined function is somewhat redundant however it makes it so that not all ships need a Lua file
-- This is because you can only have one update function per call to addCustomCode IIRC
function Update_NoSalvageScuttleHyperspaceInhibitor(CustomGroup, playerIndex, shipID)
	Update_NoSalvageScuttle(CustomGroup, playerIndex, shipID)
	--Update_HyperspaceInhibitor(CustomGroup, playerIndex, shipID)
end


function PlayersPatch_UnderAttackReissueDock(group)
	if (SobGroup_IsDocked(group) == 0) then -- no member of this squad is docked
		if (SobGroup_GetCurrentOrder(group) == COMMAND_Dock) then -- en route to dock
			if (SobGroup_UnderAttack(group)) then -- under attack
				if (SobGroup_Count(group) < SobGroup_GetStaticF(group, "buildBatch")) then -- lost one or more members
					if (SobGroup_GetActualSpeed(group) < 50) then -- probably bugged into stopping - could get unlucky here and catch a pivoting squad
						SobGroup_DockSobGroupWithAny(group)
					end
				end
			end
		end
	end
end

-- tech exposure (2.4) [Fear]
-- called infrequently, don't care about not running this code if its redundant
function PlayersPatch_BuildNecessaryProductionTells(CustomGroup, playerIndex)
	if Player_HasResearch(playerIndex, "FighterChassis") == 1 or Player_HasResearch(playerIndex, "DefenderSubSystems") == 1 then -- int/bomber tech, defender tech
		SobGroup_CreateSubSystem(CustomGroup, "FighterProduction")
	end
	if Player_HasResearch(playerIndex, "CorvetteDrive") == 1 then -- light vettes
		SobGroup_CreateSubSystem(CustomGroup, "CorvetteProduction")
	end
	if Player_HasResearch(playerIndex, "CapitalShipDrive") == 1 then -- supp frigates
		SobGroup_CreateSubSystem(CustomGroup, "FrigateProduction")
	end
	if Player_HasResearch(playerIndex, "SuperCapitalShipDrive") == 1 then -- carriers
		SobGroup_CreateSubSystem(CustomGroup, "CapShipProduction")
	end
end
