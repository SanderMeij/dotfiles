return {
    name = "Files",
    keymap = "<c-space>",
    command = function(opts)
        require("fzf-lua").files {
            formatter = "path.filename_first",
            hidden = true,
            previewer = false,
            prompt = ' ',
            query = opts.args,
            winopts = { width = 0.5 },
            actions = {
                ['ctrl-space'] = function (_, fzf)
                    vim.cmd("Grep " .. fzf['last_query'])
                end,
            },
            cwd_prompt = false,
        }
    end,
}
