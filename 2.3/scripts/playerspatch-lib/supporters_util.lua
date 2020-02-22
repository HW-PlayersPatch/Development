dofilepath("data:scripts/table_util.lua")
dofilepath("data:scripts/playerspatch-util/helpers.lua")

function MemGroup_IsSupporter(ship)
	if (strfind(ship.CustomGroup, "repair") or strfind(ship.CustomGroup, "support")) then
		return 1
	end
	return nil
end

function MemGroup_IsSupported(ship)
	if (SobGroup_GetSobGroupRepairingGroup(ship.CustomGroup)) then
		return 1
	end
	return nil
end

function MemGroup_IsSupporterOf(ship, other)
	-- if ship is not a supporter, or if target is not registering any supporters, give up
	if (MemGroup_IsSupporter(ship) == nil || MemGroup_IsSupported(other) == nil) then
		return nil
	end
	if (SobGroup_Intersects(SobGroup_GetSobGroupRepairingGroup(other.CustomGroup), ship.CustomGroup)) then
		return 1
	end
	return nil
end

function MemGroup_IsSupportedBy(ship, other)
	if (MemGroup_IsSupporter(other) == nil || MemGroup_IsSupported(ship) == nil) then
		return nil
	end
	if (SobGroup_Intersects(SobGroup_GetSobGroupRepairingGroup(ship.CustomGroup), other.CustomGroup)) then
		return 1
	end
	return nil
end

function MemGroup_GetSupportersOf(ship)
	return GLOBAL_SHIPS:GetEntities(function (other) return MemGroup_IsSupporterOf(other, ship) end)
end

function MemGroup_GetSupportTargets(ship)
	return GLOBAL_SHIPS:GetEntities(function (other) return MemGroup_IsSupportedBy(other, ship) end)
end
