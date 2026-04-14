local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

return {
     cmd = { '/home/sander/development/ai-lsp/ai-lsp' },
     filetypes = { 'sql', 'markdown', 'txt', 'go', 'lua', 'php', 'javascript', 'python' }, -- Adjust to your preferred filetypes
     -- root_dir = function(fname)
     --   return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
     -- end,
     settings = {},
}
