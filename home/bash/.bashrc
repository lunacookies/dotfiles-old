# aramis' bashrc

##
## Source universal configuration
##

source ~/.shrc


##
## Options
##

# Save a lot of history
HISTFILE=~/.zhist
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

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"


##
## Window title
##

# Set the window title to match the present working directory -- whether in
# tmux or in a regular terminal. This also checks git status after every prompt.
case "$TERM" in
  screen*)
    PROMPT_COMMAND="tmuxwindowtitle"
esac

case "$TERM" in
  xterm*)
    PROMPT_COMMAND="regularwindowtitle"
esac

##
## Prompt
##

# Set prompt
PS1='
\[\e[32m\]\w
\033[0;91m\h \[\e[m\]\\$ '

