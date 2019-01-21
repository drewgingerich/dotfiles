#!/usr/bin/env bash

set -e

# turn off chime at system boot
sudo nvram SystemAudioVolume=%01

osascript -e ‘tell application “Finder” to set desktop picture to POSIX file "/Users/$USER/configs/macOS/system/desktopPicture.jpg"’

dscl . delete "/Users/$USER" jpegphoto
dscl . delete "/Users/$USER" Picture
dscl . create "/Users/$USER" Picture "/Users/$USER/configs/macOS/system/userPicture.png"
