let $colors = (open "~/.config/colors/colors.json")

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
        $"(ansi { fg: $color, bg: $colors.base })",
        $"(ansi { fg: $colors.base, bg: $color })($icon) ",
        $"(ansi { fg: $color, bg: $colors.surface0 }) "
        $"(ansi { fg: $colors.text, attr: b })($content) ",
        $"(ansi { fg: $colors.surface0, bg: $colors.base })"
    ]
    $bubble | str join ""
}

def right_bubble [content, color, icon] {
    let bubble = [
        $"(ansi { fg: $colors.surface0, bg: $colors.base })",
        $"(ansi { fg: $colors.text, bg: $colors.surface0 }) ",
        $"($content) ",
        $"(ansi { fg: $color, bg: $colors.surface0 })"
        $"(ansi { fg: $colors.surface0, bg: $color }) ($icon) "
        $"(ansi { fg: $color, bg: $colors.base })"
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
        right_bubble $ahead_behind $colors.peach 
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
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
