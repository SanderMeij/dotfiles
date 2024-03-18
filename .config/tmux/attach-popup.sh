session_path=$(tmux display-message -p '#{session_path}')
nvim -u ~/.config/nvim/popup.lua "${session_path}/attach.sh"
