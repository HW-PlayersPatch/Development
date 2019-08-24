-- Singleplayer campaign utility functions. (Note, this file is also loaded via scar_util.lua)

--Expanded option functions
--If you plan to change or add functions for another mod, please use "YourModName_" rather than "PlayersPatch_" to prevent conflicts in people's "Profile\PLAYERCFG.LUA".

function GetMissionDifficultyScale()
	MissionDifficultyScale = GetOptionValue("PlayersPatch_MissionDifficultyScale")

	if MissionDifficultyScale < 0 or MissionDifficultyScale > 5 then
		MissionDifficultyScale = 1.0
	end

	return MissionDifficultyScale
end

function GetOptionValue(OptionName)

	--Load expanded options
	dofilepath("PLAYER:PLAYERCFG.lua")

	for i = 1,999 do --loop through up to 999 options
		if Options.UIOptions[i] ~= nil then --option exists
			if Options.UIOptions[i].anchor == OptionName then
				OptionValue = Options.UIOptions[i].scale
				break --obtained only needed option, exit loop
			end
		else
			break --end of options, exit loop
		end
	end

	if OptionValue == nil then
		OptionValue = 999
	end
	
	return OptionValue
end
