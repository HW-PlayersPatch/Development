function Start_Kus_Scout(CustomGroup, playerIndex, shipID)  
	SobGroup_SetMaxSpeedMultiplier(CustomGroup, 1.1)
	FX_PlayEffect("speed_burst_flash", CustomGroup, 1.5)
end

function Do_Kus_Scout(CustomGroup, playerIndex, shipID)
	if SobGroup_GetActualSpeed(CustomGroup) >= 110 then
		FX_StartEvent(CustomGroup, "SpeedBurst")
	end	
end

function Finish_Kus_Scout(CustomGroup, playerIndex, shipID)	
	SobGroup_SetMaxSpeedMultiplier(CustomGroup, 1)
end