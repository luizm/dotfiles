#!/usr/bin/env bash
# Used https://github.com/mathiasbynens/dotfiles/blob/master/.macos as example.

# Keyboard
defaults write ApplePressAndHoldEnabled -bool false
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
defaults write com.apple.dock magnification -bool True
defaults write com.apple.dock largesize -float 58.000000

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -int 1

# Restart Apps
for app in "Activity Monitor" \
	"cfprefsd" \
	"Dock" \
	"Finder" \
	"SystemUIServer";
	killall $app &>/dev/null
end
