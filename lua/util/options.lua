local api = vim.api
local module = {}

local opts = { o = vim.o, bo = vim.bo, wo = vim.wo }

function opt(scope, key, value)
	opts[scope][key] = value
	if scope ~= 'o' then
		opts['o'][key] = value
	end
end

function module.apply(options)
	local global = options.global or {}
	local window = options.window or {}
	local buffer = options.buffer or {}

	for key, value in pairs(global) do
		opt('o', key, value)
	end
	for key, value in pairs(window) do
		opt('wo', key, value)
	end
	for key, value in pairs(buffer) do
		opt('bo', key, value)
	end
end

function module.buf_apply(options)
	for opt, value in pairs(options) do
		api.nvim_buf_set_option(0, opt, value)
	end
end

return module
