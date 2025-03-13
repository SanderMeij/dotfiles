local M = {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
}

function M.config()
    require("ibl").setup({
        scope = {
            enabled = false,
        },
        indent = {
            char = "┆",
            highlight = {
                "Invisble",
                "DimmedGreen",
                "DimmedCyan",
                "DimmedBlue",
                "DimmedViolet",
                "DimmedMagenta",
                "DimmedRed",
                "DimmedOrange",
                "DimmedYellow",
            },
        },
    })
end

return M
