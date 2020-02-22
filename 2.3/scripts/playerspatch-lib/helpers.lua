function Player_GetGroupShipsOfType(playerIndex, group, ship_type)
	return Player_GetShipsByFilterInclude(playerIndex, group, "ShipType", ship_type)
end

function SobGroup_Intersects(group, other)
	if (SobGroup_Count(SobGroup_FillIntersect("_", group, other)) > 0) then
		return 1
	end
	return 0
end