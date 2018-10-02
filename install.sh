#!/usr/bin/env bash

##
## Homebrew
##

# If homebrew is not installed then install it
if ! type "brew" > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


##
## Download dotfiles
##

# If dotfiles directory does not exist then clone it
if [ ! -e $HOME/dotfiles ]; then
  git clone https://github.com/arzg/dotfiles.git ~/dotfiles
fi

cd ~/dotfiles


##
## Set up dotfiles
##

# We do these things before the mass software installation becaus some parts of
# packages.sh depend on configuration that is linked in link.sh

# Symlink all configuration
./link.sh

# Set settings
./macos

##
## Install software
##

# Install and update packages
./packages.sh

