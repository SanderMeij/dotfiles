start=`gdate +%N`
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zap-prompt"

autoload -Uz compinit
compinit

plug "Aloxaf/fzf-tab"
plug "voronkovich/symfony-complete.plugin.zsh"

source ~/.config/zsh/main.zsh;

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load and initialise completion system
# compdef _symfony_complete symfony
# compdef _symfony_complete composer
# compdef _symfony_complete console

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

end=`gdate +%N`
echo Execution time was `expr $end / 1000000 - $start / 1000000` milliseconds.
