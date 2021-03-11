if (GLOBAL_LIB_IMPORTED == nil or GLOBAL_LIB_IMPORTED == 0) then
	dofilepath("data:scripts/playerspatch/playerspatch_ships_util.lua")
	GLOBAL_LIB_IMPORTED = 1
end

function Create_Hgn_Carrier(CustomGroup, playerIndex, shipID)  
	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") == 0 then
		if playerIndex == Universe_CurrentPlayer() then
			UI_SetElementVisible("NewResearchMenu", "NonCombat", 0);
		end	
	end	
end

function Update_Hgn_Carrier(CustomGroup, playerIndex, shipID)	  
	--SobGroup_CreateIfNotExist("hgn_carrier"..playerIndex)	
	--SobGroup_Clear("hgn_carrier"..playerIndex)
	--SobGroup_SobGroupAdd("hgn_carrier"..playerIndex, CustomGroup)	
	SobGroup_NoSalvageScuttle(CustomGroup, playerIndex, shipID)
end
