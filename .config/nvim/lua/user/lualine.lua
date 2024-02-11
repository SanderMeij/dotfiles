local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = 'one_monokai',
        component_separators = '|',
        section_separators = '',
        show_filename_only = false,
          ignore_focus = { "NvimTree" },
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1,
          }
        },
      },

  }
end

return M
