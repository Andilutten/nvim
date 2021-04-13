return require'packer'.startup(function()

	use [[wbthomason/packer.nvim]]

	-- Must haves
	use [[tpope/vim-commentary]]
	use [[tpope/vim-surround]]
	use [[tpope/vim-fugitive]]
	use [[tpope/vim-unimpaired]]
	use [[tpope/vim-sleuth]]

	-- Integration plugins
	use [[junegunn/gv.vim]]

	-- IDE features
	use [[neovim/nvim-lspconfig]]
	use [[simrat39/rust-tools.nvim]]
	use [[akinsho/flutter-tools.nvim]]
	use [[norcalli/snippets.nvim]]
	use [[kyazdani42/nvim-tree.lua]]
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}

	-- UI stuff
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use { "lukas-reineke/indent-blankline.nvim", branch = "lua" }
	use [[tjdevries/colorbuddy.vim]]
	use [[Th3Whit3Wolf/onebuddy]]
	use [[norcalli/nvim-colorizer.lua]]
	use [[kyazdani42/nvim-web-devicons]]
	use { 
		'akinsho/nvim-bufferline.lua',
		config = function()
			require('bufferline').setup{
				options = {
					modified_icon = '✥',
					buffer_close_icon = '',
					mappings = true,
					always_show_bufferline = true,
					diagnostics = 'nvim_lsp',
				},
			}
		end
	}
	use { 
		"glepnir/galaxyline.nvim", 
		config = function() 
			require'core.galaxyline' 
		end
	}

end)
