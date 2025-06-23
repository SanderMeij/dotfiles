#!/bin/bash

source ~/.config/bash/fzf-options.sh

content="$(tmux capture-pane -J -p -e |sed -r 's/\x1B\[[0-9;]*[mK]//g'))"
urls=$(echo "$content" |grep -oE '(https?|ftp|file):/?//[-A-Za-z0-9+&@#/%?=~_|!:,.;]*[-A-Za-z0-9+&@#/%=~_|]')
wwws=$(echo "$content" |grep -oE '(http?s://)?www\.[a-zA-Z](-?[a-zA-Z0-9])+\.[a-zA-Z]{2,}(/\S+)*' | grep -vE '^https?://' |sed 's/^\(.*\)$/http:\/\/\1/')
ips=$(echo "$content" |grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}(:[0-9]{1,5})?(/\S+)*' |sed 's/^\(.*\)$/http:\/\/\1/')
gits=$(echo "$content" |grep -oE '(ssh://)?git@\S*' | sed 's/:/\//g' | sed 's/^\(ssh\/\/\/\)\{0,1\}git@\(.*\)$/https:\/\/\2/')
gh=$(echo "$content" |grep -oE "['\"]([_A-Za-z0-9-]*/[_.A-Za-z0-9-]*)['\"]" | sed "s/['\"]//g" | sed 's#.#https://github.com/&#')
items=$(printf '%s\n' "${urls[@]}" "${wwws[@]}" "${gh[@]}" "${ips[@]}" "${gits[@]}" |
    grep -v '^$' |
    sort -u
)
[ -z "$items" ] && tmux display 'No URLs found' && exit
echo "$items"
exit

# tmux popup "xdg-open $(fzf <<< \"$items\")"
# tmux popup "xdg-open https://google.com"

fzf <<< "$items" | awk '{print $2}' | while read -r chosen; do
    echo "Opening url $chosen" >> ~/.log
      export DISPLAY=\${DISPLAY:-:0}
      export WAYLAND_DISPLAY=\$WAYLAND_DISPLAY
      export XDG_RUNTIME_DIR=\$XDG_RUNTIME_DIR
      export XAUTHORITY=\$XAUTHORITY
    xdg-open "$chosen" >> ~/.log
done
exit
