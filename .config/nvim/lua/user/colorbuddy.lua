M = {
    "tjdevries/colorbuddy.nvim",
    lazy = false,
    priority = 1000,
}

function M.config()
    local colorbuddy = require("colorbuddy")
    colorbuddy.colorscheme("sander")

    local Color = colorbuddy.Color
    local Group = colorbuddy.Group

    local colors = colorbuddy.colors
    local groups = colorbuddy.groups
    local styles = colorbuddy.styles

    for label, color in pairs(require("user.colors")) do
        Color.new(label, color)
    end

    Group.new("Invisble", colors.gray1)
    Group.new("Primary", colors.primary)
    Group.new("Secondary", colors.secondary)
    Group.new("Green50", colors.green_50)
    Group.new("Cyan50", colors.cyan_50)
    Group.new("Blue50", colors.blue_50)
    Group.new("Violet50", colors.violet_50)
    Group.new("Magenta50", colors.magenta_50)
    Group.new("Red50", colors.red_50)
    Group.new("Orange50", colors.orange_50)
    Group.new("Yellow50", colors.yellow_50)
    Group.new("Green75", colors.green_75)
    Group.new("Cyan75", colors.cyan_75)
    Group.new("Blue75", colors.blue_75)
    Group.new("Violet75", colors.violet_75)
    Group.new("Magenta75", colors.magenta_75)
    Group.new("Red75", colors.red_75)
    Group.new("Orange75", colors.orange_75)
    Group.new("Yellow75", colors.yellow_75)

    Group.new("LineNr", colors.gray3, colors.gray0)
    Group.new("Normal", colors.foreground, colors.gray1)
    Group.new("PMenuSel", colors.gray1, colors.primary)
    Group.new("Special", colors.cyan)
    Group.new("WinBarNC", colors.foreground, colors.black)
    Group.new("Visual", nil, colors.gray3)
    Group.new("FloatBorder", colors.gray6)
    Group.new("CurSearch", colors.gray1, colors.primary)
    Group.new("Search", nil, colors.gray6)

    Group.new("Background", groups.Normal)
    Group.new("NormalFloat", groups.Normal)
    Group.new("MsgArea", groups.Normal)
    Group.new("PMenu", groups.NormalFloat)
    Group.new("WinBar", colors.foreground, colors.gray0)

    Group.new("Added", colors.green)
    Group.new("DiffAdded", groups.Added)
    Group.new("Changed", colors.yellow)
    Group.new("DiffChanged", groups.changed)
    Group.new("Removed", colors.red)
    Group.new("DiffRemoved", groups.removed)

    Group.new("WarningMsg", colors.yellow)
    Group.new("ErrorMsg", colors.red)
    Group.new("ModeMsg", colors.green)
    Group.new("MoreMsg", colors.blue)

    Group.new("DiagnosticOk", colors.green)
    Group.new("DiagnosticHint", colors.cyan)
    Group.new("DiagnosticInfo", colors.blue)
    Group.new("DiagnosticWarn", colors.yellow)
    Group.new("DiagnosticError", colors.red)

    Group.new("Comment", colors.gray8)
    Group.new("Constant", colors.red) -- any constant
    Group.new("String", colors.green) -- a string constant: "this is a string"
    Group.new("Character", colors.green) -- a character constant: 'p', '\n'
    Group.new("Number", colors.magenta) -- a number constant: 234, 0xff
    Group.new("Boolean", colors.yellow)
    Group.new("Float", colors.magenta) -- a floating point constant: 2.3e10
    Group.new("Identifier", colors.fg)
    Group.new("Function", colors.blue)
    Group.new("Statement", colors.fg) -- any statement
    Group.new("Conditional", colors.blue) -- if, then, else, endif, switch, etc.
    Group.new("Repeat", colors.purple) -- for, do, while, etc.
    Group.new("Label", colors.purple) -- case, default, etc.
    Group.new("Operator", colors.yellow) -- sizeof", "+", "*", etc.
    Group.new("Keyword", colors.purple)
    Group.new("Exception", colors.purple) -- try, catch, throw
    Group.new("PreProc", colors.red) -- generic Preprocessor
    Group.new("Include", colors.purple) -- preprocessor #include
    Group.new("Define", colors.red) -- preprocessor #define
    Group.new("Macro", colors.red) -- same as Define
    Group.new("PreCondit", colors.red) -- preprocessor #if, #else, #endif, etc.
    Group.new("Type", colors.yellow) -- int, long, char, etc.
    Group.new("StorageClass", colors.yellow) -- static, register, volatile, etc.
    Group.new("Structure", colors.red) -- struct, union, enum, etc.
    Group.new("Typedef", colors.yellow) -- A typedef
    Group.new("Special", colors.blue) -- any special symbol
    Group.new("SpecialChar", colors.yellow) -- special character in a constant
    Group.new("Tag", colors.yellow) -- you can use CTRL-] on this
    Group.new("SpecialComment", colors.subtext4) -- special things inside a comment
    Group.new("Debug", colors.yellow) -- debugging statements
    Group.new("Error", colors.orange) -- any erroneous construct
    Group.new("Todo", colors.yellow) -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    Group.new("MatchParen", nil, colors.gray6)

    Group.new("@type.phpdoc", colors.yellow_75)
    Group.new("@attribute.phpdoc", colors.red_75)
    Group.new("@keyword.phpdoc", colors.green_75)
    Group.new("@variable.phpdoc", groups.comment)
    Group.new("@variable.member.phpdoc", groups.comment)
    Group.new("@variable.parameter.phpdoc", groups.comment)
end

return M
