local env = vim.env

env.EDITOR = 'nvr -cc split --remote-wait'

require'core.options'
require'core.packages'
require'core.keymaps'
require'core.lsp'
require'core.ui'
require'core.autocmds'

-- TODO Move to own module
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
}
