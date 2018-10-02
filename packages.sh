#!/usr/bin/env bash

# Get me into the dotfiles folder
cd ~/dotfiles


##
## Brew
##

brew update                 # Update brew itself
brew bundle cleanup --force # Remove anything not present in the Brewfile
brew bundle                 # Install and update everything from the Brewfile
brew upgrade                # Update any dependencies of formulae

# Clean up as necessary
brew cleanup                # Delete caches
brew cleanup                # Delete cask caches
brew prune                  # Remove unused symlinks
brew doctor                 # Check if anything is broken


##
## Gems
##

gem update                  # Update all gems
gem install neovim          # Install the only global gem we want -- Neovim


##
## Install Fira Mono with Text Figures
##

fonturl=https://github.com/arzg/FiraMono_Text_Figures.git

# Download the fonts
git clone --depth=1 -q $fonturl ~/fonttmp

# Copy them to the user's font directory
cp ~/fonttmp/*ttf ~/Library/Fonts/

# Clean up
rm -rf ~/fonttmp

