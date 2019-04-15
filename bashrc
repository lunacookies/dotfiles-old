# aramis' bashrc

#
# Path
#

export PATH=$HOME/bin:$PATH
export PATH=/usr/local:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/texlive/20*/bin:$PATH
export PATH=/Library/TeX/texbin:$PATH
export PATH=$HOME/code/go/bin:$PATH

#
# Aliases and functions
#

# System
alias cp="cp -riv"
alias ls="betterls"
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias rm="echo 'Use trs instead, or /bin/rm if you want to delete permanently'"
alias trs="rmtrash"
alias vim8="/Applications/MacVim.app/Contents/bin/vim"
alias vim8diff="/Applications/MacVim.app/Contents/bin/vimdiff"
alias vim="nvim"
alias vimdiff="nvim -d"

# Create directory and then cd into it
mkcd() {
  mkdir -p -- "$@"
  cd -- "$@"
}

# LaTeX shortcuts
alias pdf="open *.pdf"

doc() {
  # Create empty document if it doesn't exist yet
  [ ! -e 'document.md' ] && touch 'document.md'

  # Open document in iA Writer
  open -a "iA Writer.app" document.md
}

# For some reason git branch doesn't show any output unless I grep for nothing?
fixedgit() {
  if [ "$1" = "branch" ] || [ "$1" = "br" ]; then
    git "$@" --color=always | grep ''
  else
    git "$@"
  fi
}
alias git="fixedgit"

#
# Environment variables
#

# Gopath
export GOPATH=$HOME/code/go

# Use Nvim
export EDITOR=nvim
export VISUAL=nvim

# Use less
export PAGER=less

# Set default flags for less
#
# The F flag makes less act like cat, and then quit, if the entire file can be
# displayed without scrolling
#
# The R flag makes less interpret colours
export LESS="FR"

# Use UTF8 everywhere
export __CF_USER_TEXT_ENCODING=0x08000100:0x0

# Enable coloured output in some BSD utilities
export CLICOLOR=1

# fzf
#
# This makes fzf much faster and makes it scan hidden files too, as well as
# excluding several uninteresting folders from the search
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .gem --exclude .Trash --exclude Library'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git --exclude .gem --exclude .Trash --exclude Library'
export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git --exclude .gem --exclude .Trash --exclude Library'
#
# Use colours from Apprentice
export FZF_DEFAULT_OPTS='
--color fg:7,hl:4,fg+:250,bg+:0,hl+:12
--color info:2,prompt:6,spinner:101,pointer:14,marker:2
'
#
# Source fzf shell integration files
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null
source "/usr/local/opt/fzf/shell/key-bindings.bash"

#
# Options
#

# History

# Save a lot of history
HISTFILE=$HOME/.bash_history
HISTSIZE=10000
SAVEHIST=1000000

# Ignore duplicates in history
HISTCONTROL="erasedups:ignoreboth"

# Words are separated using space
WORDCHARS=''

# Save history after every prompt
if [ -z "$PROMPT_COMMAND" ]; then
  PROMPT_COMMAND="history -a"
else
  PROMPT_COMMAND="$PROMPT_COMMAND; history -a"
fi

# Use arrows to navigate history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

# Save multi-line commands as one command
shopt -s cmdhist

# Do not overwrite history file
shopt -s histappend

# Moving around

# See https://asciinema.org/a/5T5vODhu3TRnNzvghYprpA3xf
export CDPATH=.:$HOME:$HOME/code:$HOME/School/2019:..

# Automatically add  cd  when entering a path by itself
shopt -s autocd

# Correct spelling errors
shopt -s cdspell
shopt -s dirspell

# More globbing options!
shopt -s extglob
shopt -s globstar

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Completion

# Enable bash-completion v2 and point it towards all the legacy completions that
# Homebrew automatically installs.
if [[ -e "/usr/local/share/bash-completion/bash_completion" ]]; then
  export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
  source "/usr/local/share/bash-completion/bash_completion"
fi

# Ignore case
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Complete prefix first, then press tab again for list of options
bind "set show-all-if-unmodified on"

# Replace the common prefix of a set of completions with ...
bind "set completion-prefix-display-length 2"

# Use <C-j> and <C-k> to cycle through completion options
bind "Control-j: menu-complete"
bind "Control-k: menu-complete-backward"

# Show some symbols (the ones used in ls -F) after filenames during completion
# for extra information
bind "set visible-stats on"

# Immediately add a trailing slash when completing symlinks to directories
bind "set mark-symlinked-directories on"

# Don't assume a word with a @ in it is a hostname
shopt -u hostcomplete

# Don't complete when tab is pressed on an empty line
shopt -s no_empty_cmd_completion

# Misc

# Coloured manpages
export LESS_TERMCAP_mb=$(printf "\033[0;92m")
export LESS_TERMCAP_md=$(printf "\033[0;92m")
export LESS_TERMCAP_me=$(printf "\033[0m")
export LESS_TERMCAP_se=$(printf "\033[0m")
export LESS_TERMCAP_so=$(printf "\033[0;33m")
export LESS_TERMCAP_ue=$(printf "\033[0m")
export LESS_TERMCAP_us=$(printf "\033[0;32m")

# Always install homebrew casks into ~/Applications
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"

# Hide control characters like ^C and ^Z
bind "set echo-control-characters off"

# Toggle backgrounding with <C-z>
stty susp undef
bind '"\C-z":"fg > /dev/null\015"'

# Update window size after every command
shopt -s checkwinsize

#
# Window title
#

# Set the window title to match the present working directory -- whether in
# tmux or in a regular terminal. The tmux function also sets the current
# window's name to ~ if in $HOME, or to the tail of the PWD
tmuxwindowtitle() {
  if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\ePtmux;\e\e]6;%s\a\e\\' "$PWD_URL"
  fi
  if [[ $(basename $PWD) == $(basename $HOME) ]]; then
    tmux rename-window "~"
  else
    tmux rename-window "$(basename $PWD)"
  fi
}

regularwindowtitle() {
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
    PROMPT_COMMAND="$PROMPT_COMMAND; tmuxwindowtitle"
    ;;
  xterm*)
    PROMPT_COMMAND="$PROMPT_COMMAND; regularwindowtitle"
    ;;
esac

#
# Prompt
#

# Source git prompt provided by Homebrew
source "/usr/local/opt/git/etc/bash_completion.d/git-prompt.sh"

# Limit the number of segments displayed of the working directory in the prompt
# to three
PROMPT_DIRTRIM=3

# Set prompt
PS1='\[\e[97m\][\h:\w\[\e[92m\]$(__git_ps1 " %s" &)\[\e[97m\]]\[\e[0m\] '
