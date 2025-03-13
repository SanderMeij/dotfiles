local M = {
    "LunarVim/breadcrumbs.nvim",
    dependencies = {
        { "SmiteshP/nvim-navic" },
    },
}

local icons = require("user.icons")

function M.config()
    require("breadcrumbs").setup()
    require("nvim-navic").setup({
        icons = icons.kind,
        highlight = true,
        lsp = {
            auto_attach = true,
            preference = { "intelephense" },
        },
        click = true,
        separator = " " .. icons.ui.TriangleShortArrowRight .. " ",
        depth_limit = 0,
        depth_limit_indicator = "..",
    })
end

return M
