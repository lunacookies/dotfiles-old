#!/usr/bin/env bash

# Get me into the dotfiles folder
cd ~/dotfiles

#
# Brew
#

brew update                 # Update brew itself
brew bundle cleanup --force # Remove anything not present in the Brewfile
brew bundle                 # Install and update everything from the Brewfile
brew upgrade                # Update any dependencies of formulae

# Clean up as necessary
brew cleanup                # Delete caches
brew cleanup                # Delete cask caches
brew prune                  # Remove unused symlinks
brew doctor                 # Check if anything is broken

#
# Gems
#

gem update                  # Update all gems
gem install neovim          # Install the only global gem we want -- Neovim

#
# Mas
#

# A function that takes a Mac App Store application ID as input and installs the
# application with that ID
mas() {
  command mas install $1
}

# Installs all applications specified in the Masfile
source 'Masfile'

# Update Mac apps
command mas upgrade

# Creates an up-to-date Masfile
echo -e "$(/usr/local/bin/mas list | sed 's/ /" \# /' | sed 's/^/mas "/' | sort)" > Masfile

#
# Misc
#

# Place all commands to be run right after installation of software here

# Get bundle identifier (app name format that duti uses) with:
#   $ osascript -e 'id of app "<AppName>"'
#
# Get UTI (Mac filetype name) with:
#  $ mdls <FileOfYourType> | grep -i "contenttype " | sed 's/^.*= "//' | sed 's/"//g'

# Make Preview the default application for PDFs (because Adobe Acrobat DC
# changes this)
duti -s com.apple.Preview pdf all

# Open markdown files in iA Writer
duti -s pro.writer.mac net.daringfireball.markdown all
