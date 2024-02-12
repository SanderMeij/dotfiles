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
