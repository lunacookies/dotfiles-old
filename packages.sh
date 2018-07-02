#!/usr/bin/env bash

# Get me into the dotfiles folder
cd ~/dotfiles


##
## Update
##

# Update brew itself
brew update
# Update brew packages
brew upgrade

# Update ruby packages (this includes bundler itself)
bundler update

# We now remove libyaml (a ruby dependency) temporarily because it conflicts
# with PyYAML (required by vim-vint) during install. We install it again after
# vim-vint has been installed.
brew uninstall --ignore-dependencies libyaml
# Update pip (and related software)
pip3 install --upgrade setuptools wheel pip
# Update all pip packages
pip3 freeze --local > tmp
pip3 install --user --install-option="--prefix=" -r tmp --upgrade
rm tmp


##
## Install
##

# Install all brew and ruby packages
./brew.sh
bundle install

# Uninstall libyaml in case it was just installed (from brew.sh)
brew uninstall --ignore-dependencies libyaml
# Install all pip packages
pip3 install --user --install-option="--prefix=" -r Pipfile
# Reinstate libyaml from before
brew install libyaml


##
## Clean up
##

# Clean up as necessary
brew cleanup
brew prune
brew doctor


##
## Install Fira Mono with Text Figures
##

# Manually download Fira Mono with Text Figures
git clone https://github.com/aramisgithub/FiraMono_Text_Figures.git ~/fonttmp
cd ~/fonttmp
rm -rf .git

# Copy font files
cp *ttf ~/Library/Fonts/

# Clean up
cd ~
rm -rf fonttmp
cd ~/dotfiles

