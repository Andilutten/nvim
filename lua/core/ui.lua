local options = require'util.options'
local colorbuddy = require'colorbuddy'

local Color, colors, Group, groups = colorbuddy.setup()

options.apply {
  global = {
    termguicolors = true,
    background = 'dark',
  }
}

colorbuddy.colorscheme('onebuddy')

Group.new('EndOfBuffer', colors.syntax_bg, colors.syntax_bg)

require'bufferline'.setup{}
require'colorizer'.setup{}
