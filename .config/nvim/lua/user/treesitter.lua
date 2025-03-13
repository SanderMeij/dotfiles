local M = {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        { "nushell/tree-sitter-nu" },
    },
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
}

function M.config()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "css",
            "go",
            "javascript",
            "lua",
            "nu",
            "php",
            "python",
            "rust",
            "tsx",
            "twig",
            "typescript",
            "vim",
            "vimdoc",
        },
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
        ignore_install = {},
        modules = {},
        sync_install = true,
    })

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.blade = {
        install_info = {
            url = "https://github.com/EmranMR/tree-sitter-blade",
            files = { "src/parser.c" },
            branch = "main",
        },
        filetype = "blade",
    }
end

return M
