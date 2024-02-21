local M = {
	"nvim-lualine/lualine.nvim",
}

local colors = require('user.colors')
local bubbles_theme = {
  normal = {
    a = { fg = colors.base, bg = colors.blue },
    b = { fg = colors.text, bg = colors.surface0 },
    c = { fg = colors.base, bg = colors.background },
  },

  insert = { a = { fg = colors.base, bg = colors.green } },
  visual = { a = { fg = colors.base, bg = colors.peach} },
  replace = { a = { fg = colors.base, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.blue },
    b = { fg = colors.white, bg = colors.green },
    c = { fg = colors.black, bg = colors.red },
  },
}

function M.config()
	require("lualine").setup({
		options = {
			icons_enabled = true,
            theme = bubbles_theme,
			component_separators = "|",
			section_separators = { left = "", right = "" },
			show_filename_only = false,
			ignore_focus = { "NvimTree" },
		},
		sections = {
			lualine_a = {
				{ "mode", separator = { left = "" }, right_padding = 2 },
			},
			lualine_b = { { "filename", path = 1, "branch" } },
			lualine_c = { "fileformat" },
			lualine_x = {},
			lualine_y = { "filetype", "progress" },
			lualine_z = {
				{ "location", separator = { right = "" }, left_padding = 2 },
			},
		},
	})
end

return M
