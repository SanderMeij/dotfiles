return {
  "jim-at-jibba/nvim-stride",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter", -- optional, smart context
    "folke/snacks.nvim",               -- optional, animated notifications
  },
  config = function()
    require("stride").setup({
       accept_keymap = "<C-f>",
    })
  end,
}
