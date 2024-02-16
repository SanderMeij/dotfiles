local M = {
    "folke/which-key.nvim",
}

function M.config()
    local mappings = {
        q = { "<cmd>confirm qa<CR>", "Quit" },
        v = { "<cmd>vsplit<CR>", "Split" },
        f = { name = "Find" },
        G = { name = "Git" },
        l = { name = "LSP" },
        T = { name = "Treesitter" },
        o = { name = "Open" },
        ob = {'<cmd>!openb %<cr><cr>', 'Open file in browser'},
        b =  {'<cmd>!./build.sh<cr><cr>', 'Build stuff' },
        y = { name = "Yank" },
        yp = {'<cmd>let @+ = expand("%")<cr>', 'Yank path of current buffer' },
        j = { name = "Json" },
        js = { '<cmd>%! json-sort<cr><cr>', 'Json sort' },
        je = {'<cmd>%! json-expand<cr><cr>', 'Json expand' },
    }

    local which_key = require "which-key"
    which_key.setup {
        plugins = {
            marks = true,
            registers = true,
            spelling = {
                enabled = true,
                suggestions = 20,
            },
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = true,
                nav = true,
                z = true,
                g = true,
            },
        },
        window = {
            border = "rounded",
            position = "bottom",
            padding = { 1, 2, 0, 2 },
        },
        ignore_missing = true,
        show_help = false,
        show_keys = false,
        disable = {
            buftypes = {},
            filetypes = { "TelescopePrompt" },
        },
    }

    local opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
    }

    which_key.register(mappings, opts)
end

return M
