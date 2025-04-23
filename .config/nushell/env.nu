let $colors = (open $"($env.HOME)/.config/colors/colors.json")

def create_left_prompt [] {
    mut home = $nu.home-path
    mut indicator = "~>"
    let session_path = (tmux display-message -p '#{session_path}')
    if $session_path != "" {
        $home = $session_path
        $indicator = "->"
    }

    let dir = (
        if ($env.PWD | path split | zip ($home | path split) | all { $in.0 == $in.1 }) {
            ($env.PWD | str replace $home $indicator)
        } else {
            $env.PWD
        }
    )

    if $env.LAST_EXIT_CODE != 0 {
        left_bubble $dir $colors.red 
    } else if ("bin/console" | path exists) {
        left_bubble $dir $colors.blue 
    } else if (".git" | path exists) {
        left_bubble $dir $colors.blue 
    } else {
        left_bubble $dir $colors.blue 
    }
}

def left_bubble [content, color, icon] {
    let bubble = [
        $"(ansi { fg: $color, bg: $colors.gray1 })",
        $"(ansi { fg: $colors.gray1, bg: $color })($icon) ",
        $"(ansi { fg: $color, bg: $colors.gray2 }) "
        $"(ansi { fg: $colors.white, attr: b })($content) ",
        $"(ansi { fg: $colors.gray2, bg: $colors.gray1})"
    ]
    $bubble | str join ""
}

def right_bubble [content, color, icon] {
    let bubble = [
        $"(ansi { fg: $colors.gray2, bg: $colors.gray1 })",
        $"(ansi { fg: $colors.white, bg: $colors.gray2 }) ",
        $"($content) ",
        $"(ansi { fg: $color, bg: $colors.gray2 })"
        $"(ansi { fg: $colors.gray2, bg: $color }) ($icon) "
        $"(ansi { fg: $color, bg: $colors.gray1 })"
    ]
    $bubble | str join ""
}

def modified_bubble [gstat] {
    let modified = $gstat.wt_untracked + $gstat.wt_modified + $gstat.wt_deleted + $gstat.wt_type_changed + $gstat.wt_renamed
    if $modified > 0 { 
        right_bubble $modified $colors.green 
    } 
}

def staged_bubble [gstat] {
    let staged = $gstat.idx_added_staged + $gstat.idx_modified_staged + $gstat.idx_deleted_staged + $gstat.idx_renamed + $gstat.idx_type_changed
    if $staged > 0 {
        right_bubble $staged $colors.yellow 
    }
}

def ahead_behind_bubble [gstat] {
    if $gstat.ahead > 0 or $gstat.behind > 0 {
        let ahead_behind = $"($gstat.ahead) | ($gstat.behind)"
        right_bubble $ahead_behind $colors.orange 
    }
}

def create_right_prompt [] {
    let gstat = (gstat)
    if $gstat.repo_name != "no_repository" {
        let prompt = [
            $"(modified_bubble $gstat)",
            $"(staged_bubble $gstat)",
            $"(ahead_behind_bubble $gstat)",
            $"(right_bubble $gstat.branch $colors.blue )"
        ]
        
        $prompt | filter {|x| $x != ""} | str join " "
    }
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
# FIXME: This default is not implemented in rust code as of 2023-09-08.
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| " " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| " " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| " " }
$env.PROMPT_MULTILINE_INDICATOR = {|| " " }

# If you want previously entered commands to have a different prompt from the usual one,
# you can uncomment one or more of the following lines.
# This can be useful if you have a 2-line prompt and it's taking up a lot of space
# because every command entered takes up 2 lines instead of 1. You can then uncomment
# the line below so that previously entered commands show with a single `🚀`.
$env.TRANSIENT_PROMPT_COMMAND = {|| "" }
$env.TRANSIENT_PROMPT_INDICATOR = {|| "" }
$env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| "" }
$env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| "" }
$env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "" }
$env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| "" }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
$env.PATH = ($env.PATH | split row (char esep) | prepend '/usr/local/bin')

$env.TMUX_NOTIFICATIONS = ($nu.home-path | append '/.tmux/notifications.sqlite' | str join "")

open ~/.env | from toml | load-env

def notify [ message, type = "message", color = "yellow" ] {
    let query = $"INSERT INTO notifications VALUES \('($type)', '($message)', '($color)', DateTime\('now'\)\) ON CONFLICT(type) DO UPDATE SET message='($message)', color='($color)', updated_at=DateTime\('now'\)"
    open $env.TMUX_NOTIFICATIONS | query db $query
    tmux refresh-client -S
}

def clear_notifications [] {
    try {
        rm $env.TMUX_NOTIFICATIONS
    }
    stor reset
    stor export --file-name $env.TMUX_NOTIFICATIONS
    open $env.TMUX_NOTIFICATIONS | query db "CREATE TABLE notifications (type TEXT NOT NULL UNIQUE, message TEXT, color TEXT, updated_at DATETIME)"
}

def change-php [version:string] {
    sudo update-alternatives --set php ("/usr/bin/php" + $version)
}

def paydia [ action: string ] {
    cd /var/www/docker/local-services
    make ("all-" + $action)
}

def gitlab-feed [ url: string ] {
    let articles = (http get $url | from xml | get content | where tag == entry | get content | each {|$article| {
        id: ($article | where tag == id | first | get content.content | first)
        title: ($article | where tag == title | first | get content.content | first)
        link: ($article | where tag == link | first | get attributes.href)}})
    $articles | each {|$article| notify-send $article.title --action="Open" $article.link --expire-time=5000}
}

def show [ command: string ] {
    script -q -c $command /dev/null | less -R
}

def dodo [ ...command: string ] {
    docker exec -it $env.DOCKER_CONTAINER /bin/sh -c ($command | str join ' ')
}

$env.PATH = ($env.PATH | prepend "/home/sander/.local/share/fnm")
load-env (fnm env --shell bash | lines | str replace 'export ' '' | str replace -a '"' '' | split column '=' | rename name value | where name != "FNM_ARCH" and name != "PATH" | reduce -f {} {|it, acc| $acc | upsert $it.name $it.value })
$env.PATH = ($env.PATH | prepend $"($env.FNM_MULTISHELL_PATH)/bin")

$env.PATH = ($env.path | prepend "~/bin")
$env.PATH = ($env.path | prepend "~/.cargo/bin")
$env.DIRENV_LOG_FORMAT = ""
