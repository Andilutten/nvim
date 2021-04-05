require'core.options'
require'core.packages'
require'core.keymaps'
require'core.colors'
require'core.lsp'

-- TODO Move to own module
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
}
