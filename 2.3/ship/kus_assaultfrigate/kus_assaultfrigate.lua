function Create_Kus_AssaultFrigate(CustomGroup, playerIndex, shipID)
    GLOBAL_SHIPS:set(shipID, {
		playerIndex = playerIndex,
        CustomGroup = CustomGroup,
        family_type = MemGroup_FAMILY_TYPES.frigate,
	})
end

function Update_Kus_AssaultFrigate(CustomGroup, playerIndex, shipID)
    SobGroup_NoSalvageScuttle(CustomGroup, playerIndex, shipID)
end

function Destroy_Kus_AssaultFrigate(CustomGroup, playerIndex, shipID)

end
