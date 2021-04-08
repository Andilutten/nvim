local options = require'util.options'
local HOME = os.getenv'HOME'

options.apply{
	global = {
		hlsearch = false,
		incsearch = true,
		inccommand = 'nosplit',
		hidden = true,
		splitright = true,
		splitbelow = true,
		swapfile = false,
		backup = false,
		undofile = true,
		undodir = HOME..'/.cache/vimundo',
		completeopt = 'menuone,noinsert,noselect',
		shiftround = true,
		mouse = 'a',
		scrolloff = 8
	},
	window = {
		number = true,
		relativenumber = true,
		signcolumn = 'auto',
		colorcolumn = '80',
		wrap = false,
	},
	buffer = {
		tabstop = 4,
		shiftwidth = 4,
		expandtab = false
	},
}
