#!/usr/bin/env bash

cd ~/dotfiles

#
# Brew
#

brew update                 # Update brew itself
brew bundle cleanup --force # Remove anything not present in the Brewfile
brew bundle                 # Install and update everything from the Brewfile
brew upgrade                # Update any dependencies of formulae

# A little bit of cleaning
brew prune                  # Remove unused symlinks
brew doctor                 # Check if anything is broken

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
# Vim
#

# Download, update, and clean all Vim plugins
./vim/get-plugins.sh

#
# TeX Live
#

sudo tlmgr update --self    # Update tlmgr
sudo tlmgr update --all     # Update TeX Live

#
# npm
#

npm install -g npm

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

# Get Consolas if it isn't installed yet

# We check fir the bold italic version (Consolaz) because, if this variant is
# available, all four styles are most likely to also be there.
existpath="/Applications/Microsoft Word.app/Contents/Resources/Fonts"
installpath="$HOME/Library/Fonts"
existcheckpath="$existpath/Consolaz.ttf"
installcheckpath="$installpath/Consolaz.ttf"

if [ ! -e "$installcheckpath" ] && [ -e "$existcheckpath" ]; then
  cp "$existpath/Consola"* "$installpath"
fi
