return {
    "tpope/vim-dadbod",
    dependencies = {
        "ellisonleao/dotenv.nvim",
    },
    config = function()
        -- Load dotenv
        require("dotenv").setup({
            enable_on_load = true,
            verbose = false,
        })

        -- Create keymap to execute current SQL file
        vim.keymap.set("n", "<leader>d", function()
            -- Get environment variables
            local host = vim.fn.getenv("DB_HOST")
            local database = vim.fn.getenv("DB_DATABASE")
            local username = vim.fn.getenv("DB_USERNAME")
            local password = vim.fn.getenv("DB_PASSWORD")

            -- Validate credentials
            if host == vim.NIL or database == vim.NIL or username == vim.NIL or password == vim.NIL then
                vim.notify("Missing database credentials in .env file", vim.log.levels.ERROR)
                return
            end

            -- Build connection string (adjust for your database type)
            -- MySQL example:
            local db_url = string.format("mysql://%s:%s@%s/%s", username, password, host, database)

            -- PostgreSQL example (uncomment if needed):
            -- local db_url = string.format("postgresql://%s:%s@%s/%s", username, password, host, database)

            -- Execute current file
            vim.cmd(string.format("%%DB %s", db_url))
        end, { desc = "Execute SQL file with dadbod" })
    end,
}
