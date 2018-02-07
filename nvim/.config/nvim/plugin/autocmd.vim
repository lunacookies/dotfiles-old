
" vim: set foldmethod=marker foldlevel=0 nomodeline:

augroup vimrc

  " ===========================================================================
  " Help in new tabs {{{1
  " ===========================================================================

  function! s:helptab()
    if &buftype==#'help'
      wincmd T
      nnoremap <buffer> q :q<cr>
    endif
  endfunction
  autocmd vimrc BufEnter *.txt call s:helptab()

  " }}}1
  " ===========================================================================
  " tmux tab title {{{1
  " ===========================================================================

  autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))

  " }}}1
  " ===========================================================================

augroup END

