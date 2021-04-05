local module = {}

function split_str(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function module.bind(mappings) 
	for mapping, cmd in pairs(mappings) do
		local parts = split_str(mapping, "|")
		local mode, keys = parts[1], parts[2]
		vim.api.nvim_set_keymap(mode, keys, cmd, {noremap=true})
	end
end

function module.buf_bind(mappings)
	for mapping, cmd in pairs(mappings) do
		local parts = split_str(mapping, "|")
		local mode, keys = parts[1], parts[2]
		vim.api.nvim_buf_set_keymap(0, mode, keys, cmd, {noremap=true})
	end
end

function module.cmd(command)
	return "<cmd>" .. command .. "<cr>"
end

return module
