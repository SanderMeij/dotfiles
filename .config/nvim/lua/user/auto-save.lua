local M = {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
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
            if buf_ft == "oil" or buf_ft == "qf" then
                return
            end

            local filename = vim.api.nvim_buf_get_name(buf)
            if filename == "" then
                filename = vim.fn.stdpath("data") .. "/auto-save/" .. tostring(os.time())
                vim.notify(filename)
                vim.api.nvim_buf_set_name(0, filename)
            end

            local dir = vim.fn.fnamemodify(filename, ":h")
            if vim.fn.isdirectory(dir) == 0 then
                vim.notify("AutoSave: creating directory " .. dir, vim.log.levels.INFO)
                vim.fn.mkdir(dir, "p")
            end
        end
    end,
})

return M
