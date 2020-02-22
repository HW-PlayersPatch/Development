function filter(table, predicate)
	local out = {}
	for i, v in table do
		if (predicate(v, i, table)) then
			out[i] = v
		end
	end
	return out
end

function map(table, transform)
	local out = {}
	for i, v in table do
		out[i] = transform(v, i, table)
	end
	return out
end

function reduce(table, accumulator, initial_value)
	local out = initial_value
	for i, v in table do
		out = accumulator(out, v, i, table)
	end
	return out
end

function includesValue(table, value)
	for i, v in table do
		if v == value then
			return true
		end
	end
	return false
end

function includesKey(table, value)
	for i, v in table do
		if i == value then
			return true
		end
	end
	return false
end