#!/bin/zsh

edit() {
    if [[ $# -eq 0 ]]; then
        command nvim .
    else
        command nvim "$@"
    fi
}

fcd() {
    cd "$(find . -type d | fzf)"
}

openb() {
    open $1 -a "Opera" || open $1 -a "Google Chrome" || open $1 -a "Safari"
}

json-sort() {
    jq 'walk(if type == "object" then to_entries | sort_by(.key) | from_entries else . end)' --indent 4 $1
}

json-expand() {
    jq 'to_entries | map(setpath(["tmp"] + (.key | split(".")); .value)) | map(.tmp) | reduce .[] as $item ({}; . * $item)' --indent 4 $1
}

fre_dirstat() {
    fre --stat --store "$HOME/.local/share/zsh/history$PWD/history.json"
}
