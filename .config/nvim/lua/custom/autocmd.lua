-- Can't get the lua working for now
vim.cmd('autocmd BufWinEnter,WinEnter term://* startinsert');
-- vim.api.nvim_create_autocmd({'BufWinEnter','WinEnter', 'BufEnter'}, {
--     pattern = {'term*'},
--     callback = function(ev)
--         print(string.format('event fired: %s', vim.inspect(ev)))
--     end
-- })
