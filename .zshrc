start=`gdate +%N`

[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "$HOME/.config/zsh/options.zsh"
plug "$HOME/.config/zsh/prompt.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "voronkovich/symfony-complete.plugin.zsh"

plug "$HOME/.config/zsh/completion.zsh"

plug "Aloxaf/fzf-tab"

plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/functions.zsh"
plug "$HOME/.config/zsh/hooks.zsh"
plug "$HOME/.config/zsh/keymaps.zsh"
plug "$HOME/.config/zsh/vi-mode.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

plug "zsh-users/zsh-syntax-highlighting"

end=`gdate +%N`
echo Execution time was `expr $end / 1000000 - $start / 1000000` milliseconds.
