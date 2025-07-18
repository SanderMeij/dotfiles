local M = {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },

    opts_extend = { "sources.default" },
}

M.config = function(_, opts)
    local colorbuddy = require("colorbuddy")
    colorbuddy.Group.new("BlinkCmpMenuBorder", colorbuddy.groups.FloatBorder)
    colorbuddy.Group.new("BlinkCmpDocBorder", colorbuddy.groups.FloatBorder)
    colorbuddy.Group.new("BlinkCmpSignatureHelpBorder", colorbuddy.groups.FloatBorder)

    require("blink-cmp").setup({
        keymap = {
            preset = "default",
            ["<C-l>"] = { "select_and_accept" },
            ["<C-f>"] = { "fallback" },
        },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 1000,
                window = {
                    border = "rounded",
                    scrollbar = false,
                },
            },
            menu = {
                border = "rounded",
                scrollbar = false,
            },
        },

        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },

        cmdline = {
            enabled = true,
            keymap = {
                ["<C-l>"] = { "select_and_accept" },
            },
            completion = { menu = { auto_show = true } },
        },
    })
end

return M
