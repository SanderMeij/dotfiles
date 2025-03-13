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
    end,
}
