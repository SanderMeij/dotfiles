local colors = require("colors")
local colorbuddy = require("colorbuddy")
colorbuddy.colorscheme("sander")

local Group = colorbuddy.Group
local Colors = colorbuddy.colors

Group.new("MiniDiffOverChange", nil, Colors.red_50)
Group.new("MiniDiffOverContextBuf", nil, Colors.green_25)
Group.new("MiniDiffOverAdd", nil, Colors.green_25)
Group.new("MiniDiffSignAdd", Colors.green)
Group.new("MiniDiffSignDelete", Colors.red)
Group.new("MiniDiffOverContext", nil, Colors.red_25)
Group.new("MiniDiffOverChangeBuf", nil, Colors.green_50)
Group.new("MiniDiffOverDelete", nil, Colors.red_25)

local diff = require("mini.diff")
local cache = {}

local function get_buf_realpath(buf_id)
	return vim.loop.fs_realpath(vim.api.nvim_buf_get_name(buf_id)) or ""
end

local function repo_dir(path)
	local result = vim.system({ "jj", "--ignore-working-copy", "root" }, { cwd = vim.fs.dirname(path) }):wait()
	if result.code == 0 then
		return vim.trim(result.stdout)
	else
		return nil
	end
end

local function invalidate_cache(buf_id)
	local cache = cache[buf_id]
	if cache == nil then
		return false
	end
	pcall(function()
		cache.fs_event:stop()
		cache.timer:stop()
	end)
	cache[buf_id] = nil
end

local function start_watching(buf_id, path, cmd)
	local repo = repo_dir(path)
	if repo == nil then
		return false
	end
	local watchfile = vim.fs.joinpath(repo, ".agents/current")

	local buf_fs_event, timer = vim.loop.new_fs_event(), vim.loop.new_timer()
	local set_ref_text = function()
		vim.system(
			cmd,
			{ cwd = repo, text = true },
			vim.schedule_wrap(function(res)
				if res.code ~= 0 then
					vim.api.nvim_set_hl(0, "MiniDiffOverChange", { fg = nil, bg = colors.red_50 })
					vim.api.nvim_set_hl(0, "MiniDiffOverContextBuf", { fg = nil, bg = colors.green_25 })
					vim.api.nvim_set_hl(0, "MiniDiffOverAdd", { fg = nil, bg = colors.green_25 })
					vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { fg = colors.green })
					vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { fg = colors.red })
					vim.api.nvim_set_hl(0, "MiniDiffOverContext", { fg = nil, bg = colors.red_25 })
					vim.api.nvim_set_hl(0, "MiniDiffOverChangeBuf", { fg = nil, bg = colors.green_50 })
					vim.api.nvim_set_hl(0, "MiniDiffOverDelete", { fg = nil, bg = colors.red_25 })
					vim.system(
						{ "jj", "--ignore-working-copy", "file", "show", "-r", "@-", path },
						{ cwd = repo, text = true },
						vim.schedule_wrap(function(res)
							if res.code ~= 0 then
								return
							end
							diff.set_ref_text(buf_id, res.stdout)
						end)
					)
				else
					vim.api.nvim_set_hl(0, "MiniDiffOverChange", { fg = nil, bg = colors.green_50 })
					vim.api.nvim_set_hl(0, "MiniDiffOverContextBuf", { fg = nil, bg = colors.red_25 })
					vim.api.nvim_set_hl(0, "MiniDiffOverAdd", { fg = nil, bg = colors.red_25 })
					vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { fg = colors.red })
					vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { fg = colors.green })
					vim.api.nvim_set_hl(0, "MiniDiffOverContext", { fg = nil, bg = colors.green_25 })
					vim.api.nvim_set_hl(0, "MiniDiffOverChangeBuf", { fg = nil, bg = colors.red_50 })
					vim.api.nvim_set_hl(0, "MiniDiffOverDelete", { fg = nil, bg = colors.green_25 })
					diff.set_ref_text(buf_id, res.stdout)
				end
			end)
		)
	end

	local watch_index = function(_, _, _)
		timer:stop()
		timer:start(50, 0, set_ref)
	end
	buf_fs_event:start(watchfile, { recursive = true }, function(_, _, _)
		timer:stop()
		timer:start(50, 0, function() end)
	end)

	invalidate_cache(buf_id)
	cache[buf_id] = { fs_event = buf_fs_event, timer = timer }

	set_ref_text()
end

local function attach(cmd, highlights)
	return function(buf_id)
		local path = get_buf_realpath(buf_id)
		if path == "" then
			return false
		end

		if cache[buf_id] ~= nil then
			return false
		end

		table.insert(cmd, path)

		local result = vim.system({ "jj" }, { text = true }):wait()
		if result.code ~= 0 then
			return false
		end

		if highlights ~= nil then
			highlights()
		end

		return start_watching(buf_id, path, cmd)
	end
end

diff.setup({
	options = {
		algorithm = "histogram",
	},
	source = {
		{
			name = "ai",
			attach = attach({ "ai", "show" }),
			detach = invalidate_cache,
			apply_hunks = function(buf_id, hunks)
				vim.notify(vim.inspect(hunks))
				vim.notify(vim.inspect(require("mini.diff").get_buf_data()))
			end,
		},
		{
			name = "jj",
			attach = attach({ "jj", "--ignore-working-copy", "file", "show", "-r", "@-" }),
			detach = invalidate_cache,
		},
		diff.gen_source.git(),
	},
})
