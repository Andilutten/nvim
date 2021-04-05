local lspconfig = require'lspconfig'
local keymaps = require'util.keymaps'
local api = vim.api

local on_attach = function(client)
	keymaps.buf_bind {
		["n|K"] 	= keymaps.cmd'lua vim.lsp.buf.hover()',
		["n|<c-]>"]	= keymaps.cmd'lua vim.lsp.buf.definition()',
		["n|<f2>"] 	= keymaps.cmd'lua vim.lsp.buf.rename()',
	}

	api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local servers = {
	"tsserver",
	"gopls",
}

for _, server in ipairs(servers) do
	lspconfig[server].setup {
		on_attach = on_attach,
	}
end
