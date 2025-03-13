return {
    "https://github.com/apple/pkl-neovim",
    build = function()
        vim.cmd("TSInstall! pkl")
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "pkl",
}
