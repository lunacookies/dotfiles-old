scriptencoding utf-8

" -----------------------------------------------------------------------------
" Editing
" -----------------------------------------------------------------------------

set virtualedit=block    " Allow cursor placement where characters are not in Visual Block
set formatoptions=1cjroq " Auto-format comments
set mouse=a              " Use mouse
set clipboard=unnamed    " Use macOS clipboard
set timeoutlen=500       " Time in milliseconds to complete a shortcut
set textwidth=79         " 79 chars/line
set nomodeline           " Set how many lines are checked for set commands
set nojoinspaces         " Insert only one space after punctuation
set nostartofline        " Keep cursor on same column
set spell                " Spell check comments and text
set spelllang=en_gb      " Use British English
if exists('&fixeol')     " Handle end of lines at end of files
  set nofixeol
endif

" -----------------------------------------------------------------------------

