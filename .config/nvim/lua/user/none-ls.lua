local M = {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}

function M.config()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    local dialect = {
        extra_args = { "--dialect", "mysql" },
    }

    null_ls.setup({
        debug = true,
        sources = {
            formatting.stylua,
            formatting.prettier,
            formatting.black,
            formatting.sqlfluff.with(dialect),
            diagnostics.phpstan,
            diagnostics.sqlfluff.with(dialect),
            null_ls.builtins.completion.spell,
        },
    })
end

return M
