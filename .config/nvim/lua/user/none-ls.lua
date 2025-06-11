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
            diagnostics.phpstan,
            diagnostics.sqlfluff.with(dialect),
            formatting.black,
            formatting.prettier,
            formatting.sqlfluff.with(dialect),
            formatting.stylua,
            formatting.xmllint,
            null_ls.builtins.completion.spell,
        },
    })
end

return M
