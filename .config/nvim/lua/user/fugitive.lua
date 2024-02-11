local M = {
    "tpope/vim-fugitive",
    event = "VeryLazy",
}

function M.config()
    local wk = require "which-key"
    wk.register {
        ["<leader>GP"] = { "<cmd>G push<CR>", "[G]it [P]ush" },
        ["<leader>GS"] = { ":G switch ", "[G]it [S]witch" },
        ["<leader>Gc"] = { "<cmd>G commit<CR>", "[G]it [c]ommit" },
        ["<leader>Gp"] = { "<cmd>G pull<CR>", "[G]it [p]ull" },
        ["<leader>Gs"] = { "<cmd>tab G<CR>", "[G]it [s]tatus" },
        ["<leader>Ga"] = { "<cmd>G add .<CR>", "[G]it [a]dd all" },
    }
end

return M
