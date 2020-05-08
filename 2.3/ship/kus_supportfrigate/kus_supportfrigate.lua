function Create_Kus_SupportFrigate(CustomGroup, playerIndex, shipID)
	SobGroup_Create("LatchDockTempGroup"..shipID)
	SobGroup_CreateIfNotExist("LatchDockTempGroup")
end

function Update_Kus_SupportFrigate(CustomGroup, playerIndex, shipID)
	SobGroup_NoSalvageScuttle(CustomGroup, playerIndex, shipID)
	SupportFrigate_HyperspaceDock(CustomGroup, shipID)
end

function Destroy_Kus_SupportFrigate(CustomGroup, playerIndex, shipID)
	if (SobGroup_Empty("LatchDockTempGroup"..shipID)==0) then
		SobGroup_MakeSelectable("LatchDockTempGroup"..shipID,1)
		SobGroup_SetHidden( "LatchDockTempGroup"..shipID, 0)
		SobGroup_AbilityActivate("LatchDockTempGroup"..shipID, AB_Dock, 1)
		SobGroup_AbilityActivate("LatchDockTempGroup"..shipID, AB_Scuttle, 1)
		SobGroup_AbilityActivate("LatchDockTempGroup"..shipID, AB_Attack, 1)
		SobGroup_Clear("LatchDockTempGroup"..shipID)
	end
end