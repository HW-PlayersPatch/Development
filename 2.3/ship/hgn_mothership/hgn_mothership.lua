if (GLOBAL_LIB_IMPORTED == nil or GLOBAL_LIB_IMPORTED == 0) then
	dofilepath("data:scripts/playerspatch/playerspatch_ships_util.lua")
	GLOBAL_LIB_IMPORTED = 1
end

function Create_Hgn_Mothership(CustomGroup, playerIndex, shipID) 	
	if playerIndex == Universe_CurrentPlayer() then
		UI_SetElementVisible("NewResearchMenu", "NonCombat", 0);
	end
end

function Update_Hgn_Mothership(CustomGroup, playerIndex, shipID)	
	--SobGroup_CreateIfNotExist("hgn_mothership"..playerIndex)
	--SobGroup_Clear("hgn_mothership"..playerIndex)
	--SobGroup_SobGroupAdd("hgn_mothership"..playerIndex, CustomGroup)	
end