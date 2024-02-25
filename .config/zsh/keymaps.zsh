#!/bin/zsh

# Vim mode
bindkey -v

bindkey '^E' autosuggest-execute

clear-terminal() {
    tput reset; zle redisplay;
}
zle -N clear-terminal
bindkey '^g' clear-terminal

go-up() {
    function chpwd() {
        function chpwd() {
            emulate -L zsh
            ls -a
        }
    }
    cd ..
    zle reset-prompt
}
zle -N go-up

bindkey '^U' go-up
