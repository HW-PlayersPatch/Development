dofilepath("data:scripts/playerspatch_util.lua")
dofilepath("data:scripts/playerspatch-lib/table_util.lua")
activeraceListbox = "hgn_listbox"
P1BuildCost = 0
P1BuildTime = 0
P1RunningHealth = 0
P2BuildCost = 0
P2BuildTime = 0
P2RunningHealth = 0
bLoaded = 0
bInstaFight = 0
-- playerspatch
bFighting = 0
bFightFive = 0
fightFiveId = 0
fightFiveIndex = 0
fightIndex = 0
shipIndex = 0
internalFightTimer = 0
ships = {
	enemy = {},
	player = {}
}
reports = {}
----------------------- ON SHOW -----------------------
function GameBalanceScreenOnShow()

	if(bLoaded==1) then		
		return
	end

	print("LUA: Balance Screen Loading")
	bLoaded=1

	--Make sure it's visible and enabled
	UI_SetElementVisible("GameBalanceScreen","GameBalanceScreenWindow", 1)
	UI_SetElementEnabled("GameBalanceScreen","GameBalanceScreenWindow", 1)

	SobGroup_CreateIfNotExist("playerSob")
	SobGroup_CreateIfNotExist("enemySob")
	SobGroup_Clear("playerSob")
	SobGroup_Clear("enemySob")

	local firstplayer = 0
	for i = 0,5,1 do		
			if SobGroup_Empty("Player_Ships"..i) == 0 then
					firstplayer = i
					break
			end
	end
	if Player_FillProximitySobGroup("playerSob", -1, "Player_Ships"..firstplayer, 1000000) == 1 then
			SobGroup_FillShipsByType("enemySob", "playerSob", "Special_UnitTestMap")
			--if SobGroup_Count("enemySob") > 0 then
			--		cl[7] = 1
			--else
	--cl[7] = -1					
	--		end
	end

	Volume_AddSphere("battle",{0,0,0,},2000)

	for i = 1,50,1 do
		Volume_AddSphere("player"..i,{random(-1500,1500),random(-750,750),random(2600,3000),},2000)
		Volume_AddSphere("enemy"..i,{random(-1500,1500),random(-750,750),-random(2600,3000),},2000)
	end		

	SobGroup_Create("squadenemy")
	SobGroup_Create("squadplayer")		
	SobGroup_Create("tempSob")	 
end
------------------------------------------------
function GameBalanceScreenOnUpdate()

	local playershipcount = SobGroup_Count("squadplayer")
	local enemyshipcount = SobGroup_Count("squadenemy")	
	UI_SetTextLabelText("GameBalanceScreen", "PlayerCount", ""..playershipcount);
	UI_SetTextLabelText("GameBalanceScreen", "EnemyCount", ""..enemyshipcount);

	if (SobGroup_InStrikeGroup("squadenemy")) then
		SobGroup_FormStrikeGroup("squadenemy", "none")
	end
	
	local playershiphealth = SobGroup_CurrentHealthTotal("squadplayer")
	local enemyshiphealth = SobGroup_CurrentHealthTotal("squadenemy")	
	UI_SetTextLabelText("GameBalanceScreen", "Player1RunningHealth", ""..playershiphealth);
	UI_SetTextLabelText("GameBalanceScreen", "Player2RunningHealth", ""..enemyshiphealth);

	if (bFightFive == 1) then
		-- print("flag: " .. tostring(bFightFive) .. " | index: " .. tostring(fightFiveIndex))
		-- print("\t" .. tostring(bFighting))
		if (bFighting == 0) then
			InstaFight(1)
		end
	end
	
	if playershipcount == 0 or enemyshipcount == 0 then
		ReportFight()
		UI_TimerStop("GameBalanceScreen", "BalanceFightTimer")
		if bInstaFight == 1 then
			SetTurboSpeed(1)
			bInstaFight = 0
		end
		if (fightFiveIndex >= 4 and bFightFive == 1) then
			bFightFive = 0
			fightFiveId = fightFiveId + 1
		end
		if (bFightFive == 1 and getn(reports) > 0) then
			ResetToLast(1)
			fightFiveIndex = fightFiveIndex + 1
		end
	end
end



