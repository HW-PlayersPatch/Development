-- reference fleet for this level

Fleet = 
{
    -- these are the ships we expect the player to have:
    {
        Type = "Kus_Mothership",
        Number = 1,
    },
    {
        Type = "Kus_ResearchShip",
        Number = 1,
    },
    {
        Type = "Kus_ResourceCollector",
        Number = 4,
    },
    {
        Type = "Kus_SalvageCorvette",
        Number = 4,
    }, 
    {
        Type = "Kus_Interceptor",
        Number =12,
    },
    {
        Type = "Kus_HeavyCorvette",
        Number = 9,
    },
    {
        Type = "Kus_AttackBomber",
        Number = 10,
    },
    {
        Type = "Kus_LightCorvette",
        Number = 5,
    },
    {
        Type = "Kus_AssaultFrigate",
        Number = 5,
    },
    {
        Type = "Kus_IonCannonFrigate",
        Number = 6,
    },
    {
        Type = "Kus_Destroyer",
        Number = 3,
    },
}

-- and we think they should have this much money:
RUs = 2500

--Load expanded options
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
RefMissionDifficultyScale = GetMissionDifficultyScale()

multiplierForExtraShips = RefMissionDifficultyScale
multiplierForExtraRU = RefMissionDifficultyScale