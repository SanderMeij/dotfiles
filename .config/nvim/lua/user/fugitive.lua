local M = {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    keys = {
        {'<leader>Gs', '<cmd>vertical G<cr><cmd>vertical resize 40<cr>', { desc = '[G]it [S]tatus' }}
    },
}

function M.config()
    local wk = require "which-key"
    wk.register {
        ["<leader>GP"] = { "<cmd>G push<CR>", "[G]it [P]ush" },
        ["<leader>GS"] = { "<cmd>G switch<CR>", "[G]it [S]witch" },
        ["<leader>Gc"] = { "<cmd>G commit<CR>", "[G]it [c]ommit" },
        ["<leader>Gp"] = { "<cmd>G pull<CR>", "[G]it [p]ull" },
        ["<leader>Gs"] = { "<cmd>tab G<CR>", "[G]it [s]tatus" },
    }
end

return M
