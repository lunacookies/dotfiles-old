
# vim: set foldmethod=marker foldlevel=0 nomodeline:

# ===========================================================================
# Z-PLUG BLOCK {{{
# ===========================================================================

# ---------------------------------------------------------------------------
# Begin plug {{{
# ---------------------------------------------------------------------------

source ~/.zplug/init.zsh

# }}}
# ---------------------------------------------------------------------------
# Plugins {{{
# ---------------------------------------------------------------------------

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme

# }}}
# ---------------------------------------------------------------------------
# Auto-install {{{
# ---------------------------------------------------------------------------

if ! zplug check --verbose; then
  printf "Install zplug plugins? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# }}}
# ---------------------------------------------------------------------------
# Load plug {{{
# ---------------------------------------------------------------------------

zplug load

# }}}
# ---------------------------------------------------------------------------

# }}}
# ===========================================================================
# PROMPT {{{
# ===========================================================================

# ---------------------------------------------------------------------------
# Prompt symbol {{{
# ---------------------------------------------------------------------------

SPACESHIP_PROMPT_SYMBOL=" >" # 

# }}}
# ---------------------------------------------------------------------------
# Battery {{{
# ---------------------------------------------------------------------------

SPACESHIP_BATTERY_SHOW="false"

# }}}
# ---------------------------------------------------------------------------
# Prompt order {{{
# ---------------------------------------------------------------------------

SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# }}}
# ---------------------------------------------------------------------------
# No padding {{{
# ---------------------------------------------------------------------------

SPACESHIP_TIME_SHOW="true" # Add padding in front of dir
SPACESHIP_TIME_FORMAT=""
SPACESHIP_DIR_PREFIX=""


# }}}
# ---------------------------------------------------------------------------

# }}}
# ===========================================================================
# BASIC SETTINGS {{{
# ===========================================================================

# ---------------------------------------------------------------------------
# Auto-cd {{{
# ---------------------------------------------------------------------------

setopt autocd

# }}}
# ---------------------------------------------------------------------------
# Fzf {{{
# ---------------------------------------------------------------------------

export FZF_DEFAULT_OPTS="
  --no-height 
  --no-reverse 
  --preview 'cat {}' 
  --color=dark 
  --margin 8% 
"

# Full screen
# Bottom to top
# File preview
# Dark colour scheme
# Small padding

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # Source completion and keybindings

# }}}
# ---------------------------------------------------------------------------
# Day-night toggle {{{
# ---------------------------------------------------------------------------

if [[ $(/usr/local/bin/dark-mode status) = "off" ]]
then
  echo -e "\033]50;SetProfile=day\a"
else
  echo -e "\033]50;SetProfile=night\a"
fi

# }}}
# ---------------------------------------------------------------------------

# }}}
# ===========================================================================
# ENV VARS {{{
# ===========================================================================

# ---------------------------------------------------------------------------
# PATH {{{
# ---------------------------------------------------------------------------

export PATH=$PATH:~/bin          # Personal scripts
export PATH=$PATH:/usr/local     # Fix OS updates which mess with PATH
export PATH=$PATH:/usr/local/bin # Fix TeX (broken on every macOS update)
export PATH=$PATH:/usr/texbin
export PATH=$PATH:/usr/local/texlive/*/bin
export PATH=$PATH:/Library/TeX/texbin

# }}}
# ---------------------------------------------------------------------------
# Editor {{{
# ---------------------------------------------------------------------------

export EDITOR="nvim" # Use nvim as editor

# }}}
# ---------------------------------------------------------------------------
# Text encoding {{{
# ---------------------------------------------------------------------------

export __CF_USER_TEXT_ENCODING="0x08000100:0x0" # UTF-8 text encoding

# }}}
# ---------------------------------------------------------------------------

# }}}
# ===========================================================================
# ALIASES {{{
# ===========================================================================

# ---------------------------------------------------------------------------
# System {{{
# ---------------------------------------------------------------------------

alias e="nvim"                         # Edit
alias trs="rmtrash"                    # Trash
alias rm="echo Use 'trs' or '/bin/rm'" # Remove

# }}}
# ---------------------------------------------------------------------------
# LaTeX shortcuts {{{
# ---------------------------------------------------------------------------

alias doc="e document.md"                              # Document
alias pdf="open -na /Applications/Skim.app output.pdf" # PDF
alias cb="~/bin/compilebeamer"                         # Compile beamer
alias cr="~/bin/compilereport"                         # Compile report

# }}}
# ---------------------------------------------------------------------------
# Quick dotfile access {{{
# ---------------------------------------------------------------------------

alias tdf="cd ~/dofiles && fzf"      # To dotfiles
alias shlc="e ~/.zshrc"              # Shell config
alias ec="e ~/.config/nvim/init.vim" # Editor config
alias wmc="e ~/.chunkwmrc"           # Window manager config
alias hdc="e ~/.khdrc"               # Hotkey daemon config

# }}}
# ---------------------------------------------------------------------------
# List files/directories {{{
# ---------------------------------------------------------------------------

alias l="exa -l -F --ignore-glob .git"              # List
alias la="exa -l -F --ignore-glob .git -a"          # List all
alias ll="exa -l -T -L 2 -F --ignore-glob .git"     # List longer
alias lal="exa -l -T -L 2 -F --ignore-glob .git -a" # List all longer

# }}}
# ---------------------------------------------------------------------------
# Daemons {{{
# ---------------------------------------------------------------------------

alias ywm="brew services restart chunkwm" # Yes window manager
alias nwm="brew services stop chunkwm"    # No window manager
alias yhd="brew services restart khd"     # Yes hotkey daemon
alias nhd="brew services stop khd"        # No hotkey daemon

# }}}
# ---------------------------------------------------------------------------
# Git {{{
# ---------------------------------------------------------------------------

alias gc="git commit -am"                                                            # Git commit
alias gcl="git clone"                                                                # Git clone
alias gi="git init && git add -A"                                                    # Git initialise new repo
alias gpl="git pull"                                                                 # Git pull
alias gps="git push"                                                                 # Git push
alias gs="git status"                                                                # Git status
alias gl="git log --color --graph --pretty=format:'%Cgreen%s%Creset%nby %an%n%ar%n'" # Git log

# }}}
# ---------------------------------------------------------------------------

# }}}
# ===========================================================================

