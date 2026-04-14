local shortcuts = require("user.shortcuts.shortcuts")

shortcuts.spec("user.shortcuts.fzf")
shortcuts.spec("user.shortcuts.filetype")
shortcuts.spec("user.shortcuts.lsp")

shortcuts.shortcut("ToggleWrap", "<leader>tw", function()
    vim.wo.wrap = not vim.wo.wrap
end, "Toggle word wrap")

shortcuts.shortcut(
    "ClearSearch",
    "?",
    "nohlsearch",
    "Clear search highlights",
    { disabled = { "nohlsearch", "nohls" } }
)

shortcuts.shortcut("SignatureHelp", "<leader>sh", function()
    vim.lsp.buf.signature_help()
end, "Show signature help")

shortcuts.shortcut("CloseWindow", "<leader>q", "confirm q", "Close current window", { disabled = { "q", "q!" } })

shortcuts.shortcut("CloseAll", "<leader>Q", "confirm qa", "Close all windows", { disabled = { "qa", "qa!" } })

shortcuts.shortcut("YankPath", "<leader>yp", function()
    vim.fn.setreg("+", vim.fn.expand("%"))
    print("Yanked path: " .. vim.fn.expand("%"))
end, "Yank path of current buffer")

shortcuts.shortcut("NewBuffer", "<leader>bn", "enew", "New buffer", { disabled = { "ene", "enew" } })
shortcuts.shortcut("DeleteBuffer", "<leader>bd", "confirm bdelete", "Delete buffer", { disabled = { "bd", "bd!" } })
shortcuts.shortcut("RefreshBuffer", "<leader>br", "confirm edit", "Refresh buffer")

shortcuts.shortcut("Git", "<leader>gg", function()
    require("neogit").open()
end, "Open Git status")

shortcuts.shortcut("StageHunk", "<leader>gs", function()
    require("gitsigns").stage_hunk()
end)
shortcuts.shortcut("UnstageHunk", "<leader>gu", function()
    require("gitsigns").undo_stage_hunk()
end)
shortcuts.shortcut("ResetHunk", "<leader>gr", function()
    require("gitsigns").reset_hunk()
end)

shortcuts.shortcut("BlameHunk", "<leader>gl", function()
    require("gitsigns").blame_line()
end)

shortcuts.shortcut("StageBuffer", "<leader>gS", function()
    require("gitsigns").stage_buffer()
end)
shortcuts.shortcut("UnstageBuffer", "<leader>gU", function()
    require("gitsigns").reset_buffer_index()
end)


shortcuts.shortcut("DiagnoseWorkspace", "<leader>dw", function()
    print("Populating workspace diagnostics...")
    for _, client in ipairs(vim.lsp.get_clients()) do
        require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
    end
    print("Done!")
    require("trouble").open("diagnostics")
end, "Diagnose workspace")

shortcuts.shortcut("MakeItRain", "<leader>?m", "CellularAutomaton make_it_rain", "Make it rain!")
shortcuts.shortcut("GameOfLife", "<leader>?g", "CellularAutomaton game_of_life", "Game of life!")
shortcuts.shortcut("Scramble", "<leader>?s", "CellularAutomaton scramble", "Scramble!")

shortcuts.init()
