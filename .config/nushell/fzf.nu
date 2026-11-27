use ~/.config/colors/colors.nu

let colors = colors

$env.FZF_DEFAULT_OPTS = $"
    --border=rounded
    --color=bg:-1,bg+:-1,fg:-1,hl:($colors.yellow),fg+:($colors.green),hl+:($colors.yellow),info:($colors.blue),prompt:($colors.green),pointer:($colors.green),marker:($colors.blue),spinner:($colors.blue),preview-fg:($colors.blue)
    --height=10
    --info=inline-right
    --no-scrollbar
    --pointer=''
    --preview-window=down,1,border-none
    --prompt=' '
    --reverse
    --bind='ctrl-j:pos\(1\)+accept'
    --bind='ctrl-k:pos\(2\)+accept'
    --bind='ctrl-l:pos\(3\)+accept'
"

