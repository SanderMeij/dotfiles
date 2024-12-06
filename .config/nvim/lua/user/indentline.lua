local M = {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
}

function M.config()
    require("indent_blankline").setup {
        buftype_exclude = { "terminal", "nofile" },
        filetype_exclude = {
            "help",
            "startify",
            "dashboard",
            "lazy",
            "neogitstatus",
            "NvimTree",
            "Trouble",
            "text",
            "pkl",
        },
        show_first_indent_level = false,
        use_treesitter = true,
    }
end

return M
