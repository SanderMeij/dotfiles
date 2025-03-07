M = {
	"ibhagwan/fzf-lua",
	opts = {},
}

vim.api.nvim_create_user_command("SetFt", function(opts)
	require("fzf-lua").fzf_exec({
		"lua",
		"python",
		"javascript",
		"typescript",
		"html",
		"css",
		"markdown",
		"json",
		"yaml",
		"bash",
		"cpp",
		"go",
		"rust",
		"java",
		"php",
	}, {
		prompt = "Filetype ❯ ",
		actions = {
			["default"] = function(selected)
				vim.cmd("set ft=" .. selected[1])
			end,
		},
	})
end, {
	nargs = 0,
	force = true,
})

return M
