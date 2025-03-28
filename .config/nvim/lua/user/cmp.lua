local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp",
        },
        {
            "hrsh7th/cmp-buffer",
            event = "InsertEnter",
        },
        {
            "hrsh7th/cmp-path",
            event = "InsertEnter",
        },
        {
            "hrsh7th/cmp-cmdline",
            event = "InsertEnter",
        },
        {
            "hrsh7th/cmp-nvim-lua",
            event = "InsertEnter",
        },
        {
            "hrsh7th/cmp-calc",
            event = "InsertEnter",
        },
        {
            "Exafunction/codeium.nvim",
            cmd = "Codeium",
            build = ":Codeium Auth",
            opts = {},
        },
    },
}

function M.config()
    local cmp = require("cmp")
    local icons = require("user.icons")

    vim.api.nvim_set_hl(0, "Codeium", { fg = "#1ae4c7" })

    cmp.setup({
        enabled = function()
            return vim.bo.filetype ~= "oil"
        end,
        mapping = cmp.mapping.preset.insert({
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-e>"] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        formatting = {
            fields = { "kind", "abbr", "menu" },
            expandable_indicator = true,
            format = function(entry, vim_item)
                vim_item.kind = icons.kind[vim_item.kind]
                if entry.source.name == "codeium" then
                    vim_item.kind = icons.misc.Robot
                    vim_item.kind_hl_group = "Codeium"
                end
                if entry.source.name == "buffer" then
                    vim_item.kind = icons.apps.Vim
                end
                if entry.source.name == "calc" then
                    vim_item.kind = icons.misc.Calculator
                end

                return vim_item
            end,
        },
        sources = {
            {
                name = "codeium",
                max_item_count = 1,
            },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "buffer" },
            { name = "path" },
            { name = "calc" },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        window = {
            completion = {
                border = "rounded",
                col_offset = -4,
                scrollbar = false,
            },
            documentation = {
                border = "rounded",
            },
        },
        experimental = {
            ghost_text = false,
        },
    })

    -- Disable to keep default vim of cycling history
    local cmdLineMapping = cmp.mapping.preset.cmdline()
    cmdLineMapping["<C-N>"] = nil
    cmdLineMapping["<C-P>"] = nil

    cmp.setup.cmdline("/", {
        mapping = cmdLineMapping,
        sources = {
            { name = "buffer" },
        },
    })

    cmp.setup.cmdline(":", {
        mapping = cmdLineMapping,
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            {
                name = "cmdline",
            },
        }),
    })
end

return M
