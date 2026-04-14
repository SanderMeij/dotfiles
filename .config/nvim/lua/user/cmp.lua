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
            list = { selection = { preselect = true, auto_insert = false } },



            documentation = {
                auto_show = true,
                auto_show_delay_ms = 1000,
                window = {
                    border = "rounded",
                    scrollbar = false,
                },
            },
            menu = {
                -- auto_show = false,
                border = "rounded",
                scrollbar = false,
                draw = {
                    gap = 2,
                    padding = 2,
                    max_height = 50,
                },
                direction_priority = { "n", "s" },
                -- ghost_text = {
                --     enabled = vim.g.ai_cmp,
                -- },

            },
          ghost_text = { enabled = true, show_with_menu=true },

            
        },

        sources = {
            default = { "lsp", "lazydev", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },

        fuzzy = {
          sorts = {

            -- function(a, b)
            --   if a.source_name ~= 'LSP' or b.source_name ~= 'LSP' then
            --     return
            --   end
            --   local name = vim.lsp.get_client_by_id(b.client_id).name
            --   return name ~= 'ai_lsp'
            -- end,
            -- 'score',
            -- 'sort_text',
          },
         implementation = "prefer_rust_with_warning",
        },

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
