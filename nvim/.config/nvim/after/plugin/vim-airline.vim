
" vim: set foldmethod=marker foldlevel=0 nomodeline:

"                                                         " Set airline layout
let g:airline#extensions#default#layout=[
  \ [ 'a', 'b', 'c' ],
  \ [ 'x', 'error', 'warning', 'z' ]
  \ ]
let g:airline#extensions#hunks#enabled=0                  " Disable airline hunk integration
let g:airline#extensions#tabline#left_sep=''              " Don't show a separator between tabs
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#right_alt_sep=''
let g:airline#extensions#tabline#enabled = 1              " Always show tabbar
let g:airline#extensions#tabline#show_tab_type=0          " Don't show tab type
let g:airline#extensions#tagbar#enabled=0                 " Disable airline's tagbar extension
let g:airline#extensions#whitespace#enabled=0             " Disable airline's whitespace extension
let g:airline_detect_spell=0                              " Don't show an indicator when spell checking is enabled
let g:airline_powerline_fonts=0                           " Don't show powerline fonts
" let g:airline_section_c = ''                              " Don't show the filename (it's in the window title)
let g:airline_section_z=airline#section#create(['%l:%c']) " Show current line number and column
let g:airline_symbols.branch = ''                         " Don't show the git branch symbol
let g:airline_symbols.linenr = ''                         " Don't show the line number symbol
let g:airline_symbols.maxlinenr = ''                      " Don't show a symbol at end of file
let g:airline_symbols.readonly='🔒'                        " Show lock emoji when file is readonly
let g:airline_theme='base16'                           " Use solarized theme for airline
"                                                         " Show a single letter to indicate mode
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }
