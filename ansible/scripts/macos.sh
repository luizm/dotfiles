#!/bin/bash

# Used https://github.com/mathiasbynens/dotfiles/blob/master/.macos as example.

# Keyboard
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write com.apple.keyboard.fnState -bool true

# InterfaceSytle
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
defaults write com.apple.menuextra.battery ShowPercent -bool true
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -bool true

# Dock
defaults write com.apple.dock tilesize -int 50
defaults write com.apple.dock largesize -int 61
defaults write com.apple.dock launchanim -bool true

# Restart Apps
for app in "Activity Monitor" \
	"cfprefsd" \
	"Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "${app}" &>/dev/null
done
