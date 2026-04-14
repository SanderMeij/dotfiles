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

keymap("n", "c", [["_c]])
keymap("n", "C", [["_C]])
-- Paste without overwriting the default register
keymap("x", "p", [["_dP]])

keymap({ "n", "x" }, "j", "gj")
keymap({ "n", "x" }, "k", "gk")

keymap("n", "(", "<C-o>")
keymap("n", ")", "<C-i>")

keymap("n", "<leader>/", "gcc", { remap = true })
keymap("v", "<leader>/", "gc", { remap = true })

keymap("n", "<leader>i", "<cmd>Inspect<cr>")
keymap("i", "<C-h>", function()
    require("lsp_signature").toggle_float_win()
end)

keymap({ "n", "x" }, "<leader>la", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

local bracket_mapping = function(mapping, previous, next, description)
    local ctrl = function()
        vim.keymap.set("n", "<c-p>", function()
            vim.cmd(previous)
             vim.cmd('normal! zz')
        end, { noremap = true, silent = true })
        vim.keymap.set("n", "<c-n>", function()
            vim.cmd(next)
             vim.cmd('normal! zz')
        end, { noremap = true, silent = true })
    end
    keymap("n", "[" .. mapping, function ()
        vim.cmd(previous)
        ctrl()
    end)
    keymap("n", "]" .. mapping, function ()
        vim.cmd(next)
        ctrl()
    end)
end

bracket_mapping(
    "q",
    "try | cprev | catch | clast | catch | endtry",
    "try | cnext | catch | cfirst | catch | endtry",
    "quickfix item"
)
bracket_mapping("d", "lua vim.diagnostic.goto_prev()", "lua vim.diagnostic.goto_next()", "diagnostic")
bracket_mapping("g", 'lua require("gitsigns").prev_hunk()', 'lua require("gitsigns").next_hunk()', "hunk")
bracket_mapping(
    "t",
    'lua require("trouble").prev({ jump = true })',
    'lua require("trouble").next({ jump = true })',
    "trouble"
)
