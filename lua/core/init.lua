require'core.options'
require'core.packages'
require'core.keymaps'
require'core.lsp'
require'core.ui'

-- TODO Move to own module
vim.env.EDITOR = 'nvr -cc split --remote-wait'

-- TODO Fix this nasty stuff
vim.cmd[[autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete]]

-- TODO Move to own module
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
}
