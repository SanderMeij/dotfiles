local icons = require("user.icons")
return {
    {
        name = "Files",
        keymap = "<c-space>",
        command = function(opts)
            fzf = require("fzf-lua")
            fzf.files({
                -- debug = true,
                -- formatter = "path.filename_first",
                hidden = true,
                previewer = false,
                prompt = " " .. icons.ui.FindFile .. " ",
                query = opts.args,
                winopts = { width = 0.5 },
                actions = {
                    ["ctrl-space"] = function(_, fzf)
                        vim.cmd("Grep " .. fzf["last_query"])
                    end,
                    ["ctrl-i"] = fzf.actions.toggle_ignore,
                },
                cwd_prompt = false,
            })
        end,
    },
    {
        name = "Grep",
        keymap = "<leader><space>",
        command = function(opts)
            fzf = require("fzf-lua")
            fzf.live_grep({
                hidden = true,
                query = opts.args,
                prompt = " " .. icons.ui.FindText .. " ",
                actions = {
                    ["ctrl-space"] = function(_, fzf)
                        vim.cmd("Files " .. fzf["last_query"])
                    end,
                    ["ctrl-i"] = fzf.actions.toggle_ignore
                },
            })
        end,
    },
    {
        name = "FindHighlight",
        keymap = "<leader>fj",
        command = function()
            require("fzf-lua").highlights()
        end,
    },
}
