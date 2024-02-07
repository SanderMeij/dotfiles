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

# Link iterm2 config
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
