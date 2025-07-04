#!/usr/bin/env sh

# set more secure umask for user
sudo launchctl config user umask 077

# increase keyboard repeat rate
sudo defaults write -g InitialKeyRepeat -int 15
sudo defaults write -g KeyRepeat -int 1

# always show dot (hidden) files
sudo defaults write com.apple.finder AppleShowAllFiles -boolean true

# decrease animation time for dock
sudo defaults write com.apple.dock autohide-time-modifier -float 0.15
sudo defaults write com.apple.dock autohide-delay -int 0
