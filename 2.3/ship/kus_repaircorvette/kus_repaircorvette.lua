function Create_Kus_RepairCorvette(CustomGroup, playerIndex, shipID)
	GLOBAL_SHIPS:set(shipID, {
		playerIndex = playerIndex,
		CustomGroup = CustomGroup
	})
end

function Update_Kus_RepairCorvette(CustomGroup, playerIndex, shipID)
	local this_rc = GLOBAL_SHIPS:get(shipID)
	local targets = SuppUtil_GetSupportTargets(this_rc)

end

