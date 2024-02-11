#!/bin/zsh

# Use Neovim as default text editor
export VISUAL=nvim
export EDITOR=$VISUAL

# Use Neovim for manuals
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# Fzf options
export FZF_DEFAULT_OPTS="--height=10 --reverse --prompt=' ' --pointer='' --info=inline-right --border --no-scrollbar --preview-window=down,1,border-none --color=bg:-1,bg+:-1,fg:-1,hl:#e5c07b,fg+:#98c379,hl+:#e5c07b,info:#61afef,prompt:#98c379,pointer:#98c379,marker:#61afef,spinner:#61afef,preview-fg:#61afef"

PATH=$(composer global config bin-dir --absolute --quiet):$PATH
