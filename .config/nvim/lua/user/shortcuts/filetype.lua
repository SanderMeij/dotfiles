return {
    name = "SetFt",
    keymap = "<leader>sf",
    command = function(opts)
        require("fzf-lua").fzf_exec({
            "bash",
            "cpp",
            "css",
            "go",
            "html",
            "java",
            "javascript",
            "json",
            "lua",
            "markdown",
            "php",
            "python",
            "rust",
            "sql",
            "typescript",
            "yaml",
        }, {
            prompt = "Filetype ❯ ",
            actions = {
                ["default"] = function(selected)
                    vim.cmd("set ft=" .. selected[1])
                end,
            },
        })
    end,
}
