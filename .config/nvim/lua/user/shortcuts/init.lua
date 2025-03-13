local shortcuts = require("user.shortcuts.shortcuts")

shortcuts.spec("user.shortcuts.watch")
shortcuts.spec("user.shortcuts.filetype")

shortcuts.shortcut("ToggleWrap", "<leader>tw", function()
	vim.wo.wrap = not vim.wo.wrap
end, "Toggle word wrap")

shortcuts.shortcut(
	"ClearSearch",
	"?",
	"nohlsearch",
	"Clear search highlights",
	{ disabled = { "nohlsearch", "nohls" } }
)

shortcuts.shortcut("SignatureHelp", "<leader>sh", function()
	vim.lsp.buf.signature_help()
end, "Show signature help")

shortcuts.shortcut("CloseWindow", "<leader>q", "confirm q", "Close current window", { disabled = { "q", "q!" } })

shortcuts.shortcut("CloseAll", "<leader>Q", "confirm qa", "Close all windows", { disabled = { "qa", "qa!" } })

shortcuts.shortcut("YankPath", "<leader>yp", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
	print("Yanked path: " .. vim.fn.expand("%"))
end, "Yank path of current buffer")

shortcuts.shortcut("JsonSort", "<leader>js", "%! ~/bin/jqsort", "Sort json")

shortcuts.shortcut("JsonExpand", "<leader>je", "%! ~/bin/jqexpand", "Expand json")

shortcuts.shortcut("NewBuffer", "<leader>bn", "enew", "New buffer", { disabled = { "ene", "enew" }} )
shortcuts.shortcut("DeleteBuffer", "<leader>bd", "confirm bdelete", "Delete buffer", { disabled = { "bd", "bd!" } })
shortcuts.shortcut("RefreshBuffer", "<leader>br", "confirm edit", "Refresh buffer")

shortcuts.shortcut("DiagnoseWorkspace", "<leader>dw", function()
	print("Populating workspace diagnostics...")
	for _, client in ipairs(vim.lsp.get_clients()) do
		require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
	end
	print("Done!")
	require("trouble").open("diagnostics")
end, "Diagnose workspace")

shortcuts.init()
