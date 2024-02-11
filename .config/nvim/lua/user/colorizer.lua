return {
    'norcalli/nvim-colorizer.lua',
    event = "VeryLazy",
    config = function()
        require('colorizer').setup ({
            '*';
        },
        {
            RRGGBBAA = true,
            css = true,
        })
    end,
}
