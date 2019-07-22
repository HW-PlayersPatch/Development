-- Add the research times to each research option
doscanpath("data:ui", "playerspatch_ui_util.lua")
if GetProductionTimeSetting() == 3 or GetProductionTimeSetting() == 4 then
	doscanpath("data:scripts", "localization.lua")
	for i,e in research do
		upVal = ""
		if e.UpgradeValue then
			pc = e.UpgradeValue * 100 - 100
			upVal = " \n<b>Value:</b> "
			if pc > 0 then
				upVal = upVal .. "+"
			end
			upVal = upVal .. pc .. "%"
		end
		
		locLong = localization[e.Description]
		if locLong then
			research[i].Description = locLong .. "  \n\n<b>Base Time:</b> " .. e.Time .. "s" .. upVal
		end
	end
end
