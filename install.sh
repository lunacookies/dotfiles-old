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
if [ ! -e $HOME/dotfiles ]; then
  git clone -q https://github.com/aramisgithub/dotfiles.git ~/dotfiles
fi

cd ~/dotfiles


##
## Install software
##

# Install and update brew packages
./brew.sh

# Install Fira Mono with Text Figures
git clone --depth=1 -q https://github.com/aramisgithub/FiraMono_Text_Figures.git ~/fonttmp
rm -rf ~/fonttmp/.git
cp ~/fonttmp/*ttf ~/Library/Fonts/
rm -rf ~/fonttmp

# Install fast-syntax-highlighting for zsh
if [ -e $HOME/dotfiles/xdg/f-sy-h ]; then
  rm -rf ~/dotfiles/xdg/f-sy-h
fi
git clone --depth=1 -q https://github.com/zdharma/fast-syntax-highlighting.git ~/dotfiles/xdg/f-sy-h
rm -rf ~/dotfiles/xdg/f-sy-h/.git*


##
## Set up dotfiles
##

# Symlink all configuration
./stow.sh

# Set settings
./macos

