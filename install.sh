#!/usr/bin/env bash

# If homebrew is not installed then install it
if ! type "brew" > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# If dotfiles directory does not exist then clone it
if [ ! -e $HOME/dotfiles ]; then
  git clone https://github.com/arzg/dotfiles.git ~/dotfiles
fi

cd ~/dotfiles

# Symlink all configuration
./link.sh

# Make sure to source bashrc because some programs that are added to the PATH
# by it are needed for macos and packages.sh
source $HOME/.bashrc

# Set settings
./macos

# Install and update packages
./packages.sh
