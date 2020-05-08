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