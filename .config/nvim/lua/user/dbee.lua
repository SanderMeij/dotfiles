return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	build = function()
		require("dbee").install()
	end,
	config = function()
		require("dbee").setup({
			sources = {
				require("dbee.sources").MemorySource:new({
					{
						name = "promotijgers",
						type = "mysql",
						url = "root:root@/promotijgers",
					},
					{
						name = "karobv_staging",
						type = "mysql",
						url = "root:root@/karobv_staging",
					},
				}),
			},
		})
	end,
}
