M = {
    "brenoprata10/nvim-highlight-colors",
}

M.config = function()
    local icons = require("user.icons")

    local custom_colors = {}
    for label, color in pairs(require("user.colors")) do
        table.insert(custom_colors, {
            label = "colors." .. label,
            color = color,
        })
    end

    require("nvim-highlight-colors").setup({
        custom_colors = custom_colors,
        enable_named_colors = false,
        render = "virtual",
        virtual_symbol = icons.apps.Neovim,
        virtual_symbol_position = "eow",
        virtual_symbol_prefix = " ",
        virtual_symbol_suffix = "",
    })
end

return M
