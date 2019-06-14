function Load_Tai_Destroyer(playerIndex)
	SobGroup_CreateIfNotExist("Defector")		
end

function Create_Tai_Destroyer(CustomGroup, playerIndex, shipID) 	
	SobGroup_CreateIfNotExist("Defector")			
end

function Update_Tai_Destroyer(CustomGroup, playerIndex, shipID)
	SobGroup_AbilityActivate(CustomGroup, AB_Scuttle, 1 - SobGroup_IsDoingAbility(CustomGroup, AB_Dock))
	SobGroup_CreateIfNotExist("Defector")				
	if SobGroup_GroupInGroup("Defector", CustomGroup) == 1 then
		if SobGroup_GetHardPointHealth(CustomGroup, "Engine") < 1 then			
			SobGroup_SetHardPointHealth(CustomGroup, "Engine", 1)
		end
	end
end
