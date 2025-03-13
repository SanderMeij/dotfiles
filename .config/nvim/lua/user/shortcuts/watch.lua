return {
    name = "WatchBuffer",
    keymap = "<leader>wb",
    command = function()
        vim.ui.input(
            { prompt = "Enter command to watch: " },
            function(command)
                if not command or command == "" then
                    print("No command provided")
                    return
                end

                -- Create a scratch buffer
                local buf = vim.api.nvim_create_buf(false, true)  -- (listed=false, scratch=true)
                vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
                vim.api.nvim_buf_set_option(buf, "bufhidden", "hide")
                vim.api.nvim_buf_set_option(buf, "swapfile", false)

                vim.cmd("botright split") 
                vim.cmd("resize 10")
                vim.api.nvim_set_current_buf(buf)

                -- Function to update buffer content
                local function update_buffer()
                    vim.fn.jobstart(command, {
                        stdout_buffered = true,
                        on_stdout = function(_, data)
                            if data then
                                vim.api.nvim_buf_set_lines(buf, 0, -1, false, data)
                            end
                        end,
                    })
                end

                vim.api.nvim_create_autocmd("BufWritePost", {
                    callback = update_buffer,
                })
                update_buffer()

                 vim.keymap.set("n", "gf", function()
                    local file = vim.fn.expand("<cfile>")
                    vim.cmd("wincmd w") 
                    vim.cmd("edit " .. file)
                end, { buffer = buf, noremap = true, silent = true })
            end
        )
    end,
    desc = "Watch files and view command output in a buffer"
}
