-- Currently configured for 1 call per second. Heals when it hasn't been damaged in the last x seconds (CF_MEM.combat_ticks_length).

CF_MEM = MemGroup.create('cloaked_fighters', {
    combat_ticks_length = 15
})

-- init a new entry
function log_new_cf(shipID)
    local props = {
        combat_ticks_queue = {},
        current_HP = nil,
        last_checked_HP = nil
    }
    for i = 1, CF_MEM.combat_ticks_length do
        new_cf.combat_ticks_queue[i] = 0
    end
    CF_MEM:set(shipID, props)
    return CF_MEM:get(shipID)
end

function Create_Kus_CloakedFighter(CustomGroup, playerIndex, shipID)
    log_new_cf(shipID)
end

-- main loop
-- We store the unit's combat status as the last entry of an N-length queue, and every update (every r seconds), 
-- this value is moved down the queue.
-- If the entire queue contains a non-combat status (0), the ship will begin regerating at an accelerated pace.
-- The time taken for a unit to begin regenerating is therefore N * r.
-- We combine the granularity of the rapid-checking and the controllable nature of long-checking by rapidly 
-- checking into a queue (granularity), but requiring a totally clean queue for regeneration to kick in (controllability).
function Update_Kus_CloakedFighter(CustomGroup, playerIndex, shipID)

    local this_cf = CF_MEM:get(shipID)

    this_cf.current_HP = SobGroup_HealthPercentage(CustomGroup)
    for i = 1, CF_MEM.combat_ticks_length - 1 do
        this_cf.combat_ticks_queue[i] = this_cf.combat_ticks_queue[i + 1]
    end
    
    if this_cf.last_checked_HP ~= nil then
        if this_cf.current_HP < this_cf.last_checked_HP then
            this_cf.combat_ticks_queue[CF_MEM.combat_ticks_length] = 1
        else
            this_cf.combat_ticks_queue[CF_MEM.combat_ticks_length] = 0
        end

        local regen_enabled = 1
        for i = 1, CF_MEM.combat_ticks_length do
            if this_cf.combat_ticks_queue[i] == 1 then -- in combat within window
                regen_enabled = 0
            end
        end
        if this_cf.current_HP == 1 then -- fully healed
            regen_enabled = 0
        end

        if regen_enabled == 1 then
            if (SobGroup_UnderAttack(CustomGroup) == 0) then -- not under attack
                if (SobGroup_IsDocked(CustomGroup) == 0) then -- not docked
                    if (SobGroup_GetActualSpeed(CustomGroup) < 1) then -- stopped
                        SobGroup_SetHealth(CustomGroup, this_cf.current_HP + 0.016) -- fully heals in about 60 seconds with 1 call per second
                    end
                end
            end
        end
    end

    this_cf.last_checked_HP = SobGroup_HealthPercentage(CustomGroup)
end

function Destroy_Kus_CloakedFighter(CustomGroup, playerIndex, shipID)
    CF_MEM:delete(shipID)
end