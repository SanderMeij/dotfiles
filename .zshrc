[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "$HOME/.config/sh/options.sh"
plug "$HOME/.config/sh/functions.sh"
plug "$HOME/.config/sh/tmux-session.sh"
plug "$HOME/.config/sh/aliases.sh"

plug "zsh-users/zsh-autosuggestions"
plug "voronkovich/symfony-complete.plugin.zsh"

plug "$HOME/.config/zsh/completion.zsh"
plug "$HOME/.config/zsh/prompt.zsh"
plug "$HOME/.config/zsh/hooks.zsh"
plug "$HOME/.config/zsh/keymaps.zsh"
plug "$HOME/.config/zsh/vi-mode.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plug "zsh-users/zsh-syntax-highlighting"

 export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

bindkey '^ ' fzf-cd-widget
