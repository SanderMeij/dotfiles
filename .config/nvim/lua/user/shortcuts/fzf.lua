local icons = require("user.icons")

return {
    {
        name = "Files",
        keymap = "<c-space>",
        command = function(opts)
            local snacks = require("snacks")
            snacks.picker("rander", {
                pattern = opts.args,
                prompt = " " .. icons.ui.FindFile .. " ",
                hidden = true,
                win = {
                    input = {
                        keys = {
                            ["<c-space>"] = {
                                function(picker)
                                    local search = vim.api.nvim_buf_get_lines(picker.buf, 0, -1, false)[1]
                                    picker:close()
                                    vim.cmd("Grep " .. search)
                                end,
                                mode = { "n", "i" },
                            },
                        },
                    },
                },
            })
        end,
    },
    {
        name = "Grep",
        keymap = "<leader><space>",
        command = function(opts)
            local snacks = require("snacks")
            snacks.picker("grep", {
                search = opts.args,
                prompt = " " .. icons.ui.FindText .. " ",
                hidden = true,
                win = {
                    input = {
                        keys = {
                            ["<c-space>"] = {
                                function(picker)
                                    local search = vim.api.nvim_buf_get_lines(picker.buf, 0, -1, false)[1]
                                    picker:close()
                                    vim.cmd("Files " .. search)
                                end,
                                mode = { "n", "i" },
                            },
                        },
                    },
                },
            })
        end,
    },
}
