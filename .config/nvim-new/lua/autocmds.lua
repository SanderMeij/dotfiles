vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 40 })
    end,
})

local timer = vim.uv.new_timer()

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  group = vim.api.nvim_create_augroup("ufo_auto_open", { clear = true }),
  callback = function()
    timer:stop()
    timer:start(300, 0, vim.schedule_wrap(function()
      local lnum = vim.api.nvim_win_get_cursor(0)[1]
      if vim.fn.foldclosed(lnum) ~= -1 then
        vim.cmd("normal! zO")
      end
    end))
  end,
})

local fold_close_keys = { "zc", "zC", "zm", "zM", "za", "zA" }
for _, key in ipairs(fold_close_keys) do
  vim.keymap.set("n", key, function()
    timer:stop()
    return key
  end, { expr = true })
end
