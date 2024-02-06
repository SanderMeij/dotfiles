vim.o.expandtab = true;
vim.o.tabstop = 4;
vim.o.shiftwidth = 4;
vim.o.scrolloff = 4;
vim.o.sidescrolloff = 4;
-- vim.o.showtabline = 0;
vim.o.swapfile = 0;
vim.o.hlsearch = true;

require('custom.autocmd');

require('custom.keymaps.general');
require('custom.keymaps.neotree');
require('custom.keymaps.fugitive');
