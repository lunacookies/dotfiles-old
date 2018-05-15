#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  # If homebrew is not installed then install it
  if ! type "brew" > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # If git from homebrew is not installed then install it
  if [ ! -e git ]; then
    brew install git
  fi
else
  # Install git and rustup
  sudo apt install git
  curl https://sh.rustup.rs -sSf | sh
fi

# If dotfiles directory does not exist then clone it
if [ -e $HOME/dotfiles ] && [ -e $HOME/.config ] && [ -e $HOME/bin ]; then
  echo "Remove or back up your existing configuration files"
  sleep 1
  echo "Exiting script..."
  exit 1
else
  git clone https://github.com/aramisgithub/dotfiles.git ~/dotfiles
fi

cd ~/dotfiles

# Install packages
if [[ "$OSTYPE" == "darwin"* ]]; then
  ./brew.sh
else
  ./apt.sh
fi
bundle install
pip3 install -r Pipfile

# Symlink all configuration
./stow.fish

# Set settings
if [[ "$OSTYPE" == "darwin"* ]]; then
  ./macos
fi

# Cleanup packages
if [[ "$OSTYPE" == "darwin"* ]]; then
  brew update
  brew upgrade
  brew cleanup
  brew prune
  brew doctor
else
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt update
  sudo apt upgrade
fi

