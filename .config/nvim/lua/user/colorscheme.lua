local M = { "catppuccin/nvim", name = "catppuccin", priority = 1000 }

function M.config()
    require("catppuccin").setup({
        flavour = "mocha",
        -- transparent_background = true
    })
    vim.cmd.colorscheme("catppuccin")
end

return M
