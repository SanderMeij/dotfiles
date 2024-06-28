
get_selection = function(args)
    if args.char then
        return M.get_find(args.char)(args.char)
    elseif args.motion then
        return require("nvim-surround.motions").get_selection(args.motion)
    elseif args.node then
        return require("nvim-surround.treesitter").get_selection(args.node)
    elseif args.pattern then
        return require("nvim-surround.patterns").get_selection(args.pattern)
    elseif args.query then
        return require("nvim-surround.queries").get_selection(args.query.capture, args.query.type)
    else
        vim.notify("Invalid key provided for `:h nvim-surround.config.get_selection()`.", vim.log.levels.ERROR)
    end
end

return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        motions = require("nvim-surround.motions")
        require("nvim-surround").setup({
            keymaps = {
                normal = "s",
                normal_line = "S",
                visual = "s",
                delete = "ds",
                change = "cs",
                change_line = "cS",
            },
            surrounds = {
                [")"] = {
                    add = { "( ", " )" },
                    find = function()
                        return motions.get_selection("a)")
                    end,
                    delete = "^(. ?)().-( ?.)()$",
                },
                ["("] = {
                    add = { "(", ")" },
                    find = function()
                        return motions.get_selection("a(")
                    end,
                    delete = "^(.)().-(.)()$",
                },
                ["}"] = {
                    add = { "{ ", " }" },
                    find = function()
                        return motions.get_selection("a}")
                    end,
                    delete = "^(. ?)().-( ?.)()$",
                },
                ["{"] = {
                    add = { "{", "}" },
                    find = function()
                        return motions.get_selection("a{")
                    end,
                    delete = "^(.)().-(.)()$",
                },
                [">"] = {
                    add = { "< ", " >" },
                    find = function()
                        return motions.get_selection("a>")
                    end,
                    delete = "^(. ?)().-( ?.)()$",
                },
                ["<"] = {
                    add = { "<", ">" },
                    find = function()
                        return motions.get_selection("a<")
                    end,
                    delete = "^(.)().-(.)()$",
                },
                ["]"] = {
                    add = { "[ ", " ]" },
                    find = function()
                        return motions.get_selection("a]")
                    end,
                    delete = "^(. ?)().-( ?.)()$",
                },
                ["["] = {
                    add = { "[", "]" },
                    find = function()
                        return motions.get_selection("a[")
                    end,
                    delete = "^(.)().-(.)()$",
                },
            },
        })
    end
}
