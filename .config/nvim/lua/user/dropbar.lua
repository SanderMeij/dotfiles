return {
    "Bekaboo/dropbar.nvim",
    opts = {
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
    },
}
