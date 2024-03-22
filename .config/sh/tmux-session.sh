#!/bin/sh

export FZF_DEFAULT_OPTS="--height=10 --reverse --prompt=' ' --pointer='' --info=inline-right --border=rounded --no-scrollbar --preview-window=down,1,border-none --color=bg:-1,bg+:-1,fg:-1,hl:#e5c07b,fg+:#98c379,hl+:#e5c07b,info:#61afef,prompt:#98c379,pointer:#98c379,marker:#61afef,spinner:#61afef,preview-fg:#61afef"

tmux_session() {
    fre_directories=$(fre --sorted --store_name "tmux_session_history.json")
    all_directories=$(find ~ ~/Workspace -mindepth 1 -maxdepth 1 -type d -not -path "$fre_directories")

    directories=("${fre_directories}\n${all_directories}")
    selected=$(echo "${directories[@]}" | awk '!seen[$0]++' | fzf --no-sort --query="$1" --select-1 --border-label="Select workspace" --preview='session=$(tmux list-sessions | grep $(basename {} | tr . _)); echo "${session:-No session running, press enter to create a new session}"')

    if [[ -z $selected ]]; then
        return 0
    fi

    fre --add "$selected" --store_name "tmux_session_history.json"

    selected_name=$(basename "$selected" | tr . _)

    watson start "$selected_name" > /dev/null

    if [[ $TMUX ]]; then
        tmux kill-session -t "_wp"
        chmod +x $selected/attach.sh
        tmux new-session -ds "_wp" -c $selected $selected/attach.sh
        if ! tmux has-session -t=$selected_name 2> /dev/null; then
            tmux new-session -ds $selected_name -c $selected
        fi
        tmux switch-client -t $selected_name
        exit 0
    else
        tmux new-session -A -s $selected_name -c $selected
    fi
}

