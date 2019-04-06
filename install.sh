#!/usr/bin/env bash

checkmark="\\033[32m✓\\033[0m"
clearline="\\033[2K"
errormsg="\\033[31mERROR:\\033[0m"
warnmsg="\\033[33mWARN:\\033[0m"
infomsg="\\033[36mINFO:\\033[0m"
spindelay="0.05"
spinstr="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"

# Exit immediately if we're not running on macOS
if [ ! "$(uname -s)" = "Darwin" ]; then
  printf "${errormsg} macOS required!\\n"
  exit 1
fi

# Spinner function courtesy of github.com/rootbeersoup/ghost/blob/master/broo
#
# Supply one string as an argument to overlay succeeding spinner message
# on top.
spinner() {
  local msg="$1..."

  tput civis

  while true; do
    if jobs %1 &> /dev/null; then
      true
    else
      printf "${clearline}${checkmark} ${msg} Done!\\n"

      wait
      break
      sleep 0.5
    fi
    for (( i=0; i<${#spinstr}; i++ )); do
      sleep "$spindelay"
      printf "${clearline}${spinstr:$i:1} ${msg}\\r"
    done
  done

  tput cnorm
}

#
# Init
#

# If homebrew is not installed then install it
if ! type "brew" > /dev/null; then
  printf "${warnmsg} Homebrew not installed. Installation process will begin now.\\n"
  sleep 0.5

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# If dotfiles directory does not exist then clone it
if [ ! -e "$HOME/dotfiles" ]; then
  printf "${infomsg} Dotfiles directory not found.\\n"
  (git clone --quiet https://github.com/arzg/dotfiles.git ~/dotfiles) &
  spinner "Cloning dotfiles"
fi

cd ~/dotfiles

#
# Functions
#

# Symlink all configuration
linkconfig() {
  rmifexists() {
    local target="$1"
    [ -e "$target" ] && rm -r "$target"
  }

  # Remove ~/.config because the only program that I use that keeps its config
  # in there is Nvim, and its config is only a symlink that is generated later
  # anyway.
  rmifexists "$HOME/.config"

  # First argument:  file or directory to link
  # Second argument: directory into which this will be linked to. A trailing
  #                  slash is required. Any characters after this slash will be
  #                  prefixed onto the symlink, which is useful if you (for
  #                  example) want the symlink to be prefixed with a period to
  #                  hide it from view.
  #
  # Any file that may be present at the target will be overwritten.
  linkrc() {
    local rcpath="$2$1"
    ln -shF "$PWD/$1" "$rcpath"
  }

  for rc in *rc *.conf git* editorconfig ; do
      linkrc $rc "$HOME/." &
  done
  linkrc "bin" "$HOME/"

  # Link Vim and Nvim configs
  rmifexists "$HOME/.local/share/nvim/swap"
  rmifexists "$HOME/.vimrc"
  linkrc "vim" "$HOME/."
  mkdir -p "$HOME/.config/nvim"
  ln -shF "$PWD/vim/vimrc" "$HOME/.config/nvim/init.vim"
}

pack_brew() {
  (brew update &> /dev/null) &
  spinner "Updating Homebrew"
  (brew bundle cleanup --force &> /dev/null) &
  spinner "Removing manually added packages"
  (brew bundle &> /dev/null && brew upgrade &> /dev/null) &
  spinner "Installing and updating formulae"
  (brew cleanup --prune-prefix &> /dev/null) &
  spinner "Cleaning up"
}

pack_mas() {
  # Take a Mac App Store application ID and install the application with that
  # ID. The input to this function matches the format of the Masfile perfectly,
  # so that all it takes to install all the apps it specifies is to source it.
  mas() {
    command mas install $1 > /dev/null
  }

  (source 'Masfile') &
  spinner "Installing App Store apps"
  (command mas upgrade > /dev/null) &
  spinner "Updating App Store apps"

  # Create an up-to-date Masfile
  echo -e "$(/usr/local/bin/mas list \
    | sed 's/ /" \# /' \
    | sed 's/^/mas "/' \
    | sort)" > Masfile
}

pack_tex() {
  (sudo tlmgr update --self &> /dev/null) &
  spinner "Updating tlmgr"
  (sudo tlmgr update --all &> /dev/null) &
  spinner "Updating TeX Live"
}

pack_consolas() {
  # We check for the bold italic version (Consolaz) because, if this variant is
  # available, all four styles are most likely to also be there.
  fontpath="/Applications/Microsoft Word.app/Contents/Resources/Fonts"
  installpath="$HOME/Library/Fonts"
  existcheckpath="$fontpath/Consolaz.ttf"
  installcheckpath="$installpath/Consolaz.ttf"

  if [ ! -e "$installcheckpath" ] && [ -e "$existcheckpath" ]; then
    cp "$fontpath/Consola"* "$installpath"
  fi
}

pack() {
  pack_brew
  pack_mas
  pack_tex
  pack_consolas

  (bash "$HOME/.vim/get-plugins.sh" > /dev/null) &
  spinner "Installing Vim plugins"

  # Update npm itself
  (npm install -g npm > /dev/null) &
  spinner "Updating npm"
}

#
# Do the thing
#

# We don't use a spinner for the system settings because it breaks it for some
# reason. (Maybe it has something to do with sudo being used in the script.)
# TODO: Find a way to add a spinner without breaking macos.
bash macos

(linkconfig) &
spinner "Linking config"

pack

# Set computer (host) name
printf "${infomsg} What would you like to set your computer name to?\\n"
read computername
sudo scutil --set ComputerName "$computername"
sudo scutil --set HostName "$computername"
sudo scutil --set LocalHostName "$computername"
sudo defaults write \
  /Library/Preferences/SystemConfiguration/com.apple.smb.server \
  NetBIOSName -string "$computername"

wait
