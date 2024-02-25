local api = vim.api
local base = require("notify.render.base")

M = {
    "rcarriga/nvim-notify",
}

local function render(bufnr, notif, highlights, config)
    local namespace = base.namespace()
    for k, v in pairs(notif.message) do
        notif.message[k] = " " .. notif.icon .. "  " .. v .. " "
    end
    api.nvim_buf_set_lines(bufnr, 0, -1, false, notif.message)

    api.nvim_buf_set_extmark(bufnr, namespace, 0, 0, {
        hl_group = highlights.body,
        end_line = #notif.message - 1,
        end_col = #notif.message[#notif.message],
        priority = 50,
    })
end

M.config = function()
    require("notify").setup({
        minimum_width = 20,
        timeout = 2000,
        render = render,
    })
    vim.api.nvim_create_autocmd({ "RecordingEnter" },
        {
            callback = function()
                vim.notify('Recording ' .. vim.fn.reg_recording() .. '..')
            end,
        }
    )
    vim.api.nvim_create_autocmd({ "RecordingLeave" },
        {
            callback = function()
                vim.notify('Recorded ' .. vim.fn.reg_recording() .. '!')
            end,
        }
    )
end

return M
