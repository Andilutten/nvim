local lspconfig = require'lspconfig'
local keymaps = require'util.keymaps'
local options = require'util.options'
local api, fn = vim.api, vim.fn

local on_attach = function(client)
	keymaps.buf_bind {
		["n|<leader>ca"] 	= keymaps.cmd[[lua vim.lsp.buf.code_action()]],
		["n|K"] 			= keymaps.cmd[[lua vim.lsp.buf.hover()]],
		["n|<f2>"] 			= keymaps.cmd[[lua vim.lsp.buf.rename()]],
		["n|<leader>dl"]	= keymaps.cmd[[lua vim.lsp.diagnostic.set_loclist()]],

		["n|<leader>gd"]	= keymaps.cmd[[lua vim.lsp.buf.definition()]],
		["n|<leader>gr"]	= keymaps.cmd[[lua vim.lsp.buf.references()]],

		["v|<leader>ca"] 	= keymaps.cmd[[lua vim.lsp.buf.range_code_action()]],
	}

	fn.sign_define('LspDiagnosticsSignHint', {text = ""})
	fn.sign_define('LspDiagnosticsSignWarning', {text = ""})
	fn.sign_define('LspDiagnosticsSignError', {text = ""})

	options.buf_apply {
		omnifunc = 'v:lua.vim.lsp.omnifunc'
	}

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

local system_name = "Linux" -- (Linux, macOS, or Windows)
local sumneko_root_path = os.getenv'HOME'..'/Source/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

lspconfig.sumneko_lua.setup({
	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
	-- An example of settings for an LSP server.
	--    For more options, see nvim-lspconfig
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim', 'use'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
					[vim.fn.expand('$HOME/.local/share/nvim/site/pack/packer/start/?/lua')] = true
				},
			},
		}
	},

	on_attach = on_attach
})
