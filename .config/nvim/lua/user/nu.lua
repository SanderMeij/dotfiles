return {
    'LhKipp/nvim-nu',
    event = "VeryLazy",
    opts = {},
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    build = function ()
        vim.cmd("TSInstall nu") 
    end
}
