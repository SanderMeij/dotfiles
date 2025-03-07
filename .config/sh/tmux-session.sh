#!/bin/sh

export FZF_DEFAULT_OPTS="--height=10 --reverse --prompt=' ' --pointer='' --info=inline-right --border=rounded --no-scrollbar --preview-window=down,1,border-none --color=bg:-1,bg+:-1,fg:-1,hl:#e5c07b,fg+:#98c379,hl+:#e5c07b,info:#61afef,prompt:#98c379,pointer:#98c379,marker:#61afef,spinner:#61afef,preview-fg:#61afef"

tmux_session() {
    recent_directories=$(~/.cargo/bin/fre --sorted --store_name "tmux_session_history.json" --sort_method "recent")
    active_directories=$(tmux list-sessions -f "#{?session_attached,0,1}" -F "#{session_name}")
    sorted_active_directories=$(grep -F -f <(echo $active_directories | tr ' ' '\n') <(echo "$recent_directories"))

    # frecent_directories=$(~/.cargo/bin/fre --sorted --store_name "tmux_session_history.json")
    # all_directories=("$sorted_active_directories $frecent_directories")
    all_directories=$sorted_active_directories

    for i in {2..5}; do
        new_directories=$(find ~ -mindepth $i -maxdepth $i -type d -name ".git" -not -path '*/.*/*' -not -path "$all_directories" -exec dirname {} \;)
        all_directories=("${all_directories}\n${new_directories}")
    done
    selected=$(echo "${all_directories@E}" | sed "s|^$HOME|~|" | awk '!seen[$0]++' | fzf --no-sort --query="$1" --select-1 --border-label="Select workspace" --preview='session=$(tmux list-sessions | grep $(basename {} | tr . _)); echo "${session:-No session running, press enter to create a new session}"')

    if [[ -z $selected ]]; then
        return 0
    fi

    ~/.cargo/bin/fre --add "$selected" --store_name "tmux_session_history.json"

    selected_name=$selected
    selected=$(echo $selected | sed "s|~|$HOME|")

    if [[ $TMUX ]]; then
        # tmux kill-session -t "_wp"
        # chmod +x $selected/attach.sh
        # tmux new-session -ds "_wp" -c $selected $selected/attach.sh
        if ! tmux has-session -t=$selected_name 2> /dev/null; then
            tmux new-session -ds $selected_name -c $selected
        fi
        tmux switch-client -t $selected_name
        exit 0
    else
        tmux new-session -A -s $selected_name -c $selected
    fi
}

