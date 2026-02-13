#!/usr/bin/env sh

if [ "$(id -u)" -eq 0 ]; then
  printf "Error: this script should not be run with root privileges.\n" >&2
  exit 1
fi

# set user umask
umask 077

# increase keyboard repeat rate
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1

# always show dot (hidden) files
defaults write com.apple.finder AppleShowAllFiles -boolean true

# decrease animation time for dock
defaults write com.apple.dock autohide-time-modifier -float 0.15
defaults write com.apple.dock autohide-delay -int 0

killall Finder
killall Dock
