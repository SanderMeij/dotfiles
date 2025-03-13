return {
	{
		"gbprod/phpactor.nvim",
		build = function()
			require("phpactor.handler.update")()
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			install = {
				check_on_startup = "always",
				auto_update = true,
			},
			lspconfig = {
				enable = true,
				options = {
					on_attach = require("user.lsp-utils").on_attach,
					capabilities = require("user.lsp-utils").make_capabilities(),
				},
			},
		},
	},
}
