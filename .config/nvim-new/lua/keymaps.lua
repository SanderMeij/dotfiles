local function keymap(mode, lhs, rhs, opts)
    local default_opts = { noremap = true, silent = true }
    if opts then
        opts = vim.tbl_extend("force", default_opts, opts)
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

keymap("n", "<Space>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")
keymap("n", "*", "*zz")
keymap("n", "#", "#zz")
keymap("n", "g*", "g*zz")
keymap("n", "g#", "g#zz")

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Paste without overwriting the default register
keymap("x", "p", [["_dP]])

keymap({ "n", "x" }, "j", "gj")
keymap({ "n", "x" }, "k", "gk")

keymap("n", "<leader>/", "gcc", { remap = true })
keymap("v", "<leader>/", "gc", { remap = true })

vim.keymap.set('n', '<leader>r', function()
    local session = vim.fn.stdpath('state') .. '/restart_session.vim'
    vim.cmd('mksession! ' .. vim.fn.fnameescape(session))
    vim.cmd('restart source ' .. vim.fn.fnameescape(session))
end)

keymap("n", "<leader>i", "<cmd>Inspect<cr>")
keymap("i", "<C-h>", function()
    require("lsp_signature").toggle_float_win()
end)
keymap("n", "<leader>f", function()
    require("conform").format()
end)
keymap("n", "<leader>q", "<cmd>confirm qa<cr>")

local find, grep

find = function(pattern)
    local snacks = require("snacks")
    snacks.picker("rander", {
        pattern = pattern,
        prompt = " 󰈞 ",
        hidden = true,
        win = {
            input = {
                keys = {
                    ["<c-space>"] = {
                        function(picker)
                            local search = vim.api.nvim_buf_get_lines(picker.buf, 0, -1, false)[1]
                            picker:close()
                            grep(search)
                        end,
                        mode = { "n", "i" },
                    },
                },
            },
        },
    })
end

grep = function(pattern)
    local snacks = require("snacks")
    snacks.picker("grep", {
        search = pattern,
        prompt = " 󰊄 ",
        hidden = true,
        win = {
            input = {
                keys = {
                    ["<c-space>"] = {
                        function(picker)
                            local search = vim.api.nvim_buf_get_lines(picker.buf, 0, -1, false)[1]
                            picker:close()
                            find(search)
                        end,
                        mode = { "n", "i" },
                    },
                },
            },
        },
    })
end

keymap("n", "<c-space>", find)
keymap("n", "<leader><space>", grep)
keymap("n", "<leader>e", function() require("oil").open_float() end)
keymap("n", "<leader>d", function() require("mini.diff").toggle_overlay() end)
keymap("n", "<c-h>", function() require("neovim_tmux_navigator").switch_pane('left') end, {})
keymap("n", "<c-j>", function() require("neovim_tmux_navigator").switch_pane('down') end, {})
keymap("n", "<c-k>", function() require("neovim_tmux_navigator").switch_pane('up') end, {})
keymap("n", "<c-l>", function() require("neovim_tmux_navigator").switch_pane('right') end, {})
keymap("n", "?", "<cmd>set hlsearch!<cr>")


local next_integrations = require("nvim-next.integrations")
local nqf = next_integrations.quickfix()
keymap("n", "[q", nqf.cprevious)
keymap("n", "]q", nqf.cnext)

keymap("n", "<leader>yp", function()
    local rel = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
    vim.fn.setreg("+", rel)
    print("Yanked path: " .. rel)
end)

keymap("n", "s", "<Plug>(nvim-surround-normal)")
keymap("n", "gd", vim.lsp.buf.definition)
keymap("n", "gD", vim.lsp.buf.declaration)
keymap("n", "gl", vim.diagnostic.open_float)
keymap("n", "<leader>g", "<cmd>Neogit<cr>")
