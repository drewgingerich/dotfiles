#!/usr/bin/env bash

# Paranoid mode. Exit on error.
set -e

# Create file to keep track of things that still need to happen after this script runs.
TODO=~/todo.txt

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

# Install Brew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade
brew bundle
echo "Install Aseprite" >> "$TODO"
echo "Install Audacity" >> "$TODO"
echo "Install Ableton Live" >> "$TODO"
