local utils = require("user.utils")

SHORTCUTS = {}

local M = {}
M.shortcut = function(name, keymap, command, desc, opts)
	vim.api.nvim_create_user_command(name, command, {
		desc = desc,
        nargs = '*',
	})

	vim.keymap.set("n", keymap, function()
		vim.cmd(name)
	end, { noremap = true, silent = true, desc = desc })

	if opts then
		if opts.disabled then
			for _, disabled_command in ipairs(opts.disabled) do
				vim.keymap.set(
					"ca",
					disabled_command,
					"echo 'Use :" .. name .. " or " .. keymap .. " instead'",
					{ noremap = true, silent = true }
				)
			end
		end
	end

	SHORTCUTS[name] = { keymap = keymap, command = command, desc = desc }
end

M.spec = function(path)
	local spec = require(path)
    for _, shortcut in ipairs(spec) do
       M.shortcut(shortcut.name, shortcut.keymap, shortcut.command, shortcut.desc)
    end
end

M.init = function()
	M.shortcut("FindShortcut", "<leader>fs", function()
		require("fzf-lua").fzf_exec(utils.table_keys(SHORTCUTS), {
			prompt = "shortcut ❯ ",
			actions = {
				["default"] = function(selected)
					vim.cmd(selected[1])
				end,
			},
		})
	end, "Search shortcuts")
end

return M
