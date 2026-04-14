M = {
    "SanderMeij/NeovimTmuxNavigator",
    opts = {
        bottom_reached = function()
            os.execute("tmux split-window -l 10")
        end,
        left_reached = function()
            vim.cmd("tmux previous-window")
        end,
        right_reached = function()
            vim.cmd("tmux next-window")
        end,
    },
    keys = {
        { "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
    },
}

return M
