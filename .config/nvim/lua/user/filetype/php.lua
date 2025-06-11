vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    command = "setlocal commentstring=//\\ %s",
})

local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

local phpcs = 'phpcs'
local phpcbf = 'phpcbf'
local standard = 'PSR-12'

local ruleset = vim.fs.find('ruleset.xml', { upward = true })[1]
if ruleset then
    standard = ruleset
    local dirname = vim.fs.dirname(ruleset)

    local composer_phpcs = dirname .. '/vendor/bin/phpcs'
    if os.execute("test -f " .. composer_phpcs) == 0 then
        phpcs = composer_phpcs
    end

    local composer_phpcbf = dirname .. '/vendor/bin/phpcbf'
    if os.execute("test -f " .. composer_phpcbf) == 0 then
        phpcbf = composer_phpcbf
    end
end

if phpcs then
    null_ls.register({
        name = phpcs,
        method = null_ls.methods.DIAGNOSTICS,
        filetypes = { "php" },
        generator = null_ls.generator({
            command = phpcs,
            args = {
                "--standard=" .. standard,
                "--tab-width=4",
                "--report=json",
                -- silence status messages during processing as they are invalid JSON
                "-q",
                -- always report codes
                "-s",
                -- phpcs exits with a non-0 exit code when messages are reported but we only want to know if the command fails
                "--runtime-set",
                "ignore_errors_on_exit",
                "1",
                -- process stdin
                "--stdin-path=$FILENAME",
                -- get absolute paths under params.output.files
                "--basepath=",
            },
            format = "json_raw",
            to_stdin = true,
            from_stderr = false,
            check_exit_code = function(code)
                return code <= 1
            end,
            on_output = function(params)
                local parser = helpers.diagnostics.from_json({
                    attributes = {
                        severity = "type",
                        code = "source",
                    },
                    severities = {
                        ERROR = helpers.diagnostics.severities["warning"],
                        WARNING = helpers.diagnostics.severities["warning"],
                    },
                })
                params.messages = params.output
                        and params.output.files
                        and params.output.files[params.bufname]
                        and params.output.files[params.bufname].messages
                    or {}

                return parser({ output = params.messages })
            end,
        }),
        factory = helpers.generator_factory,
    })
end

if phpcbf then
    null_ls.register({
        name = phpcbf,
        method = null_ls.methods.FORMATTING,
        filetypes = { "php" },
        generator = null_ls.formatter({
            command = phpcbf,
            args = {
                "--standard=" .. standard,
                "--tab-width=4",
                -- silence status messages during processing
                "-q",
                -- passes the filename to phpcs, so it respects all include and exclude patterns
                "--stdin-path=$FILENAME",
                -- process stdin
                "-",
            },
            to_stdin = true,
            check_exit_code = function(code)
                -- phpcbf return a 1 or 2 exit code if it detects warnings or errors
                return code <= 2
            end,
        }),
    })
end
