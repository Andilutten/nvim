local keymaps = require'util.keymaps'

vim.g.mapleader = " "

keymaps.bind{
	["n|<leader>ff"] 	= keymaps.cmd'Telescope find_files',
	["n|<c-b>"] 		= keymaps.cmd'NvimTreeToggle',
	["n|<leader>so"] 	= keymaps.cmd'luafile %',

	["t|<esc>"] 		= "<C-\\><C-n>",
}
