-- Start HW1 Scouts:

function Scout_SpeedBurst_Start(CustomGroup)
	SobGroup_SetMaxSpeedMultiplier(CustomGroup, 1.1)
	FX_PlayEffect("speed_burst_flash", CustomGroup, 1.5)
end

function Scout_SpeedBurst_Do(CustomGroup)
	if SobGroup_GetActualSpeed(CustomGroup) >= 110 then
		FX_StartEvent(CustomGroup, "SpeedBurst")
	end	
end

function Scout_SpeedBurst_Finish(CustomGroup)
	SobGroup_SetMaxSpeedMultiplier(CustomGroup, 1)
end

-- end HW1 Scouts