
local module = {}

local opts = { o = vim.o, bo = vim.bo, wo = vim.wo }

function opt(scope, key, value)
	opts[scope][key] = value	
	if scope ~= 'o' then
		opts['o'][key] = value
	end
end

function module.apply(options) 
	for key, value in pairs(options.global) do
		opt('o', key, value)
	end
	for key, value in pairs(options.window) do
		opt('wo', key, value)
	end
	for key, value in pairs(options.buffer) do
		opt('bo', key, value)
	end
end

return module
