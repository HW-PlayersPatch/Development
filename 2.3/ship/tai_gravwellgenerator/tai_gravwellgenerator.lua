---
--- ===== ABILITY: =====
---

function Start_Tai_GravWellGenerator(CustomGroup, playerIndex, shipID)
	GW_MEM:Start(CustomGroup, playerIndex, shipID)
end

-- See scripts\playerspatch\ships_util\lib\gravwells.lua
function Do_Tai_GravWellGenerator(CustomGroup, playerIndex, shipID)
	GW_MEM:Do(CustomGroup, playerIndex, shipID)
end

function Finish_Tai_GravWellGenerator(CustomGroup, playerIndex, shipID)
	GW_MEM:Finish(CustomGroup, playerIndex, shipID)
end

--
-- ===== AUTORUN: =====
--

function Create_Tai_GravWellGenerator(CustomGroup, playerIndex, shipID)
	GW_MEM:Create(CustomGroup, playerIndex, shipID)
end

function Update_Tai_GravWellGenerator(CustomGroup, playerIndex, shipID)
	GW_MEM:Update(CustomGroup, playerIndex, shipID)
end

function Destroy_Tai_GravWellGenerator(CustomGroup, playerIndex, shipID)
	GW_MEM:Destroy(CustomGroup, playerIndex, shipID)
end