--Singleplayer campaign utility functions. (Note, this file is also loaded via scar_util.lua)

--Expanded option functions.
--If you plan to change or add settings for another mod, please use "YourModName_" rather than "PlayersPatch_" to prevent conflicts in people's "Profile\PLAYERCFG.LUA".
--Instructions are here: https://forums.gearboxsoftware.com/t/ui-in-game-screeen-slider-with-link-to-function/1528075/21

function GetMissionDifficultyScale()
	MissionDifficultyScale = GetOptionValue("PlayersPatch_MissionDifficultyScale")

	if MissionDifficultyScale < 0 or MissionDifficultyScale > 5 then
		MissionDifficultyScale = 1.0
	end

	return MissionDifficultyScale
end

function GetOptionValue(OptionName)

	--Clear any previous results
	OptionValue = nil

	--Load expanded options
	dofilepath("PLAYER:PLAYERCFG.lua")

	if (Options) then --PLAYERCFG file exists
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
	end

	if OptionValue == nil then
		OptionValue = 999
	end
	
	return OptionValue
end

function _printTbl(tbl, indent)
	if (indent == nil) then
		indent = 0
	end
	local indent_str = ""
	if (indent > 0) then
		local cur_indents = 0
		while (cur_indents ~= indent) do
			indent_str = indent_str .. "\t"
			cur_indents = cur_indents + 1
		end
	end
	for k, v in tbl do
		if type(v) == "table" then
			print(indent_str .. "\"" .. k .. "\": {")
			_printTbl(v, indent + 1, self)
			print(indent_str .. "},")
		else
			if (type(v) ~= "number") then
				v = "\"" .. tostring(v) .. "\""
			end
			print(indent_str .. "\"" .. k .. "\": " .. v .. ',')
		end
	end
end

function printTbl(tbl, label)
	if (label == nil) then
		label = tostring(tbl)
	end
	local temp_tbl = {}
	temp_tbl[label] = tbl
	_printTbl(temp_tbl)
end

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return floor(num * mult + 0.5) / mult
end
