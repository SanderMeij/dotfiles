return {
    "leonardcser/cursortab.nvim",
    version = "*", -- Use latest tagged version for more stability
    build = "cd server && go build",
    config = function()
        require("cursortab").setup({
            enabled = true,
            log_level = "trace", -- "trace", "debug", "info", "warn", "error"
            provider = {
                type = "sweepapi",
                api_key_env = "SWEEPAPI_TOKEN",
            },
              keymaps = {
                accept = "<c-f>",           -- Keymap to accept completion, or false to disable
                partial_accept = "<S-Tab>", -- Keymap to partially accept, or false to disable
                trigger = false,            -- Keymap to manually trigger completion, or false to disable
              },
            -- provider = {
            --     type = "sweep",
            --     url = "http://localhost:8113",
            -- },
        })
    end,
}
