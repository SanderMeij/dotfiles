vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        vim.cmd("set formatoptions-=cro")
    end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 40 })
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = false
    end,
})

vim.api.nvim_create_autocmd("BufLeave", {
    callback = function()
        local pattern = vim.fn.getreg("/")
        vim.b.last_search_pattern = pattern
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.b.last_search_pattern then
            vim.fn.setreg("/", vim.b.last_search_pattern)
            vim.cmd("let @/ = b:last_search_pattern")
        end
    end,
})
