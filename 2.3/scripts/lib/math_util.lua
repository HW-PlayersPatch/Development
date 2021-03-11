--Math utility functions.

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return floor(num * mult + 0.5) / mult
end

function modulo(n, m)
	return n - floor(n / m) * m
end

function pow(n, m)
	local out = 1
	for i = 0, m do
		out = out * n
	end
	return out
end