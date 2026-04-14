return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                css = { "prettier" },
                go = { "gofumpt" },
                html = { "prettier" },
                javascript = { "prettier" },
                sql = { "prettier" },
                svg = { "prettier" },
                typescriptreact = { "prettier" },
            },
        })
    end,
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format()
            end,
        },
    },
}
