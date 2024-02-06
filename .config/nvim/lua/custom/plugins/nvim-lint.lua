return {
  {
    'mfussenegger/nvim-lint',
    dependencies = 'williamboman/mason.nvim',
    cmd = "Lint",
    init = function ()
      require('lint').linters_by_ft = {
        markdown = {'vale',},
        php = {'phpcs'}
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
      local phpcs = require('lint').linters.phpcs
      phpcs.args = {
        '-q',
        '--standard=PSR12',
        '--report=json',
        '-'
      }
      -- local phpstan = require('lint').linters.phpstan
      --   phpstan.args = {
      --     '--level max'
      --   }
    end
  }

}


