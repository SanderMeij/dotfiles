local M = {
    "cpea2506/one_monokai.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
    vim.cmd.colorscheme 'one_monokai'
    require("one_monokai").setup({
        themes = function(colors)
            return {
                Search = { bg = colors.dark_gray },
            }
        end,
    })
end

return M
