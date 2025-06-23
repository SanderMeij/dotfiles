local M = {
    "echasnovski/mini.icons",
}

M.config = function(_, _)
    local colorbuddy = require("colorbuddy")
    colorbuddy.Group.new("MiniIconsAzure", colorbuddy.colors.magenta)
    colorbuddy.Group.new("MiniIconsBlue", colorbuddy.colors.blue)
    colorbuddy.Group.new("MiniIconsCyan", colorbuddy.colors.cyan)
    colorbuddy.Group.new("MiniIconsGreen", colorbuddy.colors.green)
    colorbuddy.Group.new("MiniIconsGrey", colorbuddy.colors.grey)
    colorbuddy.Group.new("MiniIconsOrange", colorbuddy.colors.orange)
    colorbuddy.Group.new("MiniIconsPurple", colorbuddy.colors.purple)
    colorbuddy.Group.new("MiniIconsRed", colorbuddy.colors.red)
    colorbuddy.Group.new("MiniIconsYellow", colorbuddy.colors.yellow)
end

return M
