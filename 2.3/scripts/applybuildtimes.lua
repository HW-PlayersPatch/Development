-- Add the build times to each build option
doscanpath("data:ui", "playerspatch_ui_util.lua")
if GetProductionTimeSetting() == 2 or GetProductionTimeSetting() == 4 then
	doscanpath("data:scripts", "buildtimes.lua")
	doscanpath("data:scripts", "localization.lua")
	for i,e in build do
		if e.Description and e.ThingToBuild then
			loc = localization[e.Description]
			buildtime = buildtimes[e.ThingToBuild]
			if loc and buildtime then
				-- The color code at the end is for the build menu to reset the color of the units queued
				build[i].Description = loc .. "  \n\n<b>Base Time:</b> " .. buildtime .. "s"
			end
		end
	end
end
