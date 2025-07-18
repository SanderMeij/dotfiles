local M = {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { {
        "<leader>e",
        function()
            require("oil").open_float()
        end,
        "Open File Explorer",
    } },
}

function M.config()
    require("oil").setup({
        skip_confirm_for_simple_edits = true,
        float = {
            max_height = 20,
            max_width = 60,
        },
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, bufnr)
                return name == ".git"
            end,
        },
        keymaps = {
            ["<esc>"] = { callback = "actions.close", mode = "n" },
            ["<C-l>"] = {},
        },
    })
end

return M
