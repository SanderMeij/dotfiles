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

tmux-session() {
    fre_directories=$(fre --sorted --store_name "tmux_session_history.json")
    all_directories=$(find ~ ~/Workspace -mindepth 1 -maxdepth 1 -type d -not -path "$fre_directories")

    directories=("${(@)fre_directories}\n${(@)all_directories}")
    selected=$(echo "${directories[@]}" | awk '!seen[$0]++' | fzf --no-sort --query="$1" --select-1 --border=none --border-label="Select workspace" --preview='session=$(tmux list-sessions | grep $(basename {} | tr . _)); echo "${session:-No session running, press enter to create a new session}"')

    if [[ -z $selected ]]; then
        return 0
    fi

    fre --add "$selected" --store_name "tmux_session_history.json"

    selected_name=$(basename "$selected" | tr . _)

    if [[ $TMUX ]]; then
        if ! tmux has-session -t=$selected_name 2> /dev/null; then
            tmux new-session -ds $selected_name -c $selected
        fi
        tmux switch-client -t $selected_name
    else
        tmux new-session -A -s $selected_name -c $selected
    fi
    exit 0
}
