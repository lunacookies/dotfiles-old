scriptencoding utf-8

" -----------------------------------------------------------------------------
" Interface
" -----------------------------------------------------------------------------

set conceallevel=0                                 " Never conceal
set shortmess=aIT                                  " Abbreviate error messages
set numberwidth=4                                  " Leave space for 2 digits in line numbers
set guioptions=                                    " Hide scrollbars in MacVim
set cursorline                                     " Always show cursor guide
set relativenumber                                 " Relative line numbers
set number                                         " Absolute line numbers
set lazyredraw                                     " Prevent unnecessary redrawing
                                                   " Don't show dashes when folding
set fillchars=fold:\ 
let &l:colorcolumn='+' . join(range(1, 254), ',+') " Highlight up to 255 columns beyond 'textwidth'

" -----------------------------------------------------------------------------

