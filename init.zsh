# Install brew packages
xargs brew install < brew_leaves

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install Zap
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

# Symlink to home directory
stow --adopt .

# Install Jetbrains font
cp ./.config/fonts/* ~/Library/Fonts/

watson config options.stop_on_start true
