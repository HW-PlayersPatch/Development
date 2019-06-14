PLAYER_MINUTE_STATS = {}

function Stats_AddPlayerLog(player_index, current_stats)
    PLAYER_MINUTE_STATS[player_index] = {
        stats = {
            current_stats
        }
    };
end

function Stats_GetPlayerLog(player_index)
    return PLAYER_MINUTE_STATS[player_index];
end

function Stats_UpdatePlayerLog(player_index, current_stats)
    tinsert(PLAYER_MINUTE_STATS[player_index].stats, current_stats);
end

function Stats_RemovePlayerLog(player_index)
    PLAYER_MINUTE_STATS[player_index] = nil;
end

function Stats_GetIntervalRU(player_index, current_rus)
    local last_ru_count = Stats_GetPlayerLog(player_index).stats[getn(Stats_GetPlayerLog(player_index).stats) - 1].rus;
    return current_rus - last_ru_count;
end

function Stats_GatheredRUHonest(player_index)
    return Stats_GatheredRUAsteroid(player_index) + Stats_GatheredRUSalvage(player_index)
end

function Stats_Capture()
    print("yeah hi, stats check called");
    local p_log = Stats_GetPlayerLog(0);
    local log_entry = {
        ru = {
            total = Player_GetRU(0),
            asteroid = Stats_GatheredRUAsteroid(0),
            dustcloud = Stats_GatheredRUDustCloud(0),
            salvage = Stats_GatheredRUSalvage(0)
        },
        workers = {
            total = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "Hgn_ResourceCollector")
            --idle = SobGroup_GetCurrentOrder(Pl)
            -- active = P
        },
        army = {}
    }
    if (p_log == nil) then
        print("write new player");
        Stats_AddPlayerLog(0, {
            rus = Player_GetRU(0),
            rus_gathered = {
                asteroid = Stats_GatheredRUAsteroid(0)
            }

        });
    else
        print("update existing player");
        Stats_UpdatePlayerLog(0, {
            rus = Player_GetRU(0)
            
        });
    end

    local ru_interval = Stats_GetIntervalRU(0, Player_GetRU(0));
    print("\thuman player (1) has " .. Player_GetRU(0) .. "ru (" .. Universe_GameTime() .. ")");
    print("\ta difference of " .. ru_interval .. " since last checked");
    print("\tgathered rus reports: " .. Stats_GatheredRUHonest(0));
    print("\t\tgathered from asteroids: " .. Stats_GatheredRUAsteroid(0));
    print("\t\tgathered from salvage: " .. Stats_GatheredRUSalvage(0));
    print("\t\treceived from tribute: " .. Stats_TributeReceived(0));
    print("logged: ");
    for i = 1, getn(PLAYER_MINUTE_STATS[0].stats) do
        print(PLAYER_MINUTE_STATS[0].stats[i].rus);
    end
end