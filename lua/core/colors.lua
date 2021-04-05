local Color, colors, Group, groups, styles = require'colorbuddy'.setup()

Color.new('background', '#212121')
Color.new('foreground', '#FFFFFF')

Group.new('Normal', colors.foreground, colors.background, nil)
Group.new('EndOfBuffer', colors.background, colors.background, nil)
