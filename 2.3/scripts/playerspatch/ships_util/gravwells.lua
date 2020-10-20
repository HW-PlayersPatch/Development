dofilepath("data:scripts/playerspatch/ships_util/global.lua")
dofilepath("data:scripts/lib/math_util.lua")

GW_TARGET_TYPES = {
	"hgn_scout",
	"hgn_interceptor",
	"hgn_attackbomber",
	"hgn_assaultcorvette",
	"hgn_pulsarcorvette",
	"hgn_minelayercorvette",
	"vgr_scout",
	"vgr_interceptor",
	"vgr_lancefighter",
	"vgr_bomber",
	"vgr_missilecorvette",
	"vgr_lasercorvette",
	"vgr_commandcorvette",
	"vgr_minelayercorvette",
	"kus_scout",
	"kus_interceptor",
	"kus_attackbomber",
	"kus_defender",
	"kus_cloakedfighter",
	"kus_lightcorvette",
	"kus_heavycorvette",
	"kus_repaircorvette",
	"kus_multiguncorvette",
	"kus_minelayercorvette",
	"tai_scout",
	"tai_interceptor",
	"tai_attackbomber",
	"tai_defender",
	"tai_defensefighter",
	"tai_lightcorvette",
	"tai_heavycorvette",
	"tai_repaircorvette",
	"tai_multiguncorvette",
	"tai_minelayercorvette",
	--32
	"junk_junkyarddog",
	"tur_fighter",
	"tur_missilecorvette",
	"tur_standardcorvette",
	"kad_swarmer",
	"kad_advancedswarmer"
}
GW_ABILITY_DISABLE_LIST = {
	AB_Move,
	AB_Steering,
	AB_Attack,
	AB_Targeting
}
GW_SALV_LIST = "kus_salvagecorvette, tai_salvagecorvette"
GW_RADIUS = 3000
GW_GLOW_ANIMATION = "PowerOff"
GW_TICK_DAMAGE = 0.0190
GW_DEFAULT_GROUP = SobGroup_CreateAndClear("__gravwell_default_group")
GW_TUMBLE_SPICE = { -- premade random table
	0.69,
	1 / 0.37,
	0.51,
	0.64,
	1 / 0.14,
	1 / 0.32,
	0.15,
	0.35,
	1 / 0.33,
	0.70,
	0.47,
	1 / 0.02
}
GW_SPICE_INDEX = 0

GlobalGravitywellTable = {} -- temp. until memgroup stuff is ready

-- calc which ships are in our radius
function Gravwell_CalcStunnableShipsGroup(target_group, CustomGroup, shipID)
	local all_ships = Sobgroup_GetAllActiveShips()
	local ships_in_radius = SobGroup_CreateAndClear("ships-in-radius" .. shipID)
	SobGroup_FillProximitySobGroup(ships_in_radius, all_ships, CustomGroup, GW_RADIUS)
	local stunnable_ships = SobGroup_CreateAndClear("temp-stunnable-ships-" .. shipID .. "-" .. Universe_GameTime())
	for _, ship_type in GW_TARGET_TYPES do
		local temp_fill_group = SobGroup_CreateAndClear("acc" .. shipID)
		SobGroup_FillShipsByType(temp_fill_group, ships_in_radius, ship_type)
		SobGroup_SobGroupAdd(stunnable_ships, temp_fill_group)
	end
	SobGroup_CreateAndClear(target_group)
	SobGroup_SobGroupAdd(target_group, stunnable_ships)

	return target_group
end

-- applies 'random' multipliers to the pitch/yaw/roll values of the groups tumble vector
-- random vals are actually a pregenned list indexed using Universe_GameTime()
function Gravwell_CalcTumbleVecForGroup(target_group)
	local tumble_vector = SobGroup_GetPosition(target_group)
	for i = 1, 3 do
		local index = GW_SPICE_INDEX
		local spice = GW_TUMBLE_SPICE[index] or 0.5
		GW_SPICE_INDEX = modulo(floor(abs(Universe_GameTime() * pow(10, i))), getn(GW_TUMBLE_SPICE) + 1)
		tumble_vector[i] = modulo(tumble_vector[i] * spice, 1)
	end
	return tumble_vector
end

-- frees the given group from any effects this gravwell was applying
function Gravwell_FreeGroup(target_group)
	if (target_group ~= nil and target_group ~= GW_DEFAULT_GROUP) then
		if (SobGroup_Count(target_group) > 0) then
			Gravwell_SetGroupStunned(target_group, 0)
			SobGroup_SetSpeed(target_group, 1)
			FX_StopEvent(target_group, GW_GLOW_ANIMATION)
		end
	end
end

-- frees any ships from the previous run which have since escaped the gravwell's effect range
function Gravwell_FreeEscapedShips(stunnable_ships, shipID)
	local old_stunned_group = GlobalGravitywellTable[shipID]
	local escaped_ships = SobGroup_CreateAndClear("escaped-ships" .. shipID)
	if (old_stunned_group ~= nil and old_stunned_group ~= GW_DEFAULT_GROUP) then
		local temp_fill_group = SobGroup_CreateAndClear("escaped-ships-temp" .. shipID)
		SobGroup_FillSubstract(temp_fill_group, old_stunned_group, stunnable_ships)
		SobGroup_SobGroupAdd(escaped_ships, temp_fill_group)
		Gravwell_FreeGroup(escaped_ships)
	end
	return escaped_ships
end

-- sets whether the given group should be 'stunned' or not (AB_Move/AB_Steering/AB_Attack/AB_Targeting)
function Gravwell_SetGroupStunned(target_group, stunned)
	if (stunned == 1) then
		FX_StartEvent(target_group, GW_GLOW_ANIMATION)
	end
	local ability_status = modulo(stunned + 1, 2) -- 0 -> 1, 1 -> 0, 2 -> 1, ...
	for _, ability in GW_ABILITY_DISABLE_LIST do
		SobGroup_AbilityActivate(target_group, ability, ability_status)
	end
	return target_group
end
