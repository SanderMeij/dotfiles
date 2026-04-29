local snacks = require("snacks")

local function keymap(mode, lhs, rhs, opts)
	local default_opts = { noremap = true, silent = true }
	if opts then
		opts = vim.tbl_extend("force", default_opts, opts)
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

keymap("n", "<leader>aj", function()
    snacks.input({ prompt = "AI Write", history = "ai"}, function(input)
		if input and input ~= "" then
			require("snacks").terminal.open("ai prompt " .. vim.fn.shellescape(input))
		end
    end)
end)

keymap("v", "<leader>aj", function()
	local start_line = vim.fn.line("v")
	local end_line = vim.fn.line(".")
	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end
	local file_spec = vim.fn.fnamemodify(vim.fn.expand("%"), ":.") .. ":" .. start_line .. "-" .. end_line

    snacks.input({ prompt = "AI Write", history = "ai"}, function(input)
		if input and input ~= "" then
			require("snacks").terminal.open("ai prompt " .. vim.fn.shellescape(input) .. " " .. vim.fn.shellescape(file_spec))
		end
	end)
end)

keymap("n", "<leader>ak", function()
    snacks.input({ prompt = "AI Read", history = "ai"}, function(input)
		if input and input ~= "" then
			require("snacks").terminal.open("ai read " .. vim.fn.shellescape(input))
		end
    end)
end)

keymap("v", "<leader>ak", function()
	local start_line = vim.fn.line("v")
	local end_line = vim.fn.line(".")
	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end
	local file_spec = vim.fn.fnamemodify(vim.fn.expand("%"), ":.") .. ":" .. start_line .. "-" .. end_line

    snacks.input({ prompt = "AI Read", history = "ai"}, function(input)
		if input and input ~= "" then
			require("snacks").terminal.open("ai read " .. vim.fn.shellescape(input) .. " " .. vim.fn.shellescape(file_spec))
		end
	end)
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

keymap("n", "]a", function()
	add_jj_diff_to_quickfix()
end)
