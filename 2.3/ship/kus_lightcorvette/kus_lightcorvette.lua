function Create_Kus_LightCorvette(CustomGroup, playerIndex, shipID)
	GLOBAL_SHIPS:set(shipID, {
		playerIndex = playerIndex,
		CustomGroup = CustomGroup
	})
end

function Update_Kus_LightCorvette(CustomGroup, playerIndex, shipID)
	local this_lc = GLOBAL_SHIPS:get(shipID)
end