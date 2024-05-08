dir=$(find . -name .git -type d -prune -exec dirname {} \; | fzf);

if [ $? -eq 0 ]; then
    tmux new-window -c $dir -n $(basename $dir)
fi
