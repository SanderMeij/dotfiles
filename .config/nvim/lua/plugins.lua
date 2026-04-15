vim.pack.add({
	{ src = "https://github.com/0xAdk/full_visual_line.nvim" },
	{ src = "https://github.com/NeogitOrg/neogit" },
	{ src = "https://github.com/RRethy/vim-illuminate" },
	{ src = "https://github.com/SanderMeij/neovim_tmux_navigator", version = "rewrite" },
	{ src = "https://github.com/bekaboo/dropbar.nvim" },
	{ src = "https://github.com/chrisgrieser/nvim-various-textobjs" },
	{ src = "https://github.com/folke/lazydev.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/ghostbuster91/nvim-next" },
	{ src = "https://github.com/kevinhwang91/nvim-ufo" },
	{ src = "https://github.com/kevinhwang91/promise-async" },
	{ src = "https://github.com/kylechui/nvim-surround" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-mini/mini.diff" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/okuuva/auto-save.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/stevearc/quicker.nvim" },
	{ src = "https://github.com/tjdevries/colorbuddy.nvim" },
})

local colors = require("colors")
local colorbuddy = require("colorbuddy")
colorbuddy.colorscheme("sander")

local Color = colorbuddy.Color
local Group = colorbuddy.Group

local Colors = colorbuddy.colors
local Groups = colorbuddy.groups

for label, color in pairs(require("colors")) do
	Color.new(label, color)
end

Group.new("@attribute.phpdoc", Colors.red_75)
Group.new("@keyword.phpdoc", Colors.green_75)
Group.new("@type.phpdoc", Colors.yellow_75)
Group.new("Added", Colors.green)
Group.new("Blue50", Colors.blue_50)
Group.new("Blue75", Colors.blue_75)
Group.new("Boolean", Colors.yellow)
Group.new("Changed", Colors.yellow)
Group.new("Character", Colors.green)
Group.new("Comment", Colors.gray8)
Group.new("Conditional", Colors.blue)
Group.new("Constant", Colors.red)
Group.new("CurSearch", Colors.gray1, Colors.primary)
Group.new("Cyan50", Colors.cyan_50)
Group.new("Cyan75", Colors.cyan_75)
Group.new("Debug", Colors.yellow)
Group.new("Define", Colors.red)
Group.new("DiagnosticError", Colors.red)
Group.new("DiagnosticHint", Colors.cyan)
Group.new("DiagnosticInfo", Colors.blue)
Group.new("DiagnosticOk", Colors.green)
Group.new("DiagnosticWarn", Colors.yellow)
Group.new("Error", Colors.orange)
Group.new("ErrorMsg", Colors.red)
Group.new("Exception", Colors.purple)
Group.new("Float", Colors.magenta)
Group.new("FloatBorder", Colors.gray6)
Group.new("Function", Colors.blue)
Group.new("Green50", Colors.green_50)
Group.new("Green75", Colors.green_75)
Group.new("Identifier", Colors.fg)
Group.new("IlluminatedWordRead", nil, Colors.gray4)
Group.new("IlluminatedWordText", nil, Colors.gray4)
Group.new("IlluminatedWordWrite", nil, Colors.gray4)
Group.new("Include", Colors.purple)
Group.new("Invisble", Colors.gray1)
Group.new("Keyword", Colors.purple)
Group.new("Label", Colors.purple)
Group.new("LineNr", Colors.gray3, Colors.gray0)
Group.new("Macro", Colors.red)
Group.new("Magenta50", Colors.magenta_50)
Group.new("Magenta75", Colors.magenta_75)
Group.new("MatchParen", nil, Colors.gray6)
Group.new("MiniDiffOverChange", nil, Colors.yellow_50)
Group.new("MiniDiffOverContext", Colors.red)
Group.new("MiniIconsAzure", Colors.magenta)
Group.new("MiniIconsBlue", Colors.blue)
Group.new("MiniIconsCyan", Colors.cyan)
Group.new("MiniIconsGreen", Colors.green)
Group.new("MiniIconsGrey", Colors.grey)
Group.new("MiniIconsOrange", Colors.orange)
Group.new("MiniIconsPurple", Colors.purple)
Group.new("MiniIconsRed", Colors.red)
Group.new("MiniIconsYellow", Colors.yellow)
Group.new("ModeMsg", Colors.green)
Group.new("MoreMsg", Colors.blue)
Group.new("MsgArea", Colors.foreground, Colors.black)
Group.new("Normal", Colors.foreground, Colors.gray1)
Group.new("Number", Colors.magenta)
Group.new("Operator", Colors.yellow)
Group.new("Orange50", Colors.orange_50)
Group.new("Orange75", Colors.orange_75)
Group.new("PMenuSel", Colors.gray1, Colors.primary)
Group.new("PreCondit", Colors.red)
Group.new("PreProc", Colors.red)
Group.new("Primary", Colors.primary)
Group.new("Red50", Colors.red_50)
Group.new("Red75", Colors.red_75)
Group.new("Removed", Colors.red)
Group.new("Repeat", Colors.purple)
Group.new("Search", nil, Colors.gray6)
Group.new("Secondary", Colors.secondary)
Group.new("Special", Colors.cyan)
Group.new("SpecialChar", Colors.yellow)
Group.new("SpecialComment", Colors.subtext4)
Group.new("Statement", Colors.fg)
Group.new("StatusLine", Colors.foreground, Colors.gray0)
Group.new("StorageClass", Colors.yellow)
Group.new("String", Colors.green)
Group.new("Structure", Colors.red)
Group.new("Tag", Colors.yellow)
Group.new("Todo", Colors.yellow)
Group.new("Type", Colors.yellow)
Group.new("Typedef", Colors.yellow)
Group.new("Violet50", Colors.violet_50)
Group.new("Violet75", Colors.violet_75)
Group.new("Visual", nil, Colors.gray3)
Group.new("WarningMsg", Colors.yellow)
Group.new("WinBar", Colors.foreground, Colors.gray0)
Group.new("WinBarNC", Colors.foreground, Colors.black)
Group.new("Yellow50", Colors.yellow_50)
Group.new("Yellow75", Colors.yellow_75)
Group.new("NeogitDiffDeleteInline", Colors.red, Colors.red_50)
Group.new("NeogitDiffAddInline", Colors.green, Colors.green_50)

