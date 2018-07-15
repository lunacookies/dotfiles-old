# aramis' zshrc

##
## Source universal configuration
##

source ~/.shrc


##
## Initialise
##

autoload -U colors && colors      # Initialise colours
autoload -Uz compinit && compinit # Initialise completion
autoload -Uz vcs_info             # Initialise vcs info in prompt


##
## Options
##

# Save a lot of history
HISTFILE=~/.zhist
HISTSIZE=10000
SAVEHIST=1000000

# Words are separated using space
WORDCHARS=''

# Move cursor to end of word after completion
setopt always_to_end

# Allow functions in prompt
setopt promptsubst

# Do not overwrite history file
setopt appendhistory

# Show completion menu on successive tab press
setopt auto_menu

# Automatically add  cd  when entering a path by itself
setopt autocd

# Allow completion within words
setopt complete_in_word

# Allow extra characters for matching file names
setopt extendedglob

# Show an error if a filename does not match
setopt nomatch

# Ignore duplicates in history
setopt hist_ignore_dups

# Outputting flow control is disables using start/stop chars
unsetopt flowcontrol

# Do not autoselect the first completion entry
unsetopt menu_complete

# Highlight completion
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories


##
## Window title
##

# Set the window title to match the present working directory -- whether in
# tmux or in a regular terminal. This also checks git status after every prompt.
case "$TERM" in
  screen*)
    precmd () {
      tmuxwindowtitle
      vcs_info
    }
    ;;
esac

case "$TERM" in
  xterm*)
    precmd () {
      regularwindowtitle
      vcs_info
    }
    ;;
esac

##
## Prompt
##

# Enable vcs_info
zstyle ':vcs_info:*' enable git

# Show branch in vcs_info
zstyle ':vcs_info:git*' formats '%b'

# Set prompt
PROMPT='
%{$fg[green]%}%~%{$reset_color%}
%F{208}%m%{$reset_color%} %# '
RPROMPT='%{$reset_color%}%{$fg[white]%}${vcs_info_msg_0_}%{$reset_color%}'

