return {
    icon = "css",
    cmd = { 'vscode-css-language-server', '--stdio' },
    settings = {
        css = {
            validate = true,
            lint = {},
        },
        scss = {
            validate = true,
            lint = {},
        },
        less = {
            validate = true,
            lint = {},
        },
    },
}
