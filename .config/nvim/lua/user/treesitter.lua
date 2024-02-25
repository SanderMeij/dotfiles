local M = {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
}

function M.config()
    require("nvim-treesitter.configs").setup {
        ensure_installed = {
            'bash',
            'c',
            'cpp',
            'css',
            'go',
            'javascript',
            'lua',
            'php',
            'python',
            'rust',
            'tsx',
            'twig',
            'typescript',
            'vim',
            'vimdoc',
        },
        highlight = { enable = true },
        indent = { enable = true },
    }
end

return M
