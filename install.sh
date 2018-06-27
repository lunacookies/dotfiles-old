#!/usr/bin/env bash

# If homebrew is not installed then install it
if ! type "brew" > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# If git from homebrew is not installed then install it
if [ ! -e /usr/local/bin/git ]; then
  brew install git
fi

# If dotfiles directory does not exist then clone it
if [ -e $HOME/dotfiles ] && [ -e $HOME/.config ] && [ -e $HOME/bin ]; then
  echo "Remove or back up your existing configuration files"
  sleep 1
  echo "Exiting script..."
  exit 1
else
  /usr/local/bin/git clone https://github.com/aramisgithub/dotfiles.git ~/dotfiles
fi

cd ~/dotfiles

# Install and update packages
./packages.sh

# Symlink all configuration
./stow.sh

# Set settings
./macos

