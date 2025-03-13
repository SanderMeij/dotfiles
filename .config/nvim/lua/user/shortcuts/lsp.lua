return {
    {
        name = "GoToDefinition",
        keymap = "gd",
        command = function()
            vim.lsp.buf.definition()
        end,
    },
    {
        name = "GoToReferences",
        keymap = "gr",
        command = function()
            vim.lsp.buf.references()
        end,
    },
    {
        name = "DiagnosticFloat",
        keymap = "gl",
        command = function()
            vim.diagnostic.open_float()
        end,
    },
    {
        name = "LspHover",
        keymap = "gh",
        command = function()
            vim.lsp.buf.hover()
        end,
    },
    {
        name = "LspInfoShortcut",
        keymap = "<leader>li",
        command = "LspInfo",
    },
    {
        name = "LspRestartShortcut",
        keymap = "<leader>lR",
        command = "LspRestart",
    },
    {
        name = "LspRename",
        keymap = "<leader>lr",
        command = function()
            vim.lsp.buf.rename()
        end,
    },
    {
        name = "LspActions",
        keymap = "<leader>la",
        command = function()
            vim.lsp.buf.code_action()
        end,
    },
}
