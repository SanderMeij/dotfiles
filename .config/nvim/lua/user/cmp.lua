local M = {
	"saghen/blink.cmp",
	version = "*",
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

M.opts = {
	keymap = {
		preset = "default",
		["<C-l>"] = { "select_and_accept" },
        ["<C-f>"] = { "fallback" }
	},

	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	-- (Default) Only show the documentation popup when manually triggered
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

	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
		},
	},

	-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
	-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
	-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
	--
	-- See the fuzzy documentation for more information
	fuzzy = { implementation = "prefer_rust_with_warning" },

	cmdline = {
		enabled = true,
		keymap = {
			["<C-l>"] = { "select_and_accept" },
		},
		completion = { menu = { auto_show = true } },
	},
}

-- function M.config()
-- local cmp = require("cmp")
-- local icons = require("user.icons")
--
-- vim.api.nvim_set_hl(0, "Codeium", { fg = "#1ae4c7" })
--
-- cmp.setup({
--     enabled = function()
--         return vim.bo.filetype ~= "oil"
--     end,
--     mapping = cmp.mapping.preset.insert({
--         ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
--         ["<C-e>"] = cmp.mapping({
--             i = cmp.mapping.abort(),
--             c = cmp.mapping.close(),
--         }),
--         ["<CR>"] = cmp.mapping.confirm({ select = true }),
--     }),
--     formatting = {
--         fields = { "kind", "abbr", "menu" },
--         expandable_indicator = true,
--         format = function(entry, vim_item)
--             vim_item.kind = icons.kind[vim_item.kind]
--             if entry.source.name == "codeium" then
--                 vim_item.kind = icons.misc.Robot
--                 vim_item.kind_hl_group = "Codeium"
--             end
--             if entry.source.name == "buffer" then
--                 vim_item.kind = icons.apps.Vim
--             end
--             if entry.source.name == "calc" then
--                 vim_item.kind = icons.misc.Calculator
--             end
--
--             return vim_item
--         end,
--     },
--     sources = {
--         {
--             name = "codeium",
--             max_item_count = 1,
--         },
--         { name = "nvim_lsp" },
--         { name = "nvim_lua" },
--         { name = "buffer" },
--         { name = "path" },
--         { name = "calc" },
--     },
--     confirm_opts = {
--         behavior = cmp.ConfirmBehavior.Replace,
--         select = false,
--     },
--     window = {
--         completion = {
--             border = "rounded",
--             col_offset = -4,
--             scrollbar = false,
--         },
--         documentation = {
--             border = "rounded",
--         },
--     },
--     experimental = {
--         ghost_text = false,
--     },
-- })
--
-- -- Disable to keep default vim of cycling history
-- local cmdLineMapping = cmp.mapping.preset.cmdline()
-- cmdLineMapping["<C-N>"] = nil
-- cmdLineMapping["<C-P>"] = nil
--
-- cmp.setup.cmdline("/", {
--     mapping = cmdLineMapping,
--     sources = {
--         { name = "buffer" },
--     },
-- })
--
-- cmp.setup.cmdline(":", {
--     mapping = cmdLineMapping,
--     sources = cmp.config.sources({
--         { name = "path" },
--     }, {
--         {
--             name = "cmdline",
--         },
--     }),
-- })
-- end

return M
