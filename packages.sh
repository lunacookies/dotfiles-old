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
python
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

pippackages=(
vim-vint
neovim
)


##
## Update
##

# Brew

brew update  # Update brew itself
brew upgrade # Update brew packages

# Pip

# Update all packages (including pip itself)
pip3 install --upgrade setuptools wheel pip
pip3 freeze --local > tmp
pip3 install -r tmp --upgrade
rm tmp


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

# Brew

# Formulae
installinarray 'brewformulae' 'brew install'

# Taps
installinarray 'brewtaps' 'brew tap'

# Casks
installinarray 'brewcasks' 'brew cask install'

# Pip

installinarray 'pippackages' 'pip3 install --user --install-option="--prefix="'


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

