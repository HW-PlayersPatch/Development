dofilepath("data:scripts/table_util.lua")
dofilepath("data:scripts/playerspatch-util/helpers.lua")

function SuppUtil_GetFamilyWeight(family)
	if (family == 'production') then return 100
	elseif (family == 'capital') then return 40
	elseif (family == 'frigate') then return 20
	elseif (family == 'corvette') then return 10
	elseif (family == 'resourcing') then return 30
	else return 5 end
end

function SuppUtil_IsSupporter(ship)
	if (strfind(ship.CustomGroup, "repair") or strfind(ship.CustomGroup, "support")) then
		return 1
	end
	return nil
end

function SuppUtil_IsSupported(ship)
	if (SobGroup_GetSobGroupRepairingGroup(ship.CustomGroup)) then
		return 1
	end
	return nil
end

function SuppUtil_IsSupporterOf(ship, other)
	-- if ship is not a supporter, or if target is not registering any supporters, give up
	if (SuppUtil_IsSupporter(ship) == nil or SuppUtil_IsSupported(other) == nil) then
		return nil
	end
	if (SobGroup_Intersects(SobGroup_GetSobGroupRepairingGroup(other.CustomGroup), ship.CustomGroup)) then
		return 1
	end
	return nil
end

function SuppUtil_IsSupportedBy(ship, other)
	if (SuppUtil_IsSupporter(other) == nil or SuppUtil_IsSupported(ship) == nil) then
		return nil
	end
	-- sobgroup calls
	if (SobGroup_Intersects(SobGroup_GetSobGroupRepairingGroup(ship.CustomGroup), other.CustomGroup)) then
		return 1
	end
	return nil
end

function SuppUtil_GetSupportersOf(ship)
	return GLOBAL_SHIPS:GetEntities(function (other) return SuppUtil_IsSupporterOf(other, ship) end)
end

function SuppUtil_GetSupportTargets(ship)
	return GLOBAL_SHIPS:GetEntities(function (other) return SuppUtil_IsSupportedBy(other, ship) end)
end

function SuppUtil_CalcTotalWeight(ship)
	local family_weight = SuppUtil_GetFamilyWeight(ship.family_type)
	print("Calced weight " .. family_weight .. " for ship type: " .. ship.family_type)
end

function SuppUtil_TriageSort(targets)

	local comparitorFn = function (ship_a, ship_b)
		local family_weight = SuppUtil_FAMILY_WEIGHTS[]
	end
end