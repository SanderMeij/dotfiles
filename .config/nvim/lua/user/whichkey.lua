local M = {
    "folke/which-key.nvim",
    branch = "main",
    commit = "0099511294f16b81c696004fa6a403b0ae61f7a0"
}

M.command = function (command)
    vim.opt.shellcmdflag="-ic"
    vim.cmd("%! " .. command)
    vim.opt.shellcmdflag="-ic"
end

function M.config()
    local mappings = {
        q = { "<cmd>confirm q<CR>", "Quit" },
        Q = { "<cmd>confirm qa<CR>", "Quit all" },
        v = { "<cmd>vsplit<CR>", "Split" },
        f = { name = "Find" },
        G = { name = "Git" },
        l = { name = "LSP" },
        T = { name = "Treesitter" },
        o = {'<cmd>!nu -c "start %"<cr><cr>', 'Open file'},
        b =  {'<cmd>!./build.sh<cr><cr>', 'Build stuff' },
        y = { name = "Yank" },
        yp = {'<cmd>let @+ = expand("%")<cr><cmd>lua vim.notify("Yanked path: " .. vim.fn.expand("%"))<cr>', 'Yank path of current buffer' },
        j = { name = "Json" },
        js = { function() M.command('json-sort') end, 'Json sort' },
        je = { function() M.command('json-expand') end, 'Json expand' },
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
        win = {
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

    local bracket_mapping = function(mapping, previous, next, description)
        local ctrl = function()
            vim.keymap.set("n", "<c-p>", function () vim.cmd(previous) end, { noremap = true, silent = true })
            vim.keymap.set("n", "<c-n>", function () vim.cmd(next) end, { noremap = true, silent = true })
        end
        which_key.register (
            {
                ['[' .. mapping] = { 
                    function ()
                        vim.cmd(previous)
                        ctrl()
                    end,
                    "Previous " .. description,
                },
                [']' .. mapping] = {
                    function ()
                        vim.cmd(next)
                        ctrl()
                    end,
                    "Next " .. description,
                }
            },
            {
                mode = "n",
            }
        )
    end

    bracket_mapping('q', 'try | cprev | catch | clast | catch | endtry',  'try | cnext | catch | cfirst | catch | endtry', 'quickfix item')
    bracket_mapping('d', 'lua vim.diagnostic.goto_prev()',  'lua vim.diagnostic.goto_next()', 'diagnostic')
    bracket_mapping('g', 'lua require("gitsigns").prev_hunk()', 'lua require("gitsigns").next_hunk()', 'hunk')
end

return M
