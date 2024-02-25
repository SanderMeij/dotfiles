local colors = require('user.colors')
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', {
    fg = colors.text
})
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', {
    fg = colors.red
})
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', {
    fg = colors.peach
})
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', {
    fg = colors.text
})