function ReportFight()
	if (bFighting == 1) then
		bFighting = 0
		local this_report = {
			time = {},
			ships = {}
		}
		if (bFightFive == 1) then
			this_report.group = fightFiveId
		end
		local endTime = Universe_GameTime()
		-- print("=== BEGIN BALANCESCREEN BATTLE REPORT ===")
		-- print("Start: " .. internalFightTimer)
		this_report.time.start = internalFightTimer
		-- print("End: " .. endTime)
		this_report.time.finish = endTime
		-- print("Took " .. endTime - internalFightTimer .. "s")
		this_report.time.total = endTime - internalFightTimer
		for player, ship_list in ships do
			-- print(player .. " ships:")
			this_report.ships[player] = {
				initial = {},
			}
			for index, ship in ship_list do
				-- print("\t" .. index .. ": " .. ship.type)
				this_report.ships[player].initial[index] = {
					type = ship.type,
					cost = SobGroup_GetStaticF(ship.type, "buildCost"),
					time = SobGroup_GetStaticF(ship.type, "buildTime")
				}
				-- print(ship.group)
				-- print(SobGroup_Count(ship.group))
				if (SobGroup_Count(ship.group) > 0) then
					if (this_report.ships[player].survived == nil) then
						this_report.ships[player].survived = {}
					end
					this_report.ships[player].survived[index] = {
						type = ship.type,
						hp = SobGroup_HealthPercentage(ship.group) * 100,
						cost = SobGroup_GetStaticF(ship.type, "buildCost"),
						time = SobGroup_GetStaticF(ship.type, "buildTime")
					}
				end
			end 
		end
		reports[getn(reports) + 1] = this_report
		-- print("=== END BALANCESCREEN BATTLE REPORT ===")
		ships = {
			enemy = {},
			player = {}
		}
	end
end
------------------------------------------------

function PrintReport(index, report)
	print("\n-- as json:")
	printTbl(report)
	print("--\n\n")
	print("\nBattle [" .. index .. "]:")
	print("Took " .. report.time.total .. "s")
	for k, player in report.ships do
		print(k)
		for k, ship_cat in player do
			print("\t" .. k)
			local ship_tallies = reduce(ship_cat, function (acc, ship_details)
				if (acc[ship_details.type] ~= nil) then
					local count_total = acc[ship_details.type].count + 1
					local hp_total = nil
					local cost_total = acc[ship_details.type].cost + ship_details.cost
					local time_total = acc[ship_details.type].cost + ship_details.time
					if (ship_details.hp ~= nil) then
						hp_total = acc[ship_details.type].hp + ship_details.hp
					end
					acc[ship_details.type] = {
						count = count_total,
						hp = hp_total,
						cost = cost_total,
						time = time_total
					}
				else
					local this_hp = nil
					if (ship_details.hp ~= nil) then
						this_hp = ship_details.hp
					end
					acc[ship_details.type] = {
						count = 1,
						hp = this_hp,
						cost = ship_details.cost,
						time = ship_details.time
					}
				end
				return acc
			end, {})
			for ship_type, details in ship_tallies do
				local hp_str = ""
				if (details.hp ~= nil) then
					hp_str = ": " .. round((details.hp / details.count), 2) .. "%% HP"
				end
				print("\t\t" .. ship_type .. " (x" .. details.count .. ")" .. hp_str)
			end
		end
	end
end

