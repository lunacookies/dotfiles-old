
" vim: set foldmethod=marker foldlevel=0 nomodeline:

" --------------------------------------------------------------------------
" Help in new tabs {{{
" --------------------------------------------------------------------------

function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
autocmd vimrc BufEnter *.txt call s:helptab()

" }}}
" --------------------------------------------------------------------------
" Markdown options {{{
" --------------------------------------------------------------------------

autocmd FileType markdown set formatoptions=tacwq
autocmd FileType markdown set spell
autocmd FileType markdown set scrolloff=15
autocmd FileType markdown call litecorrect#init()

" }}}
" ----------------------------------------------------------------------------
" Rainbow parentheses everywhere {{{
" ----------------------------------------------------------------------------

autocmd BufEnter *  :RainbowParentheses
autocmd BufEnter .* :RainbowParentheses

" }}}
" ----------------------------------------------------------------------------
" Exclude these autopairs in VimScript files {{{
" ----------------------------------------------------------------------------

function s:autopair()
    if &ft =~ 'vim'
      return
    endif
  inoremap < <><!!><Esc>4hi
  inoremap { {}<!!><Esc>4hi
  inoremap " ""<!!><Esc>4hi
endfunction

autocmd BufEnter * :call <SID>autopair()



" }}}
" ----------------------------------------------------------------------------

