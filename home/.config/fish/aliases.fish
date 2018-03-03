# vim: set foldmethod=marker foldlevel=0 nomodeline:

# =============================================================================
# System {{{1
# =============================================================================

alias e="nvim"                         # Edit
alias trs="rmtrash"                    # Trash
alias rm="echo Use 'trs' or '/bin/rm'" # Remove

# }}}1
# =============================================================================
# LaTeX shortcuts {{{1
# =============================================================================

alias doc="e document.md"                              # Document
alias pdf="open -na /Applications/Skim.app output.pdf" # PDF
alias cb="~/bin/compilebeamer"                         # Compile beamer
alias cr="~/bin/compilereport"                         # Compile report

# }}}1
# =============================================================================
# Quick dotfile access {{{1
# =============================================================================

alias tdf="cd ~/dofiles; and fzf"    # To dotfiles
alias shlc="e ~/.zshrc"              # Shell config
alias ec="e ~/.config/nvim/init.vim" # Editor config
alias wmc="e ~/.chunkwmrc"           # Window manager config
alias hdc="e ~/.khdrc"               # Hotkey daemon config

# }}}1
# =============================================================================
# List files/directories {{{1
# =============================================================================

alias l="exa -l -F --ignore-glob .git"              # List
alias la="exa -l -F --ignore-glob .git -a"          # List all
alias ll="exa -l -T -L 2 -F --ignore-glob .git"     # List longer
alias lal="exa -l -T -L 2 -F --ignore-glob .git -a" # List all longer

# }}}1
# =============================================================================
# Daemons {{{1
# =============================================================================

alias ywm="brew services restart chunkwm" # Yes window manager
alias nwm="brew services stop chunkwm"    # No window manager
alias yhd="brew services restart khd"     # Yes hotkey daemon
alias nhd="brew services stop khd"        # No hotkey daemon

# }}}1
# =============================================================================
# Git {{{1
# =============================================================================

alias gc="git add -A; and git commit -am"                                            # Git commit
alias gcl="git clone"                                                                # Git clone
alias gi="git init; and git add -A"                                                  # Git initialise new repo
alias gpl="git pull"                                                                 # Git pull
alias gps="git push"                                                                 # Git push
alias gs="git status"                                                                # Git status
alias gl="git log --color --graph --pretty=format:'%Cgreen%s%Creset%nby %an%n%ar%n'" # Git log

# }}}1
# =============================================================================