function PrintCompiledReports()
	local grouped = reduce(reports, function (acc, report)
		if (acc[report.group] == nil) then
			acc[report.group] = {
				time_totals = {},
				ships = {}
			}
		end
		-- record time total...
		local time_total_index = getn(acc[report.group].time_totals) + 1
		acc[report.group].time_totals[time_total_index] = report.time.total
		--- record ships...
		local ships_index = getn(acc[report.group].ships) + 1
		acc[report.group].ships[ships_index] = report.ships
		return acc
	end, {})
	-- printTbl(grouped)
	for k, battle in grouped do
		local sorted_times = battle.time_totals
		sort(sorted_times)
		local compiled = {
			index = k,
			time = {
				average = reduce(battle.time_totals, function (acc, t) return acc + t end, 0) / getn(battle.time_totals),
				min = sorted_times[1],
				max = sorted_times[getn(sorted_times)],
				range = sorted_times[getn(sorted_times)] - sorted_times[1]
			},
			ship_averages = reduce(battle.ships, function (acc, battle)
				local uniqueSurvivorCounts = function(who, status_type)
					if (%battle[who][status_type] ~= nil) then
						return reduce(%battle[who][status_type], function (acc, ship_details)
							if (acc[ship_details.type] == nil) then
								acc[ship_details.type] = 1
							else
								acc[ship_details.type] = acc[ship_details.type] + 1
							end
							return acc
						end, {})
					else
						return {}
					end
				end
				local merger = function (a, b)
					return a + b
				end

				local maybeAddWin = function(player)
					local count = 0
					for k, v in %uniqueSurvivorCounts(player, "survived") do -- lua is really stupid
						count = count + 1
						break; -- sigh
					end
					if (count > 0) then
						return 1
					end
					return 0
				end

				acc.player = {
					initial = merge(acc.player.initial, uniqueSurvivorCounts("player", "initial"), merger),
					survived = merge(acc.player.survived, uniqueSurvivorCounts("player", "survived"), merger),
					wins = acc.player.wins + maybeAddWin("player")
				}
				-- printTbl(acc.player)
				acc.enemy = {
					initial = merge(acc.enemy.initial, uniqueSurvivorCounts("enemy", "initial"), merger),
					survived = merge(acc.enemy.survived, uniqueSurvivorCounts("enemy", "survived"), merger),
					wins = acc.enemy.wins + maybeAddWin("enemy")
				}
				return acc
			end, {
				player = {
					initial = {},
					survived = {},
					wins = 0
				},
				enemy = {
					initial = {},
					survived = {},
					wins = 0
				}
			}),
		}
		compiled.ship_averages = map(compiled.ship_averages, function (player)
			local test_count = getn(%battle.ships)
			local toAverageCount = function (ship_count, ship_type)
				return (ship_count * SobGroup_GetStaticF(ship_type, "buildBatch")) / %test_count
			end
			player.survived = map(player.survived, toAverageCount)
			player.initial = map(player.initial, toAverageCount)
			return player
		end)
		printTbl(compiled, "Test " .. k)
	end
end

function GameBalanceScreenOnHide()
	print("\n\n=== REPORTS DUMP ===")
	-- for i, v in reports do
	-- 	PrintReport(i, v)
	-- end
	PrintCompiledReports()
	print("LUA: Balance Screen Unloading")
	bLoaded = 0
end

----------------------- SPAWN UNIT -----------------------
function SpawnUnitFromDropdownListBoxSelection(_side, _playerID, _count, _formation, _ship, no_msg)
	-- _side is either "player" or "enemy"
	-- _playerID is either 0=player or 1=enemy

	local shipType
	if (_ship ~= nil) then
		shipType = _ship.type
	else
		shipType = UI_GetDropdownListBoxSelectedCustomDataString("GameBalanceScreen",activeraceListbox)
	end
	SobGroup_Clear("tempSob")

	for i = 1,_count do 
		local r = random(1,50)
		-- Create the ship in volume _side..r
		local this_ship_group = _side .. "_" .. shipType .. "_" .. fightIndex .. "_" .. shipIndex
		shipIndex = shipIndex + 1
		SobGroup_CreateIfNotExist(this_ship_group)
		SobGroup_SpawnNewShipInSobGroup(_playerID, shipType , _side, this_ship_group, _side .. r)
		ships[_side][getn(ships[_side]) + 1] = {
			type = shipType,
			group = this_ship_group
		}

		-- Add _side.."Sob" to active list of ships to keep count of (squad*)
		SobGroup_SobGroupAdd(_side.."Sob", this_ship_group)	
		SobGroup_SobGroupAdd("squad".._side, _side.."Sob")		
	end 

	SobGroup_SelectSobGroup('tempSob')

	--SobGroup_FormStrikeGroup('tempSob','delta')
	--SobGroup_FormStrikeGroup('tempSob','x')#
	--SobGroup_FormStrikeGroup('tempSob','broad')
	--SobGroup_FormStrikeGroup('tempSob','movers')
	--SobGroup_FormStrikeGroup('tempSob','wall')
	--SobGroup_FormStrikeGroup('tempSob','none')
	if(_formation ~= nil) then
		SobGroup_FormStrikeGroup('tempSob',_formation)
		--SobGroup_SetFixed('tempSob',1)
	end

	if (no_msg == nil) then
		Subtitle_Message(_side.."Spawning ".. _count.. " ".. shipType, 5)
	end
	

	-- Added now that the switch player debug option is available
	if(Universe_CurrentPlayer() == 0) then
		SobGroup_AbilityActivate("squadenemy", AB_Move, 0) -- So the enemy stays still
	else
		SobGroup_AbilityActivate("squadplayer", AB_Move, 0) -- So the enemy stays still
	end

	local buildCost = SobGroup_GetStaticF(shipType,"buildCost") * _count
	local buildTime = SobGroup_GetStaticF(shipType,"buildTime") * _count

	if _playerID == 0 then
		P1BuildCost = (P1BuildCost + buildCost)
		P1BuildTime = (P1BuildTime + buildTime)
		UI_SetTextLabelText("GameBalanceScreen", "Player1BuildCost", P1BuildCost);
		UI_SetTextLabelText("GameBalanceScreen", "Player1BuildTime", P1BuildTime);

	else
		P2BuildCost = (P2BuildCost + buildCost)
		P2BuildTime = (P2BuildTime + buildTime)
		UI_SetTextLabelText("GameBalanceScreen", "Player2BuildCost", P2BuildCost);
		UI_SetTextLabelText("GameBalanceScreen", "Player2BuildTime", P2BuildTime);
	end	

