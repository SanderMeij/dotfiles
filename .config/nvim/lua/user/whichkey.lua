local M = {
  "folke/which-key.nvim",
}

-- keymap('n', '<leader>ob', '<cmd>!openb %<cr><cr>', { desc = '[O]pen file in [B]rowser'})
-- keymap('n', '<leader>b', '<cmd>!./build.sh<cr><cr>', { desc = '[B]uild stuff' })
-- keymap('n', '<leader>cp', '<cmd>let @+ = expand("%")<cr>', { desc = '[C]opy [P]ath of current buffer' })
-- keymap('n', '<leader>js', '<cmd>%! json-sort<cr>', { desc = '[J]son [S]ort' })
-- keymap('n', '<leader>je', '<cmd>%! json-expand<cr>', { desc = '[J]son [E]xpand' })
function M.config()
  local mappings = {
    q = { "<cmd>confirm q<CR>", "Quit" },
    v = { "<cmd>vsplit<CR>", "Split" },
    f = { name = "Find" },
    G = { name = "Git" },
    l = { name = "LSP" },
    T = { name = "Treesitter" },
  }

  local which_key = require "which-key"
  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    window = {
      border = "rounded",
      position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
    ignore_missing = true,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.register(mappings, opts)
end

return M
