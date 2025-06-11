M = {
    "ibhagwan/fzf-lua",
}

M.config = function()
    local colorbuddy = require("colorbuddy")
    colorbuddy.Group.new("FzfLuaBorder", colorbuddy.groups.FloatBorder)
    colorbuddy.Group.new("FzfLuaHeaderText", colorbuddy.groups.Special)
    colorbuddy.Group.new("FzfLuaLiveSym", colorbuddy.groups.Special)
    colorbuddy.Group.new("FzfLuaLivePrompt", colorbuddy.groups.Special)

    require("fzf-lua").setup({
        winopts = {
            backdrop = 100,
        },
        keymap = {
            fzf = {
                ["ctrl-q"] = "select-all+accept",
            },
        },
        grep = {
            rg_opts = "--color=never --line-number --column --smart-case --glob=!.git/ --max-columns=4096 -e",
        },
        fzf_opts = {
            ["--pointer"] = "",
        },
        fzf_colors = {
            ["pointer"] = { "fg", "Primary" },
            ["fg+"] = { "fg", "Primary" },
            ["bg+"] = { "bg", "Normal" },
            ["hl"] = { "fg", "Secondary" },
            ["hl+"] = { "fg", "Secondary" },
            ["query"] = { "fg", "Normal" },
            ["prompt"] = { "fg", "Normal" },
            ["spinner"] = { "fg", "Normal" },
            ["info"] = { "fg", "Normal" },
        },
    })
end

return M
