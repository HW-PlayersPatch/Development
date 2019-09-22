--
-- Finds and attacks missiles of any player not us.
--
function findAndAttackEnemyMissiles(CustomGroup, playerID, shipID)
    -- get all missiles
    Selection_Create("AllMissiles")
    local numberEnemyMissiles = Selection_GetMissiles("AllMissiles")
    if (numberEnemyMissiles == 0) then return 0 end
    
    -- ... that are close to me
    local defensePoint = SobGroup_GetPosition(CustomGroup)
    local defensePointString = defensePoint[1]..","..defensePoint[2]..","..defensePoint[3]
    Selection_Create("NearMissiles")
    local nearMissiles = Selection_FilterInclude("NearMissiles", "AllMissiles", "NearPoint", defensePointString, ""..4500)
    if (nearMissiles == 0) then return 0 end
    
    -- ... that are not allied missiles
    local playerIndex = 0;
    local playerCount = Universe_PlayerCount();
    while (playerIndex < playerCount) do --  and gameOver
        -- only process 'alive' players
        if (playerIndex ~= playerID and Player_IsAlive(playerIndex) == 1 and AreAllied(playerID, playerIndex) == 1) then
            Selection_FilterExclude("NearMissiles", "NearMissiles", "PlayerOwner", ""..playerIndex, "");
        end
        -- go to next player
        playerIndex = playerIndex+1
    end
    
    -- .. and excludes friendly missiles
    Selection_Create("IncomingMissiles")
    local incomingEnemyMissiles = Selection_FilterExclude("IncomingMissiles", "NearMissiles", "PlayerOwner", ""..playerID, "");
    if (incomingEnemyMissiles == 0) then return 0 end
            

    if (defenseFighterMissileTargets[shipID] ~= numberEnemyMissiles) then
        --print("updateDefenseFighterAttack: shipID "..shipID.." attacking "..numberEnemyMissiles.." missiles")
        defenseFighterMissileTargets[shipID] = numberEnemyMissiles
        SobGroup_AttackSelection(playerID, CustomGroup, "IncomingMissiles", 1)
    end
    
    return incomingEnemyMissiles
end

--
-- Update a defense fighter that's guarding someone.
--
function updateDefenseFighterDefense(CustomGroup, playerID, shipID)

    --print("updateDefenseFighterDefense: shipID "..shipID)
    local guardGroup = "defenseFighterGuardTargets"
    local guardGroupPlusMe = "defenseFighterGuardTargetsPlusMe"
    local guardGroupAttackers = "defenseFighterGuardTargetAttackers"
    SobGroup_CreateIfNotExist(guardGroup)
    SobGroup_CreateIfNotExist(guardGroupAttackers)

    Selection_Create("AllMissiles")
    if (Selection_GetMissiles("AllMissiles") > 0) then
        --print("updateDefenseFighterDefense: DETECTED missiles")
        SobGroup_GetCommandTargets(guardGroup, CustomGroup, COMMAND_Guard)
        if (SobGroup_Count(guardGroup) > 0) then

            SobGroup_CreateIfNotExist(guardGroupPlusMe)
            SobGroup_Copy(guardGroupPlusMe, guardGroup)
            SobGroup_SobGroupAdd(guardGroupPlusMe, CustomGroup)

            --print("updateDefenseFighterDefense: we're guarding someone")
            SobGroup_GetAttackers(guardGroupPlusMe, guardGroupAttackers)
            if (SobGroup_Count(guardGroupAttackers) > 0) then
                local enemyPlayerID = SobGroup_GetPlayerOwner(guardGroupAttackers);
                --print("updateDefenseFighterDefense: player "..enemyPlayerID.." is attacking")
                --
                --somebody's attacking our guard target: find their missiles and kill them
                --
                Selection_Create("IncomingMissiles")
                if (Selection_FilterInclude("IncomingMissiles", "AllMissiles", "PlayerOwner", ""..enemyPlayerID, "") > 0) then
                    --print("updateDefenseFighterDefense: attacking INCOMING missiles.")
                    -- Save the current guard targets for later use
                    SobGroup_CreateIfNotExist("DefenseFighterGuardTargets"..shipID)
                    SobGroup_Copy("DefenseFighterGuardTargets"..shipID, guardGroup)
                    SobGroup_AttackSelection(playerID, CustomGroup, "IncomingMissiles", 1)
                end
            else
                --
                -- nobody attacking: see if there are missiles or mines in the area
                --
                local numberEnemyMissiles = findAndAttackEnemyMissiles(CustomGroup, playerID, shipID)
                if (numberEnemyMissiles == 0) then
                    --
                    -- no nearby missiles: just defend our defend target
                    --
                    if (SobGroup_Count("DefenseFighterGuardTargets"..shipID) > 0) then
                        SobGroup_GuardSobGroup(CustomGroup, "DefenseFighterGuardTargets"..shipID)
                        SobGroup_Clear("DefenseFighterGuardTargets"..shipID)
                    end
                end
            end

        end

    end

end

--
-- Defense fighter attack logic.
-- If attacking ships, find neadby missiles.  If missiles changed, attack them.
-- If no missiles, try to go to guarding those who aree being attacked.
--
defenseFighterMissileTargets = {}
function updateDefenseFighterAttack(CustomGroup, playerID, shipID)

    --print("updateDefenseFighterAttack: shipID "..shipID)

    --get attack targets
    local attackGroup = "defenseFighterAttackTargets"
    SobGroup_CreateIfNotExist(attackGroup)
    SobGroup_GetCommandTargets(attackGroup, CustomGroup, COMMAND_Attack)
    if (SobGroup_Count(attackGroup) == 0) then
        --print("updateDefenseFighterAttack: shipID "..shipID.." attacking nobody.  Maybe attacking missiles?")
        return
    end

    local numberEnemyMissiles = findAndAttackEnemyMissiles(CustomGroup, playerID, shipID)

    if (numberEnemyMissiles == 0) then
        --else no local missiles.  Go back to guarding whoever the attack targets are guarding
        --get their attack targets, save as potential guard target
        local guardGroup = "defenseFighterGuardTargets"
        SobGroup_CreateIfNotExist(guardGroup)
        SobGroup_GetAttackers(attackGroup, guardGroup)
        --...only player/allied ships

        if (SobGroup_Count(guardGroup) > 0) then
            --print("updateDefenseFighterAttack: shipID "..shipID.." no missiles - guarding nearby attackees")
            SobGroup_GuardSobGroup(CustomGroup, guardGroup)
            SobGroup_Copy("DefenseFighterGuardTargets"..shipID, guardGroup)
        else
            --no missiles incoming
            --print("updateDefenseFighterAttack: shipID "..shipID.." no guard targets - halting")
            SobGroup_Stop(playerID, CustomGroup)
            --...try to find someone to guard
        end

    end

end

function updateDefenseFighter(CustomGroup, playerID, shipID)

    --print("updateDefenseFighter: shipID "..shipID)

    if (SobGroup_GetCurrentOrder(CustomGroup) == COMMAND_Guard) then
        updateDefenseFighterDefense(CustomGroup, playerID, shipID)
    elseif (SobGroup_GetCurrentOrder(CustomGroup) == COMMAND_Attack) then
        updateDefenseFighterAttack(CustomGroup, playerID, shipID)
    end

end



