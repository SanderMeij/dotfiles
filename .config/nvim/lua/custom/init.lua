vim.o.expandtab = true;
vim.o.tabstop = 4;
vim.o.shiftwidth = 4;
vim.o.scrolloff = 4;
vim.o.sidescrolloff = 4;
-- vim.o.showtabline = 0;
vim.o.cmdheight=0;
vim.o.swapfile = 0;
vim.o.hlsearch = true;
vim.o.nrformats = 'unsigned';

vim.g.tmux_navigator_no_wrap = 1

require('custom.autocmd');

require('custom.keymaps.general');
require('custom.keymaps.neotree');
require('custom.keymaps.fugitive');
