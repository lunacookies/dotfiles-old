" Open help in new tabs
function! s:helptab()
  if &buftype==#'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
autocmd vimrc BufEnter *.txt call s:helptab()

