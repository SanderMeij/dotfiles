local M = {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    commit = "9637670896b68805430e2f72cf5d16be5b97a22a",
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
        },
        show_first_indent_level = false,
        use_treesitter = true,
    }
end

return M
