#!/bin/bash

# Paranoid mode. Exit on error.
set -e

# Create file to keep track of things that still need to happen after
# this script runs.
touch ~/todo.txt

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
brew bundle

# Configure the world.

# turn off chime at system boot
sudo nvram SystemAudioVolume=%01
