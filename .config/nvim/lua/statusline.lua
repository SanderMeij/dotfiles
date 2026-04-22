local colors = require("colors")

local bubbles_theme = {
	normal = {
		a = { fg = colors.background, bg = colors.blue },
		b = { fg = colors.foreground, bg = colors.gray2 },
		c = { fg = colors.foreground, bg = colors.gray1 },
	},

	insert = { a = { fg = colors.background, bg = colors.green } },
	visual = { a = { fg = colors.background, bg = colors.orange } },
	replace = { a = { fg = colors.background, bg = colors.red } },

	inactive = {
		a = { fg = colors.foreground, bg = colors.blue },
		b = { fg = colors.foreground, bg = colors.green },
		c = { fg = colors.background, bg = colors.red },
	},
}

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = bubbles_theme,
		component_separators = "|",
		section_separators = { left = "", right = "" },
		show_filename_only = false,
        globalstatus = true,
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "", right = "" }, right_padding = 2 },
		},
		lualine_b = { { "filename", path = 1 } },
		lualine_c = { "%s", "branch", "diff", "diagnostics" },
		lualine_x = {
			{
				function()
					local clients = vim.lsp.get_clients({ bufnr = 0 })
					if next(clients) == nil then
						return ""
					end

					local client_names = {}
					local mini_icons = require("mini.icons")
					for _, client in pairs(clients) do
						local icon_name = client.config and client.config.icon or "lsp"
						local icon, highlight = mini_icons.get("filetype", icon_name)
						table.insert(client_names, "%#" .. highlight .. "#" .. icon .. " %*" .. client.name)
					end
					return table.concat(client_names, " | ")
				end,
				icon = "",
			},
			{
				function()
					local formatters = require("conform").list_formatters_to_run()
					if next(formatters) == nil then
						return ""
					end

					local formatter_names = {}
					for _, formatter in pairs(formatters) do
						table.insert(formatter_names, "%#Primary#󰉼 %*" .. formatter.name)
					end
					return table.concat(formatter_names, " | ")
				end,
			},
		},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location", separator = { left = "", right = "" }, left_padding = 2 },
		},
	},
})