Group.new("@variable.member.phpdoc", Groups.comment)
Group.new("@variable.parameter.phpdoc", Groups.comment)
Group.new("@variable.phpdoc", Groups.comment)
Group.new("Background", Groups.Normal)
Group.new("DiffAdded", Groups.Added)
Group.new("DiffAdd", Groups.Added)
Group.new("DiffChanged", Groups.changed)
Group.new("DiffText", Groups.changed)
Group.new("DiffRemoved", Groups.removed)
Group.new("DiffDelete", Groups.removed)
Group.new("NormalFloat", Groups.Normal)
Group.new("PMenu", Groups.NormalFloat)

require("auto-save").setup({})
require("full_visual_line").setup({})
require("gitsigns").setup({ signcolumn = true })
require("mason").setup({})
require("mini.icons").setup({})
require("quicker").setup({})
require("neogit").setup({
	auto_refresh = true,
	disable_builtin_notifications = false,
	use_magit_keybindings = false,
	kind = "floating",
	commit_popup = {
		kind = "floating",
	},
	popup = {
		kind = "floating",
	},
	signs = {
		section = { "", "" },
		item = { "", "" },
		hunk = { "", "" },
	},
	highlight = vim.tbl_extend("force", colors, {
		md_purple = require("colors").primary,
	}),
})

require("nvim-next").setup({
	default_mappings = {
		repeat_style = "original",
	},
})

local motions = require("nvim-surround.motions")
require("nvim-surround").setup({
	surrounds = {
		[")"] = {
			add = { "( ", " )" },
			find = function()
				return motions.get_selection("a)")
			end,
			delete = "^(. ?)().-( ?.)()$",
		},
		["("] = {
			add = { "(", ")" },
			find = function()
				return motions.get_selection("a(")
			end,
			delete = "^(.)().-(.)()$",
		},
		["}"] = {
			add = { "{ ", " }" },
			find = function()
				return motions.get_selection("a}")
			end,
			delete = "^(. ?)().-( ?.)()$",
		},
		["{"] = {
			add = { "{", "}" },
			find = function()
				return motions.get_selection("a{")
			end,
			delete = "^(.)().-(.)()$",
		},
		[">"] = {
			add = { "< ", " >" },
			find = function()
				return motions.get_selection("a>")
			end,
			delete = "^(. ?)().-( ?.)()$",
		},
		["<"] = {
			add = { "<", ">" },
			find = function()
				return motions.get_selection("a<")
			end,
			delete = "^(.)().-(.)()$",
		},
		["]"] = {
			add = { "[ ", " ]" },
			find = function()
				return motions.get_selection("a]")
			end,
			delete = "^(. ?)().-( ?.)()$",
		},
		["["] = {
			add = { "[", "]" },
			find = function()
				return motions.get_selection("a[")
			end,
			delete = "^(.)().-(.)()$",
		},
	},
})

