vim.api.nvim_create_autocmd("FileType", {
	pattern = { "php", "go" },
	callback = function()
		vim.treesitter.start()
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 40 })
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(buffer)
		local cwd = vim.fn.getcwd()
		local file = vim.fn.fnamemodify(buffer.file, ":.")
		local stat = vim.uv.fs_stat(file)
		if stat and stat.type == "file" then
			vim.system({ "rander", cwd, "add", file }, {}, function(result)
				if result.code ~= 0 then
					print("Error:", result.stderr)
				end
			end)
		end
	end,
})
