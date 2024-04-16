let $colors = (open "~/.config/colors/colors.json")
let $icons = {
    js: '󰌞',
    message: '󰍡',
    sass: '',
}

def format [values] {
    let type = ($values | get type)
    let color = $colors | get $"($values | get color)"
    let icon = $icons | get $"($values | get type)"
    let message = $"($values | get message)"
    echo $"#[fg=($colors.surface0)]#[fg=($colors.text),bg=($colors.surface0)] ($message) #[fg=($color)]#[fg=($colors.surface0),bg=($color)] ($icon) #[fg=($color),bg=($colors.background)]"
}

let file = ($nu.home-path | append '/.tmux/notifications.sqlite' | str join "")
open $file | query db "SELECT * FROM notifications WHERE updated_at > Datetime('now', '-5 seconds')" | each {|| format $in } | str join " "
