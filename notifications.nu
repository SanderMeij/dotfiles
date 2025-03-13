let $colors = (open $"($env.HOME)/.config/colors/colors.json")
let $icons = {
    js: '󰌞',
    message: '󰍡',
    sass: '',
    symfony: '',
}

def format [values] {
    let type = ($values | get type)
    let color = $colors | get $"($values | get color)"
    let icon = $icons | get $"($values | get type)"
    let message = $"($values | get message)"
    echo $"#[fg=($colors.gray2)]#[fg=($colors.text),bg=($colors.gray2)] ($message) #[fg=($color)]#[fg=($colors.gray2),bg=($color)] ($icon) #[fg=($color),bg=($colors.background)]"
}

let file = ($nu.home-path | append '/.tmux/notifications.sqlite' | str join "")
open $file | query db "SELECT * FROM notifications WHERE updated_at > Datetime('now', '-5 seconds')" | each {|| format $in } | str join " "
