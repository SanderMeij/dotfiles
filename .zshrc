[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "$HOME/.config/zsh/options.zsh"
plug "$HOME/.config/zsh/prompt.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "voronkovich/symfony-complete.plugin.zsh"
plug "$HOME/.config/zsh/completion.zsh"
plug "Aloxaf/fzf-tab"

# plug "larkery/zsh-histdb"
# autoload -Uz add-zsh-hook

plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/functions.zsh"
plug "$HOME/.config/zsh/tmux-session.zsh"
plug "$HOME/.config/zsh/hooks.zsh"
plug "$HOME/.config/zsh/keymaps.zsh"
plug "$HOME/.config/zsh/vi-mode.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plug "zsh-users/zsh-syntax-highlighting"
