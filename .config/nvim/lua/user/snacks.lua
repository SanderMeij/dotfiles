local hl = {
    "Invisble",
    "Green50",
    "Cyan50",
    "Blue50",
    "Violet50",
    "Magenta50",
    "Red50",
    "Orange50",
    "Yellow50",
    "Orange50",
    "Red50",
    "Magenta50",
    "Violet50",
    "Blue50",
    "Cyan50",
    "Green50",
}

local function relative_buffer_file(buf)
    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":.")
end

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true, preset = { keys = {}, header = "" } },
        explorer = { enabled = false },
        indent = {
            indent = {
                char = "┆",
                hl = hl,
            },
            scope = {
                hl = hl,
            },
        },
        input = { enabled = true },
        picker = {
            enabled = true,
            matcher = {
                filename_bonus = false,
            },
            sort = {
                fields = { "idx" },
            },
            sources = {
                rander = {
                    finder = function(opts, ctx)
                        local fd_args = ""
                        if opts.hidden then
                            fd_args = fd_args .. " --hidden"
                        end
                        if opts.ignored then
                            fd_args = fd_args .. " --no-ignore"
                        end
                        local cwd = vim.fn.getcwd()
                        local current_buf = relative_buffer_file(vim.api.nvim_get_current_buf())
                        local buffer_files = {}
                        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                            if vim.api.nvim_buf_is_loaded(buf) then
                                local name = relative_buffer_file(buf)
                                table.insert(buffer_files, name)
                            end
                        end
                        local file_list = table.concat(buffer_files, " ")

                        return require("snacks.picker.source.proc").proc(
                            {
                                notify = true,
                                cmd = "sh",
                                args = {
                                    "-c",
                                    "fdfind --type file"
                                        .. fd_args
                                        .. " | rander "
                                        .. cwd
                                        .. " get --active "
                                        .. file_list
                                        .. " --exclude "
                                        .. current_buf,
                                },
                                transform = function(item)
                                    item.file = item.text
                                    item.icon = "󰒓"
                                end,
                            },
                            ctx
                        )
                    end,
                    title = "Files",
                    layout = {
                        preset = "dropdown",
                        preview = false,
                    },
                    format = function(item, _)
                        local icons = require("mini.icons")
                        local icon, highlight = icons.get("extension", item.text)
                        return {
                            { icon .. " ", highlight },
                            { item.text, item.text_hl },
                        }
                    end,
                },
            },
            win = {
                input = {
                    keys = {
                        ["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
                        ["<tab>"] = { "toggle_ignored", mode = { "i", "n" } },
                        ["<c-j>"] = { { "list_top", "confirm" }, mode = { "i", "n" } },
                        ["<c-k>"] = { { "list_top", "list_down", "confirm" }, mode = { "i", "n" } },
                        ["<c-l>"] = { { "list_top", "list_down", "list_down", "confirm" }, mode = { "i", "n" } },
                    },
                },
            },
        },
        notifier = { enabled = true },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = {
            enabled = false,
            animate = {
                duration = { step = 5, total = 50 },
                easing = "linear",
            },
        },
        statuscolumn = { enabled = false },
        words = { enabled = false },
    },
}
