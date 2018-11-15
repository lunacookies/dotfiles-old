# aramis' bashrc

#
# Aliases
#

# System
alias cp="cp -riv"
alias vim="nvim"
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias rm="rmtrash"

# ls function that uses a bunch of custom flags as default
ls() {
  # Process options using getopts
  while getopts ":a" arg
  do
    case $arg in
      a)
        local ifall=true
        ;;
      \?)
        local ifextraopt=$OPTARG
        ;;
    esac
  done

  # Shift the argument index so that we have access to the operands, also known
  # as the mass arguments (those that are not specific to any argument)
  shift $(expr $OPTIND - 1 )

  # Return all default arguments for ls.

  #   * The F flag shows symbols after the filenames of certain filetypes --
  #     e.g. an astersik after executables, and a slash after directories
  #   * The G flag makes colour output default
  #   * The H flag makes ls follow symlinks and show where they lead
  local defaultargs=$(echo "FGH")

  # Return the option  A  instead of  a  when showing hidden items. This means
  # that . and .. are not displayed.
  local all=$([ "$ifall" = true ] && echo "A")

  # Return any other flags that may have been passed
  local extraopt=$([ ! -z "$ifextraopt" ] && echo "$ifextraopt")

  # Return all operands
  local file="$(
  while test $# -gt 0; do
    echo $1
    shift
  done
  )"

  # Create a variable storing the command to be executed
  local cmd="ls -$defaultargs$all$extraopt $file"

  # Now actually call the command
  command $cmd

  # Reset the argument index
  OPTIND=1
}

# LaTeX shortcuts
alias pdf="open *.pdf"
doc() {
  # Open document in GUI if we are going to be writing for a while; otherwise open
  # in terminal Nvim
  if [ "$1" = "--long" ]; then
    mvim -c "Goyo" document.md
  else
    nvim document.md
  fi
}

# Quick dotfile access
alias ec="nvim $HOME/.vim/vimrc"
alias hdc="nvim $HOME/.skhdrc"
alias sc="nvim $HOME/.bashrc"
alias tec="nvim $HOME/.tmux.conf"
alias wmc="nvim $HOME/.chunkwmrc"

# Daemons
alias nhd="brew services stop skhd"
alias nwm="brew services stop chunkwm"
alias yhd="brew services restart skhd"
alias ywm="brew services restart chunkwm"

#
# Environment variables
#

# Path
export PATH=$HOME/bin:$PATH
export PATH=/usr/local:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/texlive/20*/bin:$PATH
export PATH=/Library/TeX/texbin:$PATH
export PATH=$HOME/.gem/ruby/2.5.0/bin:$PATH
export PATH=$HOME/code/go/bin:$PATH

# Gopath
export GOPATH=$HOME/code/go

# Editor
export EDITOR=nvim

# Pager
export PAGER=less

# Set default flags for less
#
# The F flag makes less quit if the entire file can be displayed without
# scrolling
#
# The R flag makes less interpret colours
export LESS="FR"

# Text encoding
export __CF_USER_TEXT_ENCODING=0x08000100:0x0

# Custom ls colours for colours that are consistent with exa
#
# I pick this because I find exa's colours more appealing
export LSCOLORS=ExFxBxDxCxegedabagacad

# fzf
#
# This makes fzf take some more of its colours from the terminal's colour scheme
export FZF_DEFAULT_OPTS='
--color spinner:2,pointer:9,prompt:4
'

#
# Options
#

# Coloured man
export LESS_TERMCAP_mb=$(printf "\033[01;31m")
export LESS_TERMCAP_md=$(printf "\033[01;31m")
export LESS_TERMCAP_me=$(printf "\033[0m")
export LESS_TERMCAP_se=$(printf "\033[0m")
export LESS_TERMCAP_so=$(printf "\033[01;31;33m")
export LESS_TERMCAP_ue=$(printf "\033[0m")
export LESS_TERMCAP_us=$(printf "\033[01;32m")

# Use arrows to navigate history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

# Save a lot of history
HISTFILE=$HOME/.bash_history
HISTSIZE=10000
SAVEHIST=1000000

# Words are separated using space
WORDCHARS=''

# Do not overwrite history file
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Automatically add  cd  when entering a path by itself
shopt -s autocd 2> /dev/null

# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# More globbing options!
shopt -s extglob
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Update window size after every command
shopt -s checkwinsize

# Ignore duplicates in history
HISTCONTROL="erasedups:ignoreboth"

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Tab through completion matches like zsh
bind 'TAB:menu-complete'

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

#
# Window title
#

# Set the window title to match the present working directory -- whether in
# tmux or in a regular terminal. The tmux function also sets the current
# window's name to ~ if in $HOME, or to the tail of the PWD
tmuxwindowtitle () {
  if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\ePtmux;\e\e]6;%s\a\e\\' "$PWD_URL"

    if [[ $(basename $PWD) == $(basename $HOME) ]]; then
      tmux rename-window "~"
    else
      tmux rename-window $(basename $PWD)
    fi
  else
    if [[ $(basename $PWD) == $(basename $HOME) ]]; then
      tmux rename-window "~"
    else
      tmux rename-window $(basename $PWD)
    fi
  fi
}

regularwindowtitle () {
  if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]6;%s\a' "$PWD_URL"
  else
    if [[ $(basename $PWD) == $(basename $HOME) ]]; then
      printf "\e]0;$(echo '~ — bash')\a"
    else
      printf "\e]0;$(echo $(basename $PWD) — bash)\a"
    fi
  fi
}

# Call the appropriate window title function before every prompt
case "$TERM" in
  tmux*)
    PROMPT_COMMAND="tmuxwindowtitle"
esac

case "$TERM" in
  xterm*)
    PROMPT_COMMAND="regularwindowtitle"
esac

#
# Prompt
#

# Load git prompt
if [ -e ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# Set the base prompt, which shows:
#
# * PWD (absorbing any previous colour because, if we only show a different user
#   and are not in SSH, the prompt looks a little bland. Making the PWD yellow
#   in this case makes it look better. All other cases show the PWD as white.)
#
# * Git prompt (bold dark grey to make it fade into the background)
#
# * > prompt character (red)
PS1='\w\[\e[1;30m\]$(__git_ps1)\[\e[1;31m\]> \[\e[0m\]'

# Show the user- and hostnames if we are in SSH or if the username is not 'me'
#
# If we are in SSH:
#   * Username (blue)
#   * @ (green, bold)
#   * Hostname (yellow)
#   * Colon (yellow)
#
# If we are not 'me':
#   * Username (blue)
#   * Colon (green, bold)
#   * Beginning of yellow colouring for PWD

if [[ -n $SSH_CLIENT || -n $SSH_CONNECTION ]] ; then
  PS1='\[\e[34m\]\u\[\e[1;32m\]@\[\e[0;33m\]\h\[\e[35m\]:\[\e[m\]'$PS1
elif [ ! "$USER" = "aramis" ]; then
  PS1='\[\e[34m\]\u\[\e[1;32m\]:\[\e[0;33m\]'$PS1
fi
