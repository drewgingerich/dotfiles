#!/bin/bash

set -e

# Get rid of the dock. Actually makes dock not appear for a long time
defaults write com.apple.dock autohide-delay -int 10

# Makes the dock appear and disappear instantly.
# Unneeded due to above, but may as well set it to remember it.
defaults write com.apple.dock autohide-time-modifier -int 0

# Restart dock to apply settings
killall Dock
