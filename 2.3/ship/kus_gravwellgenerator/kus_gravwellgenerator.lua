---
--- ===== ABILITY: =====
---

function Start_Kus_GravWellGenerator(CustomGroup, playerIndex, shipID)
	GlobalGravitywellTable[shipID] = gravitywell_default_group
	FX_StartEvent(CustomGroup, "gravwellon_sfx" .. random(1, 6))
	SobGroup_AbilityActivate(CustomGroup, AB_Hyperspace, 0)
end

-- See scripts\playerspatch\ships_util\
function Do_Kus_GravWellGenerator(CustomGroup, playerIndex, shipID)
	FX_StartEvent(CustomGroup, "PowerUp")
	SobGroup_TakeDamage(CustomGroup, 0.0095)

	local stunnable_ships = Gravwell_CalcStunnableShipsGroup("stunnable-ships-" .. shipID .. "-" .. Universe_GameTime(), CustomGroup, shipID)
	
	-- refresh targets, undo ability disable on escaped ships
	Gravwell_FreeEscapedShips(stunnable_ships, shipID)

	-- stunning (abilities)
	Gravwell_SetGroupStunned(stunnable_ships, 1)

	-- slowdown
	SobGroup_AlterSpeedMult(stunnable_ships, 0.3)

	-- tumbling
	local tumble_vector = Gravwell_CalcTumbleVecForGroup(stunnable_ships)
	SobGroup_Tumble(stunnable_ships, tumble_vector)

	-- no errs, save this in the register
	GlobalGravitywellTable[shipID] = stunnable_ships;
end

function Finish_Kus_GravWellGenerator(CustomGroup, playerIndex, shipID)
	local stunned_group = GlobalGravitywellTable[shipID]
	Gravwell_FreeGroup(stunned_group)
	
	GlobalGravitywellTable[shipID] = gravitywell_default_group
	FX_StartEvent(CustomGroup, "gravwellcollapse_sfx" .. random(1, 3))
	SobGroup_AbilityActivate(CustomGroup, AB_Hyperspace, 1)
end

--
-- ===== AUTORUN: =====
--

function Create_Kus_GravWellGenerator(CustomGroup, playerIndex, shipID)
	-- sp stuff
	SobGroup_CreateIfNotExist("GravWell_Temp0")
	SobGroup_CreateIfNotExist("GravWell_Temp1")
end

function Update_Kus_GravWellGenerator(CustomGroup,playerIndex,shipID)
  NoSalvageScuttle(CustomGroup, playerIndex, shipID)

  if (Player_GetLevelOfDifficulty(playerIndex) > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(-1, "Special_Splitter")== 1) then
    local listCount = getn(GravityWellGeneratorShipList)
    local alliedShips,enemyShips = 0,0

    for i = 0, Universe_PlayerCount()- 1 do
      if (Player_IsAlive(i)== 1) then
        SobGroup_Clear("GravWell_Temp0")

        for x = 1, listCount do
          SobGroup_FillShipsByType("GravWell_Temp0", "Player_Ships"..i, GravityWellGeneratorShipList[x])
          SobGroup_SobGroupAdd("GravWell_Temp1", "GravWell_Temp0")
        end

        if (SobGroup_FillProximitySobGroup("GravWell_Temp0", "GravWell_Temp1", CustomGroup, GravityWellDistance)== 1) then
          if (AreAllied(playerIndex, i)== 1) then
            alliedShips = alliedShips + SobGroup_Count("GravWell_Temp0")
          else
            enemyShips = enemyShips + SobGroup_Count("GravWell_Temp0")
          end
        end
      end
    end

    if (enemyShips > 8 and enemyShips > (alliedShips * 2)) then
      SobGroup_CustomCommand(CustomGroup)
    end

    SobGroup_FillShipsByType("GravWell_Temp0", "Player_Ships"..playerIndex,  PlayerRace_GetString(playerIndex, "def_type_mothership", ""))

    if (SobGroup_Count("GravWell_Temp0") > 0) then
      SobGroup_ParadeSobGroup(CustomGroup, "GravWell_Temp0", 0)
    else
      SobGroup_FillShipsByType("GravWell_Temp0", "Player_Ships"..playerIndex,  PlayerRace_GetString(playerIndex, "def_type_carrier", ""))

      if (SobGroup_Count("GravWell_Temp0") > 0) then
        SobGroup_ParadeSobGroup(CustomGroup, "GravWell_Temp0", 0)
      end
    end
  end
end

function Destroy_Kus_GravWellGenerator(CustomGroup, playerIndex, shipID)
	GlobalGravitywellTable[shipID] = nil
end
