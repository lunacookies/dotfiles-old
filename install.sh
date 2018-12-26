#!/usr/bin/env bash

# If homebrew is not installed then install it
if ! type "brew" > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# If dotfiles directory does not exist then clone it
if [ ! -e $HOME/dotfiles ]; then
  git clone https://github.com/arzg/dotfiles.git ~/dotfiles
fi

# Make sure to set up custom git hooks
echo '#!/usr/bin/env bash
antibody bundle < ~/.antibodyrc > ~/.antibodyrc.sh
' > $HOME/dotfiles/.git/hooks/pre-commit

cd ~/dotfiles

# We do these things before the mass software installation becaus some parts of
# packages.sh depend on configuration that is linked in link.sh

# Symlink all configuration
./link.sh

# Set settings
./macos

# Install and update packages
./packages.sh
