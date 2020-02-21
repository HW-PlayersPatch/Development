function Create_Kus_SupportFrigate(CustomGroup, playerIndex, shipID)
	SupportFrigate_Docked_HS_Init(shipID)
end

function Update_Kus_SupportFrigate(CustomGroup, playerIndex, shipID)
	NoSalvageScuttle(CustomGroup, playerIndex, shipID)
	SupportFrigate_Docked_HS_Update(CustomGroup, shipID)
end

function Destroy_Kus_SupportFrigate(CustomGroup, playerIndex, shipID)
	SupportFrigate_Docked_HS_Destroy(shipID)
end