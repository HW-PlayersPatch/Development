if (GLOBAL_LIB_IMPORTED == nil or GLOBAL_LIB_IMPORTED == 0) then
	dofilepath("data:scripts/playerspatch/playerspatch_ships_util.lua")
	GLOBAL_LIB_IMPORTED = 1
end

function Create_Vgr_Mothership(CustomGroup, playerIndex, shipID) 	
	if playerIndex == Universe_CurrentPlayer() then
		UI_SetElementVisible("NewResearchMenu", "NonCombat", 0);
	end
end

function Update_Vgr_Mothership(CustomGroup, playerIndex, shipID)	
	--SobGroup_CreateIfNotExist("vgr_mothership"..playerIndex)
	--SobGroup_Clear("vgr_mothership"..playerIndex)
	--SobGroup_SobGroupAdd("vgr_mothership"..playerIndex, CustomGroup)	
end