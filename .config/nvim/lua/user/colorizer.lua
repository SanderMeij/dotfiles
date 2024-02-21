M = {
    "brenoprata10/nvim-highlight-colors"
}

local custom_colors = {}
for label, color in pairs(require('user.colors')) do
    table.insert(custom_colors, {
        label = "colors." .. label,
        color = color
    })
end

M.config = function()
    require('nvim-highlight-colors').setup {
        -- render = 'first_column',
        custom_colors = custom_colors 
    }
end

return M
