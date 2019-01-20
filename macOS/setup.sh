#!/usr/bin/env bash

# Paranoid mode. Exit on error.
set -e

# Create file to keep track of things that still need to happen after this script runs.
TODO=~/todo.txt
touch "$TODO"
DOTFILES=~/Data/archive/Life/dotfiles

# Install Command Line Tools. Automatically accept popup window.
xcode-select --install
sleep 5
osascript <<EOD
  tell application "System Events"
    tell process "Install Command Line Developer Tools"
      keystroke return
      click button "Agree" of window "License Agreement"
    end tell
  end tell
EOD

# Brew install.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade
brew bundle
echo "Install Aseprite" >> "$TODO"
echo "Install Audacity" >> "$TODO"
echo "Install Ableton Live" >> "$TODO"

# Configure the world.
ln -sf $DOTFILES/config/karabiner.json ~/.config/karabiner/karabiner.json
ln -sf $DOTFILES/config/.slate.js ~/.slate.js
ln -sf $DOTFILES/config/.bashrc ~/.bashrc
ln -sf $DOTFILES/config/.emacs.d ~/.emacs.d
ln -sf $DOTFILES/config/.spacemacs ~/.spacemacs
ln -sf $DOTFILES/config/.omnisharp ~/.omnisharp
ln -sf $DOTFILES/config/VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf $DOTFILES/config/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf $DOTFILES/config/VSCode/snippets ~/Library/Application\ Support/Code/User/snippets

code --install-extension ms-python.python
code --install-extension ms-vscode.csharp
code --install-extension PKief.material-icon-theme
code --install-extension Unity.unity-debug
code --install-extension vscodevim.vim
code --install-extension zhuangtongfa.Material-theme

# turn off chime at system boot
sudo nvram SystemAudioVolume=%01
