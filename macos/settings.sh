#!/usr/bin/env bash

set -e

echo 'Starting macOS Configuration'
osascript -e 'tell application "System Preferences" to quit'

# --- System configuration ---

# Disable startup sound
sudo nvram SystemAudioVolume=%01

# --- Dock configuration ---

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Dock icons size
defaults write com.apple.dock tilesize -int 46

# Dock size and location
defaults write com.apple.Dock size-immutable -bool yes # to remove this option run: defaults delete com.apple.Dock size-immutable

# Disable quick note
defaults write com.apple.dock wvous-br-corner -int 0

# --- Finder configuration ---

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Show Finder path bar
defaults write com.apple.finder ShowPathbar -bool true

# Do not show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool false

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Show Library folder
chflags nohidden ~/Library

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Expand the following File Info panes:
# "General", "Open with", and "Sharing & Permissions"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# --- AppStore configuration ---

# Disable in-app rating requests from apps downloaded from the App Store
defaults write com.apple.appstore InAppReviewEnabled -int 0

# --- Maccy configuration
# https://github.com/p0deje/Maccy

# History size
defaults write org.p0deje.Maccy historySize 20

# --- Safari configuration ---

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Improve Safari security
defaults write com.apple.Safari \
	com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled \
	-bool false
defaults write com.apple.Safari \
	com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles \
	-bool false

# --- Text editing configuration ---

# Disable autocorrect
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# --- Activity Monitor configuration ---

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# --- GnuPG configuration ---

# Disable keychain for GnuPG
defaults write org.gpgtools.common DisableKeychain -bool yes
defaults write org.gpgtools.common DisableKeychain -bool yes

# Restarting apps
echo 'Restarting apps...'
killall Finder
killall Dock

echo 'Done!'
