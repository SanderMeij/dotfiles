local M = {
    "YouSame2/inlinediff-nvim",
    lazy = true,
}

M.config = function()
    require("inlinediff").setup()
    M.group = vim.api.nvim_create_augroup("inlinediff", { clear = true })
    local colorbuddy = require("colorbuddy")
    colorbuddy.Group.new("InlineDiffAddContext", nil, colorbuddy.colors.green_25)
    colorbuddy.Group.new("InlineDiffAddChange", nil, colorbuddy.colors.green_50)
    colorbuddy.Group.new(
        "InlineDiffDeleteContext",
        colorbuddy.colors.gray9,
        colorbuddy.colors.red_25,
        colorbuddy.styles.italic
    )
    colorbuddy.Group.new(
        "InlineDiffDeleteChange",
        colorbuddy.colors.gray9,
        colorbuddy.colors.red_50,
        colorbuddy.styles.italic
    )
end

function M.toggle()
    local inline_diff = require("inlinediff")
    inline_diff.toggle()

    if inline_diff.enabled then
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
            group = M.group,
            callback = function(args)
                local buftype = vim.bo[args.buf].buftype
                vim.print(buftype)
                if buftype == "" then
                    inline_diff.refresh()
                    return
                end
            end,
        })
    else
        vim.api.nvim_clear_autocmds({ group = M.group })
    end
end

M.keys = {
    {
        "<leader>gp",
        function()
            M.toggle()
        end,
        desc = "Toggle inline diff",
    },
    {
        "<leader>gq",
        function()
            vim.fn.setqflist({}, " ", {
                lines = vim.fn.systemlist("git-jump --stdout diff"),
            })

            vim.cmd("cfirst")
            M.toggle()
        end,
        desc = "Open git diff in quickfix",
    },
}

return M
