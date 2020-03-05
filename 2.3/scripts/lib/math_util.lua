--Math utility functions.

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return floor(num * mult + 0.5) / mult
end