require("various-textobjs").setup({
	keymaps = {
		useDefaults = true,
		disabledDefaults = { "r" },
	},
})

require("dropbar").setup({
	bar = {
		sources = function()
			local sources = require("dropbar.sources")
			local utils = require("dropbar.utils")
			return {
				utils.source.fallback({
					sources.lsp,
					sources.treesitter,
				}),
			}
		end,
	},
})

require("neovim_tmux_navigator").setup({
	bottom_reached = function()
		os.execute("tmux split-window -l 10")
	end,
	left_reached = function()
		os.execute("tmux previous-window")
	end,
	right_reached = function()
		os.execute("tmux next-window")
	end,
})

require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<C-l>"] = { "select_and_accept" },
		["<C-f>"] = { "fallback" },
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		list = { selection = { preselect = true, auto_insert = false } },

		documentation = {
			auto_show = true,
			auto_show_delay_ms = 1000,
			window = {
				border = "rounded",
				scrollbar = false,
			},
		},
		menu = {
			border = "rounded",
			scrollbar = false,
			draw = {
				gap = 2,
				padding = 2,
			},
			direction_priority = { "n", "s" },
		},
		ghost_text = { enabled = true, show_with_menu = true },
	},

	sources = {
		default = { "lsp", "lazydev", "path", "snippets", "buffer" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},

	fuzzy = {
		sorts = {
			-- function(a, b)
			-- 	if a.source_name ~= "LSP" or b.source_name ~= "LSP" then
			-- 		return
			-- 	end
			-- 	local name = vim.lsp.get_client_by_id(b.client_id).name
			-- 	return name ~= "ai_lsp"
			-- end,
			-- "score",
			-- "sort_text",
		},
		implementation = "prefer_rust_with_warning",
	},

	signature = { enabled = true },

	cmdline = {
		enabled = true,
		keymap = {
			["<C-l>"] = { "select_and_accept" },
		},
		completion = { menu = { auto_show = true } },
	},
})

local hl = {
	"Invisble",
	"Green50",
	"Cyan50",
	"Blue50",
	"Violet50",
	"Magenta50",
	"Red50",
	"Orange50",
	"Yellow50",
	"Orange50",
	"Red50",
	"Magenta50",
	"Violet50",
	"Blue50",
	"Cyan50",
	"Green50",
}

local function relative_buffer_file(buf)
	return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":.")
end

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

local function start_watching(buf_id, path)
	local repo = repo_dir(path)
	if repo == nil then
		return false
	end
	local watchfile = vim.fs.joinpath(repo, ".jj/working_copy")

	local buf_fs_event, timer = vim.loop.new_fs_event(), vim.loop.new_timer()
	local set_ref_text = function()
		vim.system(
			{ "jj", "--ignore-working-copy", "file", "show", "-r", "@-", '"' .. path .. '"' },
			{ cwd = vim.fs.dirname(path), text = true },
			vim.schedule_wrap(function(res)
				local MiniDiff = require("mini.diff")
				MiniDiff.set_ref_text(buf_id, res.stdout)
			end)
		)
	end

	local watch_index = function(_, filename, _)
		if filename ~= "checkout" then
			return
		end
		timer:stop()
		timer:start(50, 0, set_ref_text)
	end
	buf_fs_event:start(watchfile, { recursive = true }, watch_index)

	invalidate_cache(buf_id)
	cache[buf_id] = { fs_event = buf_fs_event, timer = timer }

	set_ref_text()
end

local diff = require("mini.diff")
diff.setup({
	-- view = {
	-- 	style = "number",
	-- },
	-- source = {
	-- 	name = "jj",
	-- 	attach = function(buf_id)
	-- 		if cache[buf_id] ~= nil then
	-- 			return false
	-- 		end
	--
	-- 		local path = get_buf_realpath(buf_id)
	-- 		if path == "" then
	-- 			return false
	-- 		end
	--
	-- 		return start_watching(buf_id, path)
	-- 	end,
	-- 	detach = function(buf_id)
	-- 		invalidate_cache(buf_id)
	-- 	end,
	-- },
})

