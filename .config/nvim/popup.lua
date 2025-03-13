require("user.minimal")

vim.keymap.set(
    "n",
    "<esc>",
    "<cmd>set sessionoptions=options<cr><cmd>mksession! ~/.local/state/popup.vim<cr><cmd>wq<cr>"
)