end

----------------------- SHOW LISTBOX -----------------------
function ShowRaceListbox(listbox)

	UI_SetElementVisible("GameBalanceScreen", 'hgn_listbox', 0)
	UI_SetElementVisible("GameBalanceScreen", 'vgr_listbox', 0)
	UI_SetElementVisible("GameBalanceScreen", 'kus_listbox', 0)
	UI_SetElementVisible("GameBalanceScreen", 'tai_listbox', 0)
	UI_SetElementVisible("GameBalanceScreen", 'hw1_misc_listbox', 0)
	UI_SetElementVisible("GameBalanceScreen", 'hw2_misc_listbox', 0)
	UI_SetElementVisible("GameBalanceScreen", 'mp_misc_listbox', 0)

	UI_SetElementVisible("GameBalanceScreen", listbox, 1)
	activeraceListbox = listbox

end
---------------------------------------------------------------------
function BeginTrackingFight()
	fightIndex = fightIndex + 1
	internalFightTimer = Universe_GameTime()
	bFighting = 1
end

function Fight(no_msg)
	SobGroup_Attack(0, "squadplayer", "squadenemy")
	--SobGroup_AbilityActivate("squadenemy", AB_Move, 1)
	SobGroup_Attack(1, "squadenemy", "squadplayer")
	BeginTrackingFight()
	if (no_msg == nil) then
		Subtitle_Message("Fight!", 5)
	end
	UI_TimerStart("GameBalanceScreen", "BalanceFightTimer")
end

function InstaFight(no_msg)
	bInstaFight = 1
	SetTurboSpeed(64)
	SobGroup_Attack(0, "squadplayer", "squadenemy")
	--SobGroup_AbilityActivate("squadenemy", AB_Move, 1)
	SobGroup_Attack(1, "squadenemy", "squadplayer")
	BeginTrackingFight()
	if (no_msg == nil) then
		Subtitle_Message("Insta-Fight!", 5)
	end
	UI_TimerStart("GameBalanceScreen", "BalanceFightTimer")

end


function DestroyAll(no_msg)
	SobGroup_TakeDamage("squadplayer", 1)		
	SobGroup_TakeDamage("squadenemy", 1)
	if (no_msg) then	
		Subtitle_Message("Destroy!", 5)
	end
	P1BuildCost = 0
	P1BuildTime = 0
	P2BuildCost = 0
	P2BuildTime = 0

	bInstaFight = 0
	SetTurboSpeed(1)

	UI_SetTextLabelText("GameBalanceScreen", "Player1BuildCost", P1BuildCost);
	UI_SetTextLabelText("GameBalanceScreen", "Player1BuildTime", P1BuildTime);
	UI_SetTextLabelText("GameBalanceScreen", "Player2BuildCost", P2BuildCost);
	UI_SetTextLabelText("GameBalanceScreen", "Player2BuildTime", P2BuildTime);
	UI_TimerReset("GameBalanceScreen", "BalanceFightTimer")
	UI_TimerStop("GameBalanceScreen", "BalanceFightTimer")
	ships.player = {}
	ships.enemy = {}
