#!/bin/zsh

function chpwd() {
    emulate -L zsh
    ls -a
}

precmd() {
    precmd() {
        echo
    }
}

preexec() {
    echo -ne '\e[5 q' # Use beam shape cursor for each new prompt.

    fre --add "$1" --store "$HOME/.local/share/zsh/history$PWD/history.json"
}
