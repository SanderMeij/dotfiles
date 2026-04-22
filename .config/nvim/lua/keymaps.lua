local function keymap(mode, lhs, rhs, opts)
	local default_opts = { noremap = true, silent = true }
	if opts then
		opts = vim.tbl_extend("force", default_opts, opts)
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

keymap("n", "<Space>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")
keymap("n", "*", "*zz")
keymap("n", "#", "#zz")
keymap("n", "g*", "g*zz")
keymap("n", "g#", "g#zz")

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Paste without overwriting the default register
keymap("x", "p", [["_dP]])

keymap({ "n", "x" }, "j", "gj")
keymap({ "n", "x" }, "k", "gk")

keymap("n", "<leader>/", "gcc", { remap = true })
keymap("v", "<leader>/", "gc", { remap = true })

vim.keymap.set("n", "<leader>r", function()
	local session = vim.fn.stdpath("state") .. "/restart_session.vim"
	vim.cmd("mksession! " .. vim.fn.fnameescape(session))
	vim.cmd("restart source " .. vim.fn.fnameescape(session))
end)

keymap("n", "<leader>i", "<cmd>Inspect<cr>")
keymap("i", "<C-h>", function()
	require("lsp_signature").toggle_float_win()
end)
keymap("n", "<leader>f", function()
	require("conform").format()
end)
keymap("n", "<leader>q", "<cmd>confirm qa<cr>")

local find, grep

find = function(pattern)
	local snacks = require("snacks")
	snacks.picker("rander", {
		pattern = pattern,
		prompt = " 󰈞 ",
		hidden = true,
		win = {
			input = {
				keys = {
					["<c-space>"] = {
						function(picker)
							local search = vim.api.nvim_buf_get_lines(picker.buf, 0, -1, false)[1]
							picker:close()
							grep(search)
						end,
						mode = { "n", "i" },
					},
				},
			},
		},
	})
end

grep = function(pattern)
	local snacks = require("snacks")
	snacks.picker("grep", {
		search = pattern,
		prompt = " 󰊄 ",
		hidden = true,
		win = {
			input = {
				keys = {
					["<c-space>"] = {
						function(picker)
							local search = vim.api.nvim_buf_get_lines(picker.buf, 0, -1, false)[1]
							picker:close()
							find(search)
						end,
						mode = { "n", "i" },
					},
				},
			},
		},
	})
end

keymap("n", "<c-space>", find)
keymap("n", "<leader><space>", grep)
keymap("n", "<leader>e", function()
	require("oil").open_float()
end)
keymap("n", "<leader>d", function()
	require("mini.diff").toggle_overlay()
end)
keymap("n", "<c-h>", function()
	require("neovim_tmux_navigator").switch_pane("left")
end, {})
keymap("n", "<c-j>", function()
	require("neovim_tmux_navigator").switch_pane("down")
end, {})
keymap("n", "<c-k>", function()
	require("neovim_tmux_navigator").switch_pane("up")
end, {})
keymap("n", "<c-l>", function()
	require("neovim_tmux_navigator").switch_pane("right")
end, {})
keymap("n", "?", "<cmd>set hlsearch!<cr>")

local next_integrations = require("nvim-next.integrations")
local nqf = next_integrations.quickfix()
keymap("n", "[q", nqf.cprevious)
keymap("n", "]q", nqf.cnext)

keymap("n", "<leader>yp", function()
	local rel = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
	vim.fn.setreg("+", rel)
	print("Yanked path: " .. rel)
end)

keymap("n", "s", "<Plug>(nvim-surround-normal)")
keymap("n", "gd", vim.lsp.buf.definition)
keymap("n", "gD", vim.lsp.buf.declaration)
keymap("n", "gl", vim.diagnostic.open_float)
keymap("n", "<leader>g", "<cmd>Neogit<cr>")
keymap("n", "U", "gHgh", { remap = true })
keymap({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action)
keymap("n", "<leader>s", function()
	require("snacks").picker()
end)

local function add_jj_diff_to_quickfix()
	local files = vim.fn.systemlist("ai diff --name-only")
	local qf_list = {}

	for _, filename in ipairs(files) do
		-- Get old version (before changes)
		local old_content = vim.fn.system("ai show " .. vim.fn.shellescape(filename))
		-- Get new version (current working copy)

		local file = io.open(filename, "r")
		local new_content = ""
		if file then
			new_content = file:read("*a")
		else
			file = io.open(filename, "w")
			file:close()
			new_content = ""
		end
		-- Get diff indices
		local diff_result = vim.text.diff(old_content, new_content, {
			result_type = "indices",
            algorithm = "histogram",
		})

		-- Add each hunk to quickfix
		for _, hunk in ipairs(diff_result) do
			vim.print(vim.inspect(hunk))
			local old_start, old_count = hunk[1], hunk[2]
			local new_start, new_count = hunk[3], hunk[4]

			local text = string.format("-%d,%d +%d,%d", old_start, old_count, new_start, new_count)
			vim.print(text)

			table.insert(qf_list, {
				filename = filename,
				lnum = new_start > 0 and new_start or 1,
				col = 1,
				text = text,
				type = "I",
			})
		end
	end

	vim.fn.setqflist(qf_list, "r")
	vim.cmd("copen")
	vim.notify(string.format("Added %d hunks to quickfix", #qf_list), vim.log.levels.INFO)
end

keymap("n", "]f", function()
	add_jj_diff_to_quickfix()
end)
