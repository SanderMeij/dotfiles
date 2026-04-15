vim.api.nvim_create_autocmd("FileType", {
	pattern = { "php" },
	callback = function()
		vim.treesitter.start()
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 40 })
	end,
})

local timer = vim.uv.new_timer()

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	group = vim.api.nvim_create_augroup("ufo_auto_open", { clear = true }),
	callback = function()
		if vim.bo.buftype ~= "" then
			return
		end
		timer:stop()
		timer:start(
			300,
			0,
			vim.schedule_wrap(function()
				local lnum = vim.api.nvim_win_get_cursor(0)[1]
				if vim.fn.foldclosed(lnum) ~= -1 then
					vim.cmd("normal! zO")
				end
			end)
		)
	end,
})

local fold_close_keys = { "zc", "zC", "zm", "zM", "za", "zA" }
for _, key in ipairs(fold_close_keys) do
	vim.keymap.set("n", key, function()
		timer:stop()
		return key
	end, { expr = true })
end

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
