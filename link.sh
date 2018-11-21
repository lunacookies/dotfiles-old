#!/usr/bin/env bash

# Clear out, then create ~/.config
if [ -e $HOME/.config ]; then
  rm -rf $HOME/.config
fi
mkdir -p $HOME/.config

# Get into the dotfiles repository
cd ~/dotfiles

# Define a function that links a given file to a given location and
# automatically removes the target file if it exists
linkrc() {
  local rcpath="$2$1"

  # Link the rc
  #
  # -s: Make symbolic link
  # -v: Confirm linking through output
  # -h: Do not follow a symlink that may be present at the target
  # -F: Overwrite target
  ln -svhF $PWD/$1 $rcpath
}

# Link [every file in the etc/ directory that needs to be in $HOME] to $HOME
for rc in *rc *.conf git* editorconfig ; do
    linkrc $rc "$HOME/."
done

# Link my scripts to $HOME
linkrc "bin" "$HOME/"

# Miscellaneous

# Create some empty files that make the shell quieter
#
# .hushlogin hides the login message
#
# .bash_sessions_disable disables bash sessions -- a feature of Terminal.app
# that, as far as I can tell has something to do with restoring terminal
# sessions. I'm not really sure _what_ it does, however.
touch $HOME/.hushlogin ~/.bash_sessions_disable

# Source bashrc even in login shell
printf '%s' 'if [ -f ~/.bashrc ]; then . ~/.bashrc; fi' > $HOME/.bash_profile
