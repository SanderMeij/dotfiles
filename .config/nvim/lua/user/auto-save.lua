local M = {
    'pocco81/auto-save.nvim',
    event = "VeryLazy",
}
function M.config()
    require("auto-save").setup {
        execution_message = {
            message = function ()
                return ''
            end,
        },
    }
end

return M
