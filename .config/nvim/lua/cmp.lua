local icons = require("mini.icons")
icons.mock_nvim_web_devicons()

local function is_ai(item)
	return item["client_name"] == "ai-lsp"
end

local function get_kind_icon(ctx)
	if is_ai(ctx["item"]) then
		return icons.get("filetype", "robot")
	else
		return icons.get("lsp", ctx.kind)
	end
end

require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<C-f>"] = { "select_and_accept" },
		["<C-k>"] = {
			function(_)
				require("blink.cmp.completion.trigger").hide()
			end,
		},
		-- ["<C-f>"] = { "accept_line", },
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
			border = "rounded",
			scrollbar = false,
			draw = {
				gap = 1,
				components = {
					kind_icon = {
						ellipsis = false,
						text = function(ctx)
							local text, _, _ = get_kind_icon(ctx)
							return text
						end,
						highlight = function(ctx)
							local _, hl, _ = get_kind_icon(ctx)
							return hl
						end,
					},
				},
			},
			direction_priority = { "n", "s" },
			auto_show = false,
		},
		ghost_text = { enabled = true, show_with_menu = true },
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
		implementation = "prefer_rust_with_warning",
		sorts = {
			function(a, _)
				return a["client_name"] == "ai-lsp"
			end,
			"score",
			"sort_text",
		},
	},

	signature = { enabled = true },

	cmdline = {
		enabled = true,
		keymap = {
			["<C-l>"] = { "select_and_accept" },
		},
		completion = { menu = { auto_show = true } },
	},
})
