#!/bin/zsh

# Vim mode
bindkey -v

bindkey '^ ' autosuggest-accept

clear-terminal() { tput reset; zle redisplay; }
zle -N clear-terminal
bindkey '^g' clear-terminal
