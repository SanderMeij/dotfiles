require("user.launch")
require("user.options")
require("user.keymaps")
require("user.shortcuts.init")
require("user.autocmds")

spec("user.colorbuddy")

spec("user.tiny-code-action")
-- spec("user.99") 
spec("user.auto-save") -- Auto save files
-- spec("user.stride") 
-- spec("user.snek") 
spec("user.cmp") -- Completion
spec("user.colorizer") -- Show color of color codes
spec("user.dropbar") -- Show context on top of buffer
spec("user.fidget") -- Spinner and progress notifications
spec("user.full-visual-line") -- Highlight full line in visual line mode
spec("user.gitsigns") -- Git functionality for current buffer
spec("user.illuminate") -- Highlight matching words
spec("user.lspconfig") -- Lsp config
spec("user.lualine") -- Better statusline
spec("user.mason") -- Install tools
spec("user.mini-icons") -- Icons for filetypes
spec("user.neogit") -- Git plugin
spec("user.neovim-tmux-navigator") -- Smooth vim and tmux navigation
spec("user.none-ls") -- Make command tools behave like a language server
spec("user.oil") -- Editable file explorer
spec("user.quicker") -- Improve quickfix
spec("user.schemastore") -- Json and yaml schemas
spec("user.snacks")
spec("user.surround") -- Motions for surrounding
spec("user.textobjs") -- Additional text objects, I only really use gG at the moment. TODO look into these more
spec("user.treesitter") -- Syntax highlighting and more
spec("user.ufo") -- Better folding
spec("user.inlinediff")
spec("user.conform")
--
spec("user.blade") -- Blade php file support
-- spec("user.gitlab") -- Gitlab Duo Integration
spec("user.nette") -- Nette support, only used for neon files
spec("user.tailwind-tools") -- Tailwind tools
--
spec("user.extras.cellular-automaton")
--
require("user.lazy")
--
 require("user.filetype.composer")
 require("user.filetype.env")
 require("user.filetype.json")
 require("user.filetype.php")
