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

keymap("n", "<leader>i", "<cmd>Inspect<cr>")
keymap("i", "<C-h>", function()
    require("lsp_signature").toggle_float_win()
end)

-- keymap("n", "<C-space>w", "<cmd>ToggleWrap<cr>", "Toggle wrap")
-- keymap("n", "?", "<cmd>ClearSearch<cr>", "Clear search")
-- keymap("i", "<C-h>", "<cmd>SignatureHelp<cr>", "Signature help")
-- keymap("n", "<leader>q", "<cmd>confirm q<cr>", "Quit")
-- keymap("n", "<leader>Q", "<cmd>confirm qa<cr>", "Quit all")
-- keymap("n", "<leader>o", "<cmd>!nu -c 'start %'<cr><cr>", "Open file")
-- keymap("n", "yp", "<cmd>let @+ = expand('%')<cr><cmd>lua vim.notify('Yanked path: ' .. vim.fn.expand('%'))<cr>", "Yank path of current buffer")

-- yp = {'<cmd>let @+ = expand("%")<cr><cmd>lua vim.notify("Yanked path: " .. vim.fn.expand("%"))<cr>', 'Yank path of current buffer' },
-- j = { name = "Json" },
-- js = { function() M.command('json-sort') end, 'Json sort' },
-- je = { function() M.command('json-expand') end, 'Json expand' },
-- n = { function() vim.fn.input('Nushell') end, 'Nushell' },
--

-- keymap('n', '<leader>dw', "<cmd>DiagnoseWorkspace<cr>", "Diagnose Workspace")
