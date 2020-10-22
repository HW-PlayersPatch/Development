dofilepath("data:scripts/lib/print_table.lua")

-- Cloaked fighter regeneration
-- By: Fear

CF_MEM = MemGroup.Create('cloaked_fighters', {
    combat_ticks_length = 20
})

-- Currently configured for 2 calls per second. Heals when it hasn't been damaged in the last x/2 seconds (combat_ticks_length/2).

function Create_Kus_CloakedFighter(CustomGroup, playerIndex, shipID)
    local queue = {}
    for i = 1, CF_MEM.combat_ticks_length do
        queue[i] = 0
    end
    CF_MEM:set(shipID, {
        self_group = CustomGroup,
        combat_ticks_queue = queue,
        current_HP = nil,
        last_checked_HP = nil
    })
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

    this_cf.current_HP = SobGroup_HealthPercentage(this_cf.self_group)
    for i = 1, CF_MEM.combat_ticks_length - 1 do
        this_cf.combat_ticks_queue[i] = this_cf.combat_ticks_queue[i + 1]
    end
    
    if (this_cf.last_checked_HP ~= nil) then
        
        if (this_cf.current_HP < this_cf.last_checked_HP) then
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
            if (
                SobGroup_IsDocked(this_cf.self_group) and
                SobGroup_AreAllInRealSpace(this_cf.self_group) == 1 and
                SobGroup_GetActualSpeed(this_cf.group) < 10
            ) then -- not under attack
                SobGroup_SetHealth(this_cf.self_group, this_cf.current_HP + 0.016) -- fully heals in about 60 seconds with 1 call per second
            end
        end
    end

    this_cf.last_checked_HP = SobGroup_HealthPercentage(this_cf.self_group)
end

function Destroy_Kus_CloakedFighter(CustomGroup, playerIndex, shipID)
    CF_MEM:delete(shipID)
end