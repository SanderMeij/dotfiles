function keymap(mode, lhs, rhs, opts)
    -- Validate required arguments
    if not mode or not lhs or not rhs then
        error("keymap: 'mode', 'lhs', and 'rhs' are required parameters")
    end

    -- Set default options and merge with user-provided options
    local default_opts = { noremap = true, silent = true }
    opts = vim.tbl_extend("force", default_opts, opts or {})

    vim.keymap.set(mode, lhs, rhs, opts)
end

function command(command)
    vim.opt.shellcmdflag="-ic"
    vim.cmd("%! " .. command)
    vim.opt.shellcmdflag="-ic"
end

keymap("n", "<Space>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>")

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

-- Always just go down one line
keymap({ "n", "x" }, "j", "gj")
keymap({ "n", "x" }, "k", "gk")
keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>")

keymap("n", "?", "<cmd>noh<cr>")

function ctrl_keymap_alias(letter, description)
    keymap("n", "<leader>c" .. letter, "<c-" .. letter .. ">", { desc = description })
end

function ctrl_keymap_available(letter)
    keymap("n", "<leader>c" .. letter, " ", { desc = "-" })
end

function ctrl_keymap(mode, lhs, rhs, opts)

end

ctrl_keymap_alias("a", "Add [count] to the number or alphabetic character at or after the cursor.")
ctrl_keymap_available("b")
ctrl_keymap_alias("c", "Any pending command is aborted")
ctrl_keymap_alias("d", "Scroll upwards")
ctrl_keymap_available("e")
ctrl_keymap_available("f")
ctrl_keymap_available("g")
ctrl_keymap_alias("h", "Navigate to the left")
ctrl_keymap_alias("i", "Press tab")

keymap("n", "<leader>q", ":q<cr>", { desc = "Quit" })
keymap("n", "<leader>Q", ":qa!<cr>", { desc = "Quit all" })
keymap("n", "<leader>o", "<cmd>!nu -c 'start %'<cr><cr>", { desc = "Open file" })
keymap("n", "<leader>yp",  "<cmd>let @+ = expand('%')<cr><cmd>lua vim.notify('Yanked path: ' .. vim.fn.expand('%'))<cr>", { desc = "Yank path of current buffer" })
keymap("n", "<leader>js", function() command('json-sort') end, { desc = "Json sort" })
keymap("n", "<leader>je", function() command('json-expand') end, { desc = "Json expand" })

