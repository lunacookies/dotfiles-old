#!/usr/bin/env bash

# Get me into the dotfiles folder
cd ~/dotfiles


##
## What to install
##

brewtaps=(
caskroom/fonts
crisidev/homebrew-chunkwm
koekeishiya/formulae
)

brewformulae=(
bash
chunkwm
ctags
exa
fd
git
khd
neovim
pandoc
ranger
rg
rmtrash
shellcheck
stow
the_silver_searcher
wget
zsh
)

brewcasks=(
adobe-acrobat-reader
alfred
android-file-transfer
appcleaner
flux
font-fira-sans
font-m-plus
google-backup-and-sync
google-chrome
liteicon
mactex
macvim
mpv
soundflower
soundflowerbed
)

rubygems=(
neovim
)



##
## Update
##

brew update  # Update brew itself
brew upgrade # Update brew packages
gem update   # Update gems


##
## Install
##

# Function to run a command on every item in an array
installinarray() {
  array=$1[@]
  for item in ${!array}; do
    $2 $item
  done
}

installinarray 'brewformulae' 'brew install'   # Formulae
installinarray 'brewtaps' 'brew tap'           # Taps
installinarray 'brewcasks' 'brew cask install' # Casks
installinarray 'rubygems' 'gem install'        # Gems


##
## Clean up
##

# Clean up as necessary
brew cleanup
brew cask cleanup
brew prune
brew doctor


##
## Install Fira Mono with Text Figures
##

# Download the fonts
git clone --depth=1 -q https://github.com/aramisgithub/FiraMono_Text_Figures.git ~/fonttmp
rm -rf ~/fonttmp/.git

# Copy them to the user's font directory
cp ~/fonttmp/*ttf ~/Library/Fonts/

# Clean up
rm -rf ~/fonttmp

