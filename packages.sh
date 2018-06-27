#!/usr/bin/env bash

# Get me into the dotfiles folder
cd ~/dotfiles

# Update brew packages
brew upgrade
brew update

# Install all packages
./brew.sh
bundle install
pip3 install -r Pipfile

# Clean up if neccessary
brew cleanup
brew prune
brew doctor

# Manually download Fira Mono with Text Figures
git clone https://github.com/aramisgithub/FiraMono_Text_Figures.git ~/fonttmp
cd ~/fonttmp
rm -rf .git

# Copy font files
cp *ttf ~/Library/Fonts/

# Clean up
cd ~
rm fonttmp
cd ~/dotfiles

