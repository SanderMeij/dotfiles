local M = {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "folke/neodev.nvim",
        "ray-x/lsp_signature.nvim",
    },
}

function M.config()
    local lspconfig = require("lspconfig")
    local icons = require("user.icons")

    local servers = {
        "bashls",
        "cssls",
        "eslint",
        "gopls",
        "html",
        "intelephense",
        "jsonls",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "tailwindcss",
        "ts_ls",
        "volar",
        "yamlls",
    }

    local default_diagnostic_config = {
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
                [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
                [vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
                [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
            },
        },
        virtual_text = {
            current_line = true,
            -- severity = {
            --     max = vim.diagnostic.severity.WARN,
            -- },
        },
        -- virtual_lines = {
        --     current_line = true,
        --     severity = {
        --         min = vim.diagnostic.severity.ERROR,
        --     },
        -- },
        update_in_insert = false,
        severity_sort = true,
        underline = false,
    }

    vim.diagnostic.config(default_diagnostic_config)

    for _, server in pairs(servers) do
        local opts = {
            on_attach = M.on_attach,
        }

        local require_ok, settings = pcall(require, "user.lspsettings." .. server)
        if require_ok then
            opts = vim.tbl_deep_extend("force", settings, opts)
        end

        lspconfig[server].setup(opts)
    end
end

return M
