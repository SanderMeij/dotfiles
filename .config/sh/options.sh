#!/bin/sh

export PATH=$PATH:/opt/homebrew/bin

# Use Neovim as default text editor
export VISUAL=nvim
export EDITOR=$VISUAL

# Use Neovim for manuals
export MANPAGER='nvim +Man!'
export MANWIDTH=999

PATH=$(composer global config bin-dir --absolute --quiet):$PATH
