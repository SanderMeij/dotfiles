M = {
	"brenoprata10/nvim-highlight-colors",
}

local custom_colors = {}
for label, color in pairs(require("user.colors")) do
	table.insert(custom_colors, {
		label = "colors." .. label,
		color = color,
	})
end

M.opts = {
	custom_colors = custom_colors,
}

return M
