#!/usr/bin/env bash

set -e

# turn off chime at system boot
sudo nvram SystemAudioVolume=%01
