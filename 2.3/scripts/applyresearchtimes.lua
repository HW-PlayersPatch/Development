-- Add the research times to each research option
doscanpath("data:ui", "playerspatch_ui_util.lua")
if GetProductionTimeSetting() == 3 or GetProductionTimeSetting() == 4 then
	doscanpath("data:scripts", "localization.lua")
	for i,e in research do
		upVal = ""
		if e.UpgradeValue then
			pc = e.UpgradeValue * 100 - 100
			upVal = " ("
			if pc > 0 then
				upVal = upVal .. "+"
			end
			upVal = upVal .. pc .. "%)"
		end
		
		locLong = localization[e.DisplayedName]
		if locLong then
			research[i].DisplayedName = locLong .. "  <c=888>" .. e.Time .. "s" .. upVal
		end
		
		if e.ShortDisplayedName then
			locShort = localization[e.ShortDisplayedName]
			if locShort then
				research[i].ShortDisplayedName = locShort .. "  <c=888>" .. e.Time .. "s" .. upVal
			end
		end
	end
end
