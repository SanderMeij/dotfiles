return {
    "https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git",
    -- Activate when a file is created/opened
    event = { "BufReadPre", "BufNewFile" },
    -- Activate when a supported filetype is open
    -- ft = { "go", "javascript", "python", "ruby", "lua", "php" },
    cond = function()
        -- Only activate if token is present in environment variable.
        -- Remove this line to use the interactive workflow.
        return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ""
    end,
    opts = {
        minimal_message_level = vim.log.levels.ERROR,
        statusline = {
            enabled = false,
        },
        code_suggestions = {
            ghost_text = {
                enabled = true,
                accept_suggestion = "<C-f>",
            },
        },
    },
}
