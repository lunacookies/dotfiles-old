""" Remove duplicate empty lines
function! aramis#emptyline#remove() abort
  " Mark current position
  normal! mz

  " Add a bunch of empty lines at start and end of file
  normal! ggI\<enter>\<enter>\<esc>GA\<enter>\<enter\<enter>\<esc>Gkdd

  " Merge all multiple empty lines into one
  %!cat -s

  " Delete first line (it's going to be empty)
  normal! ggdd

  " Snap back to position
  normal! `z
endfunction

