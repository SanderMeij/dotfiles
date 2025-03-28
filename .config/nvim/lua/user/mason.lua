local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
}

function M.config()
	local servers = {
		"bashls",
		"cssls",
		"eslint",
		"gopls",
		"html",
		"intelephense",
		"jsonls",
		"lua_ls",
		"pyright",
		"tailwindcss",
		"ts_ls",
		"volar",
		"yamlls",
	}

	require("mason").setup({
		ui = {
			border = "rounded",
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = servers,
		automatic_installation = true,
	})
end

return M
