M = {
    'luozhiya/lsp-virtual-improved.nvim',
    event = { 'LspAttach' },
}

function M.config()
    require('lsp-virtual-improved').setup({
    })
end

return M
