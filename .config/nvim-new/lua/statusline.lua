-- internal state for toggles
local state = {
    show_path = true,
    show_branch = true,
}

-- config for placeholders + highlighting
local config = {
    icons = {
        path_hidden = "",
        branch_hidden = "",
    },
    placeholder_hl = "StatusLineDim",
}

-- helper to wrap text in a statusline highlight group
local function hl(group, text)
    return string.format("%%#%s#%s%%*", group, text)
end

-- create and link the highlight group(s)
vim.api.nvim_set_hl(0, config.placeholder_hl, {})   -- create if missing
vim.api.nvim_set_hl(0, config.placeholder_hl, { link = "Comment" })

local function filepath()
    local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")

    if fpath == "" or fpath == "." then
        return ""
    end

    if state.show_path then
        return string.format("%%<%s/", fpath)
    end

    return hl(config.placeholder_hl, config.icons.path_hidden .. "/")
end

local function git()
    local git_info = vim.b.gitsigns_status_dict
    if not git_info or git_info.head == "" then
        return ""
    end

    local head    = git_info.head
    local added   = git_info.added and (" +" .. git_info.added) or ""
    local changed = git_info.changed and (" ~" .. git_info.changed) or ""
    local removed = git_info.removed and (" -" .. git_info.removed) or ""
    if git_info.added == 0 then added = "" end
    if git_info.changed == 0 then changed = "" end
    if git_info.removed == 0 then removed = "" end

    if not state.show_branch then
        head = hl(config.placeholder_hl, config.icons.branch_hidden)
    end

    return table.concat({
        "[ ",
        head,
        added, changed, removed,
        "]",
    })
end

local ids = {}
local active_diff = 1

local function update_ids()
    local result = vim.system(
      { 'jj', 'log', '-r', '@+', '--no-graph', '-T', 'change_id.shortest() ++ "\\n"' },
      { text = true }
    ):wait()
    ids = vim.split(result.stdout, '\n', { trimempty = true })
    table.insert(ids, 1, '@')
end

local function jujutsu()
    update_ids()
    return table.concat({ "[ ", ids[active_diff], "]" })
end

vim.api.nvim_create_user_command('JujutsuNext', function()
    update_ids()
    active_diff = (active_diff % #ids) + 1
    vim.cmd.redrawstatus()
end, {})

Statusline = {}

function Statusline.active()
    return table.concat {
        "[", filepath(), "%t] ",
        git(),
        jujutsu(),
        "%=",
        "%y [%P %l:%c]"
    }
end

function Statusline.inactive()
    return " %t"
end

local group = vim.api.nvim_create_augroup("Statusline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = group,
    desc = "Activate statusline on focus",
    callback = function()
        vim.opt_local.statusline = "%!v:lua.Statusline.active()"
    end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    group = group,
    desc = "Deactivate statusline when unfocused",
    callback = function()
        vim.opt_local.statusline = "%!v:lua.Statusline.inactive()"
    end,
})
