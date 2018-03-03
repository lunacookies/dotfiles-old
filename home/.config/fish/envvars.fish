# vim: set foldmethod=marker foldlevel=0 nomodeline:

# =============================================================================
# PATH {{{
# =============================================================================

set -gx PATH ~/bin $PATH          # Personal scripts
set -gx PATH /usr/local $PATH     # Fix OS updates which mess with PATH
set -gx PATH /usr/local/bin $PATH # Fix TeX (broken on every macOS update)
set -gx PATH /usr/local/texlive/2017/bin $PATH
set -gx PATH /Library/TeX/texbin $PATH

# }}}
# =============================================================================
# Editor {{{
# =============================================================================

set -gx EDITOR nvim # Use nvim as editor

# }}}
# =============================================================================
# Text encoding {{{
# =============================================================================

# set -gx __CF_USER_TEXT_ENCODING 0x08000100:0x0 # UTF-8 text encoding

# }}}
# =============================================================================

