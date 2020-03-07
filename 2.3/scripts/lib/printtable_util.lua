--Print Table utility functions.

function _printTbl(tbl, indent)
	if (indent == nil) then
		indent = 0
	end
	local indent_str = ""
	if (indent > 0) then
		local cur_indents = 0
		while (cur_indents ~= indent) do
			indent_str = indent_str .. "\t"
			cur_indents = cur_indents + 1
		end
	end
	for k, v in tbl do
		if type(v) == "table" then
			print(indent_str .. "\"" .. k .. "\": {")
			_printTbl(v, indent + 1, self)
			print(indent_str .. "},")
		else
			if (type(v) ~= "number") then
				v = "\"" .. tostring(v) .. "\""
			end
			print(indent_str .. "\"" .. k .. "\": " .. v .. ',')
		end
	end
end

function printTbl(tbl, label)
	if (label == nil) then
		label = tostring(tbl)
	end
	local temp_tbl = {}
	temp_tbl[label] = tbl
	_printTbl(temp_tbl)
end
