local M = {
    'pocco81/auto-save.nvim',
    event = "VeryLazy",
}

function M.config()
    require("auto-save").setup {
        debounce_delay = 2500
    }
end

return M
