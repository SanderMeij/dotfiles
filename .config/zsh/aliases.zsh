#!/bin/zsh

alias watch='find . | entr "!!"';
alias ls="eza -a --icons";
alias ll="eza -al --icons";
alias lt="eza -a --tree --icons";

alias vi=nvim
alias ts=tmux-session

alias chrome-cors="open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir='/tmp/chrome_dev_test' --disable-web-security"
