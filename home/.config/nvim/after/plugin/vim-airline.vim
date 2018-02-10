
" vim: set foldmethod=marker foldlevel=0 nomodeline:

let g:airline#extensions#hunks#enabled=0      " Disable airline hunk integration
let g:airline#extensions#tabline#left_sep='' " Use powerline separators in tabline
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#right_alt_sep=''
let g:airline#extensions#tabline#enabled = 1  " Always show tabline
                                              " let g:airline#extensions#tabline#show_tab_type=0          " Don't show tab type
let g:airline#extensions#tagbar#enabled=0     " Disable airline's tagbar extension
let g:airline#extensions#whitespace#enabled=1 " Disable airline's whitespace extension
let g:airline_detect_spell=0                  " Don't show an indicator when spell checking is enabled
let g:airline_powerline_fonts=1               " Show powerline fonts
let g:airline_section_z = '%8(%l : %-2v%)'  " Show simplified line number
let g:airline_left_sep = ''                  " Use powerline separators
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''            " Show the git branch symbol
let g:airline_symbols.readonly = ''          " Use powerline lock symbol when file is read-only
let g:airline_theme='base16'                  " Use base16 theme for airline
                                              " Show a single letter to indicate mode
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
