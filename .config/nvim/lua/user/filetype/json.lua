local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

null_ls.register({
    name = "sort",
    method = null_ls.methods.CODE_ACTION,
    filetypes = { "json" },
    generator = {
        fn = function(params)
            local output = vim.fn.system("~/bin/jqsort", params.content)

            if vim.v.shell_error ~= 0 then
                return nil
            end

            return {
                {
                    title = "Sort",
                    action = function()
                        vim.api.nvim_buf_set_lines(params.bufnr, 0, -1, false, vim.split(output, "\n"))
                    end,
                },
            }
        end,
        async = false,
    },
})

null_ls.register({
    name = "expand",
    method = null_ls.methods.CODE_ACTION,
    filetypes = { "json" },
    generator = {
        fn = function(params)
            local output = vim.fn.system("~/bin/jqexpand", params.content)

            if vim.v.shell_error ~= 0 then
                return nil
            end

            return {
                {
                    title = "Expand",
                    action = function()
                        vim.api.nvim_buf_set_lines(params.bufnr, 0, -1, false, vim.split(output, "\n"))
                    end,
                },
            }
        end,
        async = false,
    },
})
