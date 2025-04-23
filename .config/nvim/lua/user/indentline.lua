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
                "Green50",
                "Cyan50",
                "Blue50",
                "Violet50",
                "Magenta50",
                "Red50",
                "Orange50",
                "Yellow50",
                "Orange50",
                "Red50",
                "Magenta50",
                "Violet50",
                "Blue50",
                "Cyan50",
                "Green50",
            },
        },
    })
end

return M
