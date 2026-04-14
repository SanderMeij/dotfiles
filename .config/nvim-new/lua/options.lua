
-- =============================
-- General Settings
-- =============================
vim.opt.backup = false -- Disable backup files
vim.opt.shell = "bash" -- Use Bash as the default shell
vim.opt.swapfile = false -- Disable swap files
vim.opt.undofile = true -- Enable persistent undo
vim.opt.writebackup = false -- Disable write backups

-- =============================
-- UI & Appearance
-- =============================
vim.opt.cursorline = true -- Highlight the current line
vim.opt.fillchars = vim.opt.fillchars + "eob: ,fold: ,foldopen:,foldsep: ,foldclose:"
vim.opt.fillchars:append({ stl = " " }) -- Custom statusline separator
vim.opt.laststatus = 3 -- Use a single statusline for all splits
vim.opt.number = true -- Show line numbers
vim.opt.numberwidth = 4 -- Set number column width
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.scrolloff = 4 -- Keep 4 lines above/below the cursor
vim.opt.showcmd = true -- Show command being typed
vim.opt.showmode = false -- Hide mode display (use statusline instead)
vim.opt.showtabline = 0 -- Hide tabline unless multiple tabs exist
vim.opt.sidescrolloff = 8 -- Keep 8 columns of context when scrolling sideways
vim.opt.signcolumn = "yes" -- Always show the sign column
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.winborder = "rounded" -- Rounded window borders
vim.opt.wrap = false -- Disable line wrapping

-- =============================
-- Indentation & Formatting
-- =============================
vim.opt.breakindent = true -- Enable break indenting
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Indentation width of 4 spaces
vim.opt.smartindent = true -- Enable smart indentation
vim.opt.tabstop = 4 -- Tabs are displayed as 4 spaces

-- =============================
-- Searching & Navigation
-- =============================
vim.cmd("set whichwrap+=<,>,[,],h,l") -- Allow cursor movement across lines
vim.opt.gdefault = true -- Assume global flag in substitutions
vim.opt.hlsearch = true -- Highlight search results
vim.opt.ignorecase = true -- Case-insensitive searching
vim.opt.smartcase = true -- Case-sensitive if uppercase is used in search

-- =============================
-- Clipboard & Mouse
-- =============================
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.mouse = "a" -- Enable mouse support

-- =============================
-- Completion & Menus
-- =============================
vim.opt.completeopt = { "menuone", "noselect" } -- Completion menu settings
vim.opt.pumblend = 10 -- Enable transparency in popup menu
vim.opt.pumheight = 10 -- Limit popup menu height

-- =============================
-- Splitting Behavior
-- =============================
vim.opt.splitbelow = true -- Open horizontal splits below
vim.opt.splitright = true -- Open vertical splits to the right

-- =============================
-- Performance Tweaks
-- =============================
vim.opt.timeoutlen = 1000 -- Key sequence timeout
vim.opt.updatetime = 100 -- Faster update time for completion

-- =============================
-- Netrw (File Explorer)
-- =============================
vim.g.netrw_banner = 0 -- Disable Netrw banner
vim.g.netrw_mouse = 2 -- Enable mouse support in Netrw

-- =============================
-- Folding
-- =============================
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
