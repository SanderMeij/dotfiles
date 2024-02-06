local async = require("plenary.async")
local notify = require("notify").async

-- vim.keymap.set('n', '<CR>', '<cmd>b#<cr>');
vim.keymap.set('n', '<leader>o', '<cmd>!open % -a Opera<cr><cr>', { desc = '[O]pen File in the browser' })
vim.keymap.set('n', '<leader>b', '<cmd>!./build.sh<cr><cr>', { desc = '[B]uild stuff' })
vim.keymap.set('n', '<leader>ts', '<cmd>tabe term://zsh<cr>symfony serve --port=8005<cr><esc><cmd>tabp<cr>', { desc = 'Open [Tab] with [Symfony] server' })
vim.keymap.set('t', '<C-w>', '<C-\\><C-N><C-w><C-w>')
vim.keymap.set('n', '<leader>cp', '<cmd>let @+ = expand("%")<cr>', { desc = '[C]opy [P]ath of current buffer' })

-- JSON
vim.keymap.set('n', '<leader>js', '<cmd>%! jq \'walk(if type == "object" then to_entries | sort_by(.key) | from_entries else . end)\' --indent 4<cr>', { desc = '[J]son [S]ort' })
vim.keymap.set('n', '<leader>je', '<cmd>%! jq \'to_entries | map(setpath(["tmp"] + (.key | split(".")); .value)) | map(.tmp) | reduce .[] as $item ({}; . * $item)\' --indent 4<cr>', { desc = '[J]son [E]xpand' })

function run_build_sh()
    vim.notify("This is an error message.\nSomething went wrong!", "error")
    async.run(function()
        local handle = io.popen("./build.sh")
        local result = handle:read("*a")
        handle:close()
        vim.notify(result)
    end)
end

function test_notify()
    vim.notify("This is an error message.\nSomething went wrong!", "error", {
      title = 'test',
      on_open = function()
        vim.notify("Attempting recovery.", vim.log.levels.WARN, {
          title = plugin,
        })
        local timer = vim.loop.new_timer()
        timer:start(2000, 0, function()
          vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
            title = 'test',
            timeout = 3000,
            on_close = function()
              vim.notify("Problem solved", nil, { title = plugin })
              vim.notify("Error code 0x0395AF", 1, { title = plugin })
            end,
          })
        end)
      end,
    })
end

vim.keymap.set('n', '<leader>B', run_build_sh, { desc = '[B]uild stuff and show results' })

function repeat_last_change ()
    local pattern = vim.fn.getreg('"')
    local string = vim.fn.getreg('.')
    vim.notify(pattern)
    vim.notify(string)
end
vim.keymap.set('n', '<leader>rc', ':%sno/<C-r>=escape(@", "\\/")<CR>/<C-r>=escape(@., "\\/")<CR>/gc<CR>', { desc = '[R]epeat last [C]hange' });


local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- Stay in indent mode after
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Paste without overwriting the default register
keymap("x", "p", [["_dP]])

-- Better going to beginning and end of lines,
-- might be better to make $ and ^ more accessable though
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

