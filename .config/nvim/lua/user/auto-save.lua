local M = {
    "okuuva/auto-save.nvim",
    event = "VeryLazy",
    opts = {},
}

local group = vim.api.nvim_create_augroup("autosave", {})

vim.api.nvim_create_autocmd("User", {
    pattern = "AutoSaveWritePre",
    group = group,
    callback = function(opts)
        if opts.data.saved_buffer ~= nil then
            local buf = opts.data.saved_buffer

            local buf_ft = vim.api.nvim_buf_get_option(buf, "filetype")
            if buf_ft == "oil" then
                return
            end

            local filename = vim.api.nvim_buf_get_name(buf)

            local dir = vim.fn.fnamemodify(filename, ":h")
            if vim.fn.isdirectory(dir) == 0 then
                vim.notify("AutoSave: creating directory " .. dir, vim.log.levels.INFO)
                vim.fn.mkdir(dir, "p")
            end
        end
    end,
})

return M
