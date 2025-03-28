local M = {
    "neogitorg/neogit",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },
}

function M.config()
    local icons = require "user.icons"

    require("neogit").setup {
        auto_refresh = true,
        disable_builtin_notifications = false,
        use_magit_keybindings = false,
        kind = "floating",
        commit_popup = {
            kind = "floating",
        },
        popup = {
            kind = "floating",
        },
        signs = {
            section = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
            item = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
            hunk = { "", "" },
        },
    }
end

return M
