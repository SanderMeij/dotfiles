M = {
    "nvim-pack/nvim-spectre"
}

function M.config()
    local wk = require "which-key"
    wk.register {
        ["<leader>ff"] = { "<cmd>lua require('spectre').toggle()<CR>", "Toggle Spectre" },
    }
end

return M