require("snacks").setup({
	bigfile = { enabled = true },
	explorer = { enabled = false },
	indent = {
		indent = {
			char = "┆",
			hl = hl,
		},
		scope = {
			hl = hl,
		},
	},
	input = { enabled = true },
	picker = {
		enabled = true,
		matcher = {
			filename_bonus = false,
		},
		sort = {
			fields = { "idx" },
		},
		sources = {
			rander = {
				finder = function(opts, ctx)
					local fd_args = ""
					if opts.hidden then
						fd_args = fd_args .. " --hidden"
					end
					if opts.ignored then
						fd_args = fd_args .. " --no-ignore"
					end
					local cwd = vim.fn.getcwd()
					local current_buf = relative_buffer_file(vim.api.nvim_get_current_buf())
					local buffer_files = {}
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						if vim.api.nvim_buf_is_loaded(buf) then
							local name = relative_buffer_file(buf)
							table.insert(buffer_files, name)
						end
					end
					local file_list = table.concat(buffer_files, " ")

					return require("snacks.picker.source.proc").proc({
						notify = true,
						cmd = "sh",
						args = {
							"-c",
							"fdfind --type file --exclude .jj"
								.. fd_args
								.. " | rander "
								.. cwd
								.. " get --active "
								.. file_list
								.. " --exclude "
								.. current_buf,
						},
						transform = function(item)
							item.file = item.text
							item.icon = "󰒓"
						end,
					}, ctx)
				end,
				title = "Files",
				layout = {
					preset = "dropdown",
					preview = false,
				},
				format = function(item, _)
					local icons = require("mini.icons")
					local icon, highlight = icons.get("extension", item.text)
					return {
						{ icon .. " ", highlight },
						{ item.text, item.text_hl },
					}
				end,
			},
		},
		win = {
			input = {
				keys = {
					["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
					["<tab>"] = { "toggle_ignored", mode = { "i", "n" } },
					["<c-j>"] = { { "list_top", "confirm" }, mode = { "i", "n" } },
					["<c-k>"] = { { "list_top", "list_down", "confirm" }, mode = { "i", "n" } },
					["<c-l>"] = { { "list_top", "list_down", "list_down", "confirm" }, mode = { "i", "n" } },
				},
			},
		},
	},
	notifier = { enabled = true },
	quickfile = { enabled = false },
	scope = { enabled = false },
	scroll = {
		enabled = false,
		animate = {
			duration = { step = 5, total = 50 },
			easing = "linear",
		},
	},
	statuscolumn = { enabled = false },
	words = { enabled = false },
})

local group = vim.api.nvim_create_augroup("autosave", {})

vim.api.nvim_create_autocmd("User", {
	pattern = "AutoSaveWritePre",
	group = group,
	callback = function(opts)
		if opts.data.saved_buffer ~= nil then
			local buf = opts.data.saved_buffer
			if vim.bo[buf].buftype ~= "" then
				return
			end

			local filename = vim.api.nvim_buf_get_name(buf)
			if filename == "" then
				filename = vim.fn.stdpath("data") .. "/auto-save/" .. tostring(os.time())
				vim.notify(filename)
				vim.api.nvim_buf_set_name(0, filename)
			end

			local dir = vim.fn.fnamemodify(filename, ":h")
			if vim.fn.isdirectory(dir) == 0 then
				vim.notify("AutoSave: creating directory " .. dir, vim.log.levels.INFO)
				vim.fn.mkdir(dir, "p")
			end
		end
	end,
})

require("conform").setup({
	formatters_by_ft = {
		css = { "prettier" },
		go = { "gofumpt" },
		html = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		json = { "prettier" },
		lua = { "stylua", lsp_format = "fallback" },
		php = { "mago_format" },
		sql = { "prettier" },
		svg = { "prettier" },
		typescriptreact = { "prettier" },
	},
})

require("oil").setup({
	skip_confirm_for_simple_edits = true,
	prompt_save_on_select_new_entry = false,
	watch_for_changes = true,
	keymaps = {
		["<Esc>"] = { "actions.close", mode = "n" },
	},
	view_options = {
		show_hidden = true,
		is_hidden_file = function(name)
			local m = name:match("^%.")
			return m ~= nil
		end,
		is_always_hidden = function(name)
			return name == ".git" or name == ".jj"
		end,
	},
	float = {
		max_height = 20,
		max_width = 60,
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
local language_servers = vim.lsp.get_clients()
for _, ls in ipairs(language_servers) do
	require("lspconfig")[ls].setup({
		capabilities = capabilities,
	})
end

require("ufo").setup({
	close_fold_kinds_for_ft = {
		default = {
			"imports",
			"region",
		},
	},
})
