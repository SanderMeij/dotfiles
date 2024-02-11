local M = {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    keys = {
        {'<leader>Gs', '<cmd>vertical G<cr><cmd>vertical resize 40<cr>', { desc = '[G]it [S]tatus' }}
    },
}

return M


