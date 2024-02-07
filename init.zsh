# Install brew packages
xargs brew install < brew_leaves

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Symlink to home directory
stow --adopt .

# Install Jetbrains font
cp ./JetBrainsMonoNerdFont-Regular.ttf ~/Library/Fonts/JetBrainsMonoNerdFont-Regular.ttf 

# Link iterm2 config
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
