M = {
    "brenoprata10/nvim-highlight-colors"
}

M.config = function()
    require('nvim-highlight-colors').setup {
        -- render = 'first_column',
    }
end

return M
