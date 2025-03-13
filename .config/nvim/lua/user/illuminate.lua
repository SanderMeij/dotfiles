local M = {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
}

function M.config()
    local colorbuddy = require("colorbuddy")
    colorbuddy.Group.new("IlluminatedWordText", nil, colorbuddy.colors.gray4)
    colorbuddy.Group.new("IlluminatedWordRead", nil, colorbuddy.colors.gray4)
    colorbuddy.Group.new("IlluminatedWordWrite", nil, colorbuddy.colors.gray4)

    require("illuminate").configure({
        filetypes_denylist = {
            "mason",
            "harpoon",
            "DressingInput",
            "NeogitCommitMessage",
            "qf",
            "dirvish",
            "oil",
            "minifiles",
            "fugitive",
            "alpha",
            "NvimTree",
            "lazy",
            "NeogitStatus",
            "Trouble",
            "netrw",
            "lir",
            "DiffviewFiles",
            "Outline",
            "Jaq",
            "spectre_panel",
            "toggleterm",
            "DressingSelect",
            "TelescopePrompt",
        },
    })
end

return M
