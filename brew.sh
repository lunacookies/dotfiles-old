#!/usr/bin/env bash

##
## Update
##

# We update first in case brew handles the later installation differently

# Update brew itself
brew update
# Update brew packages
brew upgrade


##
## Install
##

brew tap caskroom/fonts
brew tap crisidev/homebrew-chunkwm
brew tap koekeishiya/formulae

brew install bash
brew install chunkwm
brew install ctags
brew install exa
brew install fd
brew install git
brew install khd
brew install neovim
brew install pandoc
brew install ranger
brew install rg
brew install rmtrash
brew install shellcheck
brew install stow
brew install the_silver_searcher
brew install wget
brew install zsh

brew cask install adobe-acrobat-reader
brew cask install alfred
brew cask install android-file-transfer
brew cask install appcleaner
brew cask install flux
brew cask install font-fira-sans
brew cask install font-m-plus
brew cask install google-backup-and-sync
brew cask install google-chrome
brew cask install liteicon
brew cask install mactex
brew cask install macvim
brew cask install mpv
brew cask install soundflower
brew cask install soundflowerbed


##
## Clean up
##

# Clean up and tell us about any problems we may have caused
brew cleanup
brew prune
brew doctor

