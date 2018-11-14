#!/usr/bin/env bash

# Clear out, then create ~/.config
if [ -e $HOME/.config ]; then
  rm -rf $HOME/.config
fi
mkdir -p $HOME/.config

# Get into the dotfiles repository
cd ~/dotfiles

# Define a function that links a given file to a given location and
# automatically removes the target file
rmandlink() {
  local rcpath="$2$1"

  # Delete old links
  rm -rf $rcpath

  # Link the rc
  ln -s $PWD/$1 $rcpath
}

#
# etc
#

cd etc

# Link every file in the etc/ directory to $HOME, apart from the ones that
# follow the XDG Base Directory Spec -- link those to $HOME/.config
for rc in *; do
  if [ $rc = "git" ] \
    || [ $rc = "iTerm2" ]; then
    rmandlink $rc "$HOME/.config/"
  else
    rmandlink $rc "$HOME/."
  fi
done

cd ..

#
# bin
#

# Link my scripts to $HOME
rmandlink "bin" "$HOME/"

#
# Miscellaneous
#

# Create some empty files that make the shell quieter
#
# .hushlogin hides the login message
#
# .bash_sessions_disable disables bash sessions -- a feature of Terminal.app
# that, as far as I can tell has something to do with restoring terminal
# sessions. I'm not really sure _what_ it does, but I use tmux so I'm pretty
# sure it's useless to me.
touch $HOME/.hushlogin ~/.bash_sessions_disable

# Source bashrc even in login shell
printf '%s' 'if [ -f ~/.bashrc ]; then . ~/.bashrc; fi' > $HOME/.bash_profile

# Link Nvim config to Vim config
mkdir -pv $HOME/.config/nvim
ln -s $PWD/etc/vim/vimrc $HOME/.config/nvim/init.vim
