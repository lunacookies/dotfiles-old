" Smarter [g]<C-g> that omits some less useful information (e.g. how many
" characters or bytes there are in the current file)
function! functions#smartgctrlg() abort
  execute "silent! normal! g\<C-g>"
  let s:words = substitute(v:statusmsg, "^.*Word [^ ]* of ", "", "")
  let s:words = substitute(s:words, ";.*", "", "")
  let s:column = col('$') - 1
  let s:lines = line('.')
  let s:position = ' C:' . s:column . ' L:' . s:lines . ' W:' . s:words
  return s:position
endfunction
