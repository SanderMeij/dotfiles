require("user.launch")
require("user.options")
require("user.keymaps")
require("user.shortcuts.init")
require("user.autocmds")

spec("user.colorscheme")

spec("user.auto-save") -- Auto save files
spec("user.autopairs") -- Add ) when typing (
spec("user.breadcrumbs") -- Show context on top of buffer
spec("user.cmp") -- Completion
spec("user.colorizer") -- Show color of color codes
spec("user.devicons") -- Icons for filetypes
spec("user.eyeliner") -- Highlight potential jumps for f
spec("user.fzf") -- Fuzzy finder
spec("user.gitsigns") -- Git functionality for current buffer
spec("user.illuminate") -- Highlight matching words
spec("user.indentline") -- Show indentation level
spec("user.lsp-virtual-improved") -- Only show diagnostics for current line
spec("user.mason") -- Install tools
spec("user.neogit") -- Git plugin
spec("user.neoscroll") -- Smooth scrolling
spec("user.neovim-tmux-navigator") -- Smooth vim and tmux navigation
spec("user.none-ls") -- Make command tools behave like a language server
spec("user.oil") -- Editable file explorer
spec("user.quicker") -- Improve quickfix
spec("user.schemastore") -- Json and yaml schemas
spec("user.surround") -- Motions for surrounding
spec("user.textobjs") -- Additional text objects, I only really use gG at the moment. TODO look into these more
spec("user.treesitter") -- Syntax highlighting and more
spec("user.trouble") -- A different way to improve quickfix. TODO Should this replace quicker and quickfix lists?
spec("user.ufo") -- Better folding
spec("user.workspace-diagnostics") -- Analyze complete workspace

spec("user.blade") -- Blade php file support
spec("user.pkl") -- Pkl support
spec("user.render-markdown") -- Improve markdown support
spec("user.tailwind-tools") -- Tailwind tools
spec("user.lualine") -- Better statusline

-- TODO --
spec("user.telescope") -- TODO remove
spec("user.whichkey") -- TODO remove
spec("user.lspconfig") -- TODO look into this more

spec("user.extras.cellular-automaton")

require("user.lazy")

require("user.filetype.composer")
require("user.filetype.env")
require("user.filetype.json")
require("user.filetype.php")