end

function DestroyPlayer()
	SobGroup_TakeDamage("squadplayer", 1)		
	Subtitle_Message("Destroy Player!", 5)
	P1BuildCost = 0
	P1BuildTime = 0
	UI_SetTextLabelText("GameBalanceScreen", "Player1BuildCost", P1BuildCost);
	UI_SetTextLabelText("GameBalanceScreen", "Player1BuildTime", P1BuildTime);
	UI_TimerReset("GameBalanceScreen", "BalanceFightTimer")
	UI_TimerStop("GameBalanceScreen", "BalanceFightTimer")
	ships.player = {}
end

function DestroyEnemy(no_msg)
	SobGroup_TakeDamage("squadenemy", 1)
	if (no_msg == nil) then		
		Subtitle_Message("Destroy Enemy!", 5)
	end
	P2BuildCost = 0
	P2BuildTime = 0
	UI_SetTextLabelText("GameBalanceScreen", "Player2BuildCost", P2BuildCost);
	UI_SetTextLabelText("GameBalanceScreen", "Player2BuildTime", P2BuildTime);
	UI_TimerReset("GameBalanceScreen", "BalanceFightTimer")
	UI_TimerStop("GameBalanceScreen", "BalanceFightTimer")
	ships.enemy = {}
end


HandyTimerState = 0

function CycleHandyTimer()
	
	if HandyTimerState == 1 then
		UI_TimerStop("GameBalanceScreen", "HandyTimer")
		HandyTimerState = 0
		return 0
	end

	if HandyTimerState == 0 then
		UI_TimerReset("GameBalanceScreen", "HandyTimer")
		UI_TimerStart("GameBalanceScreen", "HandyTimer")
		HandyTimerState = 1
		return 0
	end
	

end
----------------------------------------------------
-- AI Debug

-- the cpu player to query
cpuplayer = 1
-- the current debug mode 0 being off
cpudebugmode = 1
-- this is the player the cpu player is analyzing from its point of view
cpudebugplayer = 1

enabled = 0

rawset(globals(), "ToggleAIDebug", nil )

function ToggleAIDebug()

	if (enabled == 0) then
		CPU_SetDebug(cpuplayer, 1)
		CPU_SetDebugMode(cpuplayer, cpudebugmode)
		CPU_SetDebugPlayer(cpuplayer, cpudebugplayer)
		-- set flag 1 and 2
		CPU_SetDebugFlag(cpuplayer, 0 )	
		enabled=1
	else
		local numPlayers = Universe_PlayerCount();
		for i=0,numPlayers do
			CPU_SetDebugMode(i, 0)
		end
		enabled=0
	end
end

function SwapSides()
	if(Universe_CurrentPlayer() == 0) then
		SobGroup_AbilityActivate("squadplayer", AB_Move, 0) 
	else
		SobGroup_AbilityActivate("squadenemy", AB_Move, 0) 
	end
	--swap
	MainUI_UserEvent(eSwitchPlayer)

	if(Universe_CurrentPlayer() == 0) then
		SobGroup_AbilityActivate("squadplayer", AB_Move, 1) 
	else
		SobGroup_AbilityActivate("squadenemy", AB_Move, 1) 
	end


end

--- playerspatch

function RespawnLast(no_msg)
	print("try to res last...")
	if (getn(reports) ~= nil) then
		print("begin")
		local last_battle = reports[getn(reports)]

		for player_name, ships in last_battle.ships do
			local player_index = function (name)
				if (name == 'player') then
					return 0
				end
				return 1
			end
			for index, ship in ships.initial do
				SpawnUnitFromDropdownListBoxSelection(player_name, player_index(player_name), 1, nil, ship, no_msg)
			end
		end
	end
	if (no_msg == nil) then
		Subtitle_Message("Respawn previous configuration", 3)
	end
end

function ResetToLast(no_msg)
	DestroyAll(no_msg)
	RespawnLast(no_msg)
	if (no_msg == nil) then
		Subtitle_Message("Reset to previous configuration", 3)
	end
end

function RunSetupFiveTimes()
	bFightFive = 1
	fightFiveIndex = 0
end