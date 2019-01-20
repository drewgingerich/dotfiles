#!/usr/bin/env bash

set -e

DOTFILES=~/configs/macOS

ln -sf $DOTFILES/karabiner-elements/karabiner.json ~/.config/karabiner/karabiner.json
ln -sf $DOTFILES/slate/.slate.js ~/.slate.js
ln -sf $DOTFILES/bash/.bashrc ~/.bashrc
ln -sf $DOTFILES/emacs/.emacs.d ~/.emacs.d
ln -sf $DOTFILES/emacs/.spacemacs ~/.spacemacs
ln -sf $DOTFILES/omnisharp/.omnisharp ~/.omnisharp
ln -sf $DOTFILES/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf $DOTFILES/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf $DOTFILES/vscode/snippets ~/Library/Application\ Support/Code/User/snippets
