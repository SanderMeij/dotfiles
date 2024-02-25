local M = {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
    local wk = require "which-key"
    wk.register {
        ["<leader>e"] = { "<cmd>Oil --float<cr>", "Explorer" },
    }
    require("oil").setup {
        skip_confirm_for_simple_edits = true,
        float = {
            max_height = 20,
            max_width = 60,
        },
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, bufnr)
                return name == '.git'
            end,
        },
        keymaps = {
            ["<esc>"] = { callback = "actions.close", mode = "n" },
        }
    }
end

return M
