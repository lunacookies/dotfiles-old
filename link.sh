#!/usr/bin/env bash

# Create ~/.config if it doesn't exist yet
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
  if [ $rc = "Apple_Terminal" ] \
    || [ $rc = "git" ] \
    || [ $rc = "iTerm2" ] \
    || [ $rc = "nvim" ] \
    || [ $rc = "stylus" ]; then
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
# Shell files
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
