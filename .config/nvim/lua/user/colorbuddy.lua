M = {
  "tjdevries/colorbuddy.nvim",
}

function M.config()
    local colorbuddy = require('colorbuddy')
    local colors = require('user.colors')
    colorbuddy.colorscheme('gruvbuddy')

    local Color = colorbuddy.Color
    local Group = colorbuddy.Group
    local c = colorbuddy.colors
    local g = colorbuddy.groups
    local s = colorbuddy.styles

    Color.new('white', colors.text)
    Color.new('red', colors.red)
    Color.new('pink', colors.pink)
    Color.new('green', colors.green)
    Color.new('yellow', colors.yellow)
    Color.new('blue', colors.blue)
    Color.new('aqua', colors.sky)
    Color.new('cyan', colors.lavender)
    Color.new('purple', colors.mauve)
    Color.new('violet', colors.flamingo)
    Color.new('orange', colors.peach)
    Color.new('brown', colors.maroon)

    local background_string = "#111111"
    Color.new("background", background_string)
    Color.new("gray0", background_string)

    Group.new("Normal", c.superwhite, c.gray0)

    Group.new("@constant", c.orange, nil, s.none)
    Group.new("@function", c.yellow, nil, s.none)
    Group.new("@function.bracket", g.Normal, g.Normal)
    Group.new("@keyword", c.violet, nil, s.none)
    Group.new("@keyword.faded", g.nontext.fg:light(), nil, s.none)
    Group.new("@property", c.blue)
    Group.new("@variable", c.superwhite, nil)
    Group.new("@variable.builtin", c.purple:light():light(), g.Normal)

    -- I've always liked lua function calls to be blue. I don't know why.
    Group.new("@function.call.lua", c.blue:dark(), nil, nil)
end

return M
