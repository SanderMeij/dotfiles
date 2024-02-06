function do_something_with_buffers()
    local buffers = vim.api.nvim_list_bufs()
    -- vim.notify(table.concat(buffers, ', '), 'info')
    for k, buffer in pairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buffer) then
            local name = vim.api.nvim_buf_get_name(buffer)
            print(name, '\n')
        end
    end
    -- vim.api.nvim_buf_get_name
end
do_something_with_buffers()

-- vim.keymap.set('n', '<leader>sb', buffers);

