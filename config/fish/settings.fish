# vim: set foldmethod=marker foldlevel=0 nomodeline:

# =============================================================================
# Greeting {{{1
# =============================================================================

set fish_greeting # Don't show greeting upon opening fish

# }}}1
# =============================================================================
# Coloured man {{{1
# =============================================================================

set -gx LESS_TERMCAP_mb (printf "\033[01;31m")
set -gx LESS_TERMCAP_md (printf "\033[01;31m")
set -gx LESS_TERMCAP_me (printf "\033[0m")
set -gx LESS_TERMCAP_se (printf "\033[0m")
set -gx LESS_TERMCAP_so (printf "\033[01;31;33m")
set -gx LESS_TERMCAP_ue (printf "\033[0m")
set -gx LESS_TERMCAP_us (printf "\033[01;32m")

# }}}1
# =============================================================================
# Fzf settings {{{1
# =============================================================================

set -gx FZF_DEFAULT_OPTS "
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

set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git --exclude Library' # Show hidden files in fzf
set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git --exclude Library'
set -gx FZF_CTRL_T_COMMAND 'fd --type f --type d --hidden --follow --exclude .git --exclude Library'

# }}}1
# =============================================================================

