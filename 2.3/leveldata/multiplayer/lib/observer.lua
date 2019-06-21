dofilepath("player:racelist.lua")

-- function isRace2x(raceId)
-- 	races = { Hiigaran_2X = 1, Vaygr_2X = 1, Kushan_2X = 1, Taiidan_2X = 1 }
-- 	return races[Race_ID[raceId]]
-- end

function isRaceObserver(raceId)
	return Race_ID[raceId] == "Observer"
end

-- most of this function was used for dual command mode, just keeping it commented for potential later use
-- renamed from 'CompetitorsPatch_Init' to 'Observers_Init'
function Observers_Init()
	-- master = nil
	-- slave = nil
	
	-- -- Loop through players to find master and slave
	-- for player = 0, Universe_PlayerCount() - 1 do
	-- 	raceId = Player_GetRace(player)
	-- 	if isRace2x(raceId) then
	-- 		-- The master must be a player and the slave must be an AI
	-- 		if Player_GetLevelOfDifficulty(player) > 0 then
	-- 			slave = player
	-- 		else
	-- 			master = player
	-- 		end
	-- 	elseif isRaceObserver(raceId) then
	-- 		Player_SetRU(player, 0) -- Give observers no starting RUs
	-- 		SobGroup_EnterHyperSpaceOffMap("Player_Ships" .. player) -- Hyperspace them off the map
	-- 	end
	-- end
	
	-- -- If both a master and slave are found
	-- if master and slave then
	-- 	-- Give all slave player units to master
	-- 	SobGroup_CreateIfNotExist("SlaveShips")
	-- 	SobGroup_CreateIfNotExist("SlaveCollectors")
		
	-- 	SobGroup_SobGroupAdd("SlaveShips", "Player_Ships" .. slave)
	-- 	SobGroup_GetSobGroupDockedWithGroup("SlaveShips", "SlaveCollectors") -- Player_Ships does not include these collectors
	-- 	SobGroup_SobGroupAdd("SlaveShips", "SlaveCollectors")
		
	-- 	-- Switch owner
	-- 	SobGroup_SetSwitchOwnerFlag("SlaveShips", 0)
	-- 	SobGroup_SwitchOwner("SlaveShips", master)
		
	-- 	-- Give player double RUs
	-- 	Player_SetRU(master, Player_GetRU(master) * 2)
	-- end
	
	Rule_AddInterval("Observers_Update", 0.2)
	Rule_Remove("Observers_Init")
end

-- renamed from `CompetitorsPatch_Update` to `Observers_Update`
function Observers_Update()
	-- Global vision causes desyncs with other human players
	-- May be useful in AI games though
	--if isRaceObserver(Player_GetRace(Universe_CurrentPlayer())) then
	--	for player = 0, Universe_PlayerCount() - 1 do
	--		FOW_RevealGroup("Player_Ships" .. player, 1)
	--	end
	--end
	
	-- Check if there are any enemy players that aren't observers
	gameOver = 1
	for player1 = 0, Universe_PlayerCount() - 1 do
		if not isRaceObserver(Player_GetRace(player1)) and -- If player 1 is not an observer
		   Player_IsAlive(player1) == 1 then -- If player 1 is alive
		   
			for player2 = 0, Universe_PlayerCount() - 1 do
				if player1 ~= player2 and -- If not comparing with same player
				   not isRaceObserver(Player_GetRace(player2)) and -- If player 2 is not an observer
				   AreAllied(player1, player2) == 0 and -- If the two players are not allied
				   Player_IsAlive(player2) == 1 then -- If player 2 is alive
					
					--Subtitle_Message(player1 .. " - " .. player2, 20)
					gameOver = 0 -- There are 2 players who are alive, not observers and enemies
				end
			end
		end
	end
	
	if gameOver == 1 then
		for player = 0, Universe_PlayerCount() - 1 do
			if isRaceObserver(Player_GetRace(player)) and
			   Player_IsAlive(player) == 1 then
				Player_Kill(player)
			end
		end
	end
end
