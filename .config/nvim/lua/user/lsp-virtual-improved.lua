M = {
    'luozhiya/lsp-virtual-improved.nvim',
    event = { 'LspAttach' },
    config = function()
        require('lsp-virtual-improved').setup()
    end,
}

function M.config()
    require('lsp-virtual-improved').setup({
    })
end

return M
