#!/bin/zsh

alias watch='find . | entr "!!"';
alias ls="exa -a --icons";
alias ll="exa -al --icons";
alias lt="exa -a --tree --icons";

alias vi=edit
alias ts=tmux-session

alias chrome-cors="open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir='/tmp/chrome_dev_test' --disable-web-security"
