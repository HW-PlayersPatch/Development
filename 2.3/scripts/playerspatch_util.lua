

function SpeechRaceHelper()
	-- Write race list
	if (writeto("racelist.lua")) then
		local RaceCount = Race_GetCount()
		write("Race_ID = \n{\n")
		for i = 1,RaceCount-1 do
			write("\t\""..Race_GetName(i).."\",\n")
		end
		write("}")
		writeto()	
	end
end

--Expanded option functions
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

function SobGroup_SplitGroup(SobGroupOut, SobGroupToSplit, NumberToSplit)
    -- function created by Apollyon470
    local index = 0
    local distance = 0
    local bool = 0
    local SobNum = 0
    SobGroup_Create("TempSobGroup")
    SobGroup_Clear ("TempSobGroup")
    SobGroup_Create("TempSobGroup1")
    SobGroup_Clear ("TempSobGroup1")
    SobGroup_SobGroupAdd ("TempSobGroup", SobGroupToSplit)
    if ( SobGroup_Empty (SobGroupToSplit) == 1 ) then
        return 0
    end
    if ( NumberToSplit > SobGroup_Count(SobGroupToSplit) ) then
        NumberToSplit = SobGroup_Count(SobGroupToSplit)
    end
    while (index < NumberToSplit ) do
        bool = 0
        -- in the interests of resource saving, we start with a search band of 625
        interval = 625
        while (bool == 0) do
            distance = distance + interval
            -- something went wrong.  Please tell me, or have a go at fixing it yourself.
            if (interval > 3000000) then
                bool =1
                return SobNum
            end
            SobGroup_FillProximitySobGroup ("TempSobGroup1", "TempSobGroup", SobGroupToSplit, distance)            
            if (SobGroup_Empty("TempSobGroup1") == 1)then
                -- get the next interval
            else
                if (SobGroup_Count("TempSobGroup1") > 1) then
                    -- too many ships, reduce interval
                    if (interval == 1) then
                        -- Screw it! chunk 'em all in the same sobgroup
                        SobGroup_Create(SobGroupOut .. tostring(SobNum))
                        SobGroup_Clear (SobGroupOut .. tostring(SobNum))
                        SobGroup_SobGroupAdd (SobGroupOut .. tostring(SobNum), "TempSobGroup1")
                        SobGroup_Create("tempsob")
                        SobGroup_FillSubstract("tempsob", "TempSobGroup", SobGroupOut .. tostring(SobNum))
                        SobGroup_Clear ("TempSobGroup")
                        SobGroup_SobGroupAdd ("TempSobGroup", "tempsob")
                        bool = 1
                    else
                        distance = distance - interval
                        interval = interval / 5
                    end
                else
                    -- we got one! add it to the list!
                    SobGroup_Create(SobGroupOut .. tostring(SobNum))
                    SobGroup_Clear (SobGroupOut .. tostring(SobNum))
                    SobGroup_SobGroupAdd (SobGroupOut .. tostring(SobNum), "TempSobGroup1")
                    SobGroup_Create("tempsob")
                    SobGroup_FillSubstract("tempsob", "TempSobGroup", SobGroupOut .. tostring(SobNum))
                    SobGroup_Clear ("TempSobGroup")
                    SobGroup_SobGroupAdd ("TempSobGroup", "tempsob")
                    bool = 1
                end
            end            
        end
        index = index + SobGroup_Count(SobGroupOut .. tostring(SobNum))
        SobNum = SobNum + 1
    end
    return SobNum
end