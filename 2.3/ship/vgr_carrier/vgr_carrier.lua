if (GLOBAL_LIB_IMPORTED == nil or GLOBAL_LIB_IMPORTED == 0) then
	dofilepath("data:scripts/playerspatch/playerspatch_ships_util.lua")
	GLOBAL_LIB_IMPORTED = 1
end

function Create_Vgr_Carrier(CustomGroup, playerIndex, shipID)  
	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mothership") == 0 then
		if playerIndex == Universe_CurrentPlayer() then
			UI_SetElementVisible("NewResearchMenu", "NonCombat", 0);
		end
	end
end

function Update_Vgr_Carrier(CustomGroup, playerIndex, shipID)	  
	--SobGroup_CreateIfNotExist("vgr_carrier"..playerIndex)	
	--SobGroup_Clear("vgr_carrier"..playerIndex)
	--SobGroup_SobGroupAdd("vgr_carrier"..playerIndex, CustomGroup)	
	SobGroup_NoSalvageScuttle(CustomGroup, playerIndex, shipID)
end
