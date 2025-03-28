return {
    name = "Grep",
    keymap = "<leader><space>",
    command = function(opts)
        require("fzf-lua").live_grep {
            hidden = true,
            query = opts.args,
            actions = {
                ['ctrl-space'] = function (_, fzf)
                    vim.cmd("Files " .. fzf['last_query'])
                end,
            }
        }
    end,
}
