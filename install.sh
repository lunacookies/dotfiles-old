#!/usr/bin/env bash

##
## Basic pre-requisites
##

# If homebrew is not installed then install it
if ! type "brew" > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# If git from homebrew is not installed then install it
if [ ! -e /usr/local/bin/git ]; then
  brew install git
fi


##
## Download dotfiles
##

# If dotfiles directory does not exist then clone it
if [ ! -e $HOME/dotfiles ]
  git clone https://github.com/aramisgithub/dotfiles.git ~/dotfiles
fi

cd ~/dotfiles


##
## Install software
##

# Install and update brew packages
./brew.sh

# Install Fira Mono with Text Figures
git clone https://github.com/aramisgithub/FiraMono_Text_Figures.git ~/fonttmp
cd ~/fonttmp
rm -rf .git
cp *ttf ~/Library/Fonts/
rm -rf ~/fonttmp


##
## Set up dotfiles
##

# Symlink all configuration
./stow.sh

# Set settings
./macos

