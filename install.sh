#!/usr/bin/env bash

# If homebrew is not installed then install it
if ! type "brew" > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# If git from homebrew is not installed then install it
if [ ! -e /usr/local/bin/git ]; then
  /usr/local/bin/brew install git
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

# Install packages
./brew.sh
/usr/local/bin/bundle install
/usr/local/bin/pip3 install -r Pipfile

# Symlink all configuration
./stow.fish

# Set settings
./macos

# Cleanup brew
/usr/local/bin/brew update
/usr/local/bin/brew upgrade
/usr/local/bin/brew cleanup
/usr/local/bin/brew prune
/usr/local/bin/brew doctor

