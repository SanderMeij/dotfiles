local M = {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = "markdown",
}

M.config = function()
    local colorbuddy = require("colorbuddy")
    colorbuddy.Group.new("@markup.heading.1.markdown", colorbuddy.colors.green)
    colorbuddy.Group.new("@markup.heading.2.markdown", colorbuddy.colors.cyan)
    colorbuddy.Group.new("@markup.heading.3.markdown", colorbuddy.colors.blue)
    colorbuddy.Group.new("@markup.heading.4.markdown", colorbuddy.colors.violet)
    colorbuddy.Group.new("@markup.heading.5.markdown", colorbuddy.colors.magenta)
    colorbuddy.Group.new("@markup.heading.6.markdown", colorbuddy.colors.red)
    colorbuddy.Group.new("RenderMarkdownH1Bg", nil)
    colorbuddy.Group.new("RenderMarkdownH2Bg", nil)
    colorbuddy.Group.new("RenderMarkdownH3Bg", nil)
    colorbuddy.Group.new("RenderMarkdownH4Bg", nil)
    colorbuddy.Group.new("RenderMarkdownH5Bg", nil)
    colorbuddy.Group.new("RenderMarkdownH6Bg", nil)
    colorbuddy.Group.new("RenderMarkdownBullet", colorbuddy.colors.yellow)

    require("render-markdown").setup()
end

return M
