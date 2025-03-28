local M = {
	"nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
}

local icons = require("user.icons")

M.opts = {
	override = {
		pkl = {
			icon = icons.misc.Cogs,
			color = '#C8D987',
			name = "Pkl",
		},
        example = {
            icon = icons.ui.Pencil,
            color = '#FAF743',
            name = "Example",
        },
        envrc = {
            icon = icons.ui.Settings,
            color = '#FAF743',
            name = "Envrc",
        }
	},
}

return M
