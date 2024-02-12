return   {
    'laytan/tailwind-sorter.nvim',
    dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim'},
    build = 'cd formatter && npm i && npm run build',
    opts = {
        on_save_enabled = false,
        on_save_pattern = { '*.twig' }
    },
    event = "VeryLazy",
}

