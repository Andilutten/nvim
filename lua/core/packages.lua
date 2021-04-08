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
	use [[norcalli/snippets.nvim]]
	use [[kyazdani42/nvim-tree.lua]]
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}

	-- UI stuff
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use [[tjdevries/colorbuddy.vim]]
	use [[Th3Whit3Wolf/onebuddy]]
	use [[norcalli/nvim-colorizer.lua]]
	use [[kyazdani42/nvim-web-devicons]]

end)
