M = {
	"ibhagwan/fzf-lua",
	opts = {},
}

M.config = function()
    local fzf = require("fzf-lua")
    local config = fzf.config
    config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
end

return M
