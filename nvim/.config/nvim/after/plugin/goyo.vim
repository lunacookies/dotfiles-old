
" vim: set foldmethod=marker foldlevel=0 nomodeline:

let g:goyo_width=86              " Leave space for line numbers
let g:goyo_linenr=1              " Show line numbers in Goyo mode

nnoremap <leader>g :Goyo<cr>        " Map goyo.vim

function! s:goyo_enter()
  set nolist " Disable invisibles

  call aramis#syntax#prose()

  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  set nolist " Disable invisibles

  call aramis#syntax#prose()

  set scrolloff=999
  Limelight!
endfunction

autocmd! vimrc User GoyoEnter nested call <sid>goyo_enter()
autocmd! vimrc User GoyoLeave nested call <sid>goyo_leave()

" }}}1
" -----------------------------------------------------------------------------

