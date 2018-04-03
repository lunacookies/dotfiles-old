""" Remove duplicate empty lines
function! aramis#emptyline#remove() abort
  " Add a bunch of empty lines at start and end of file
  execute "normal! ggI\<enter>\<enter>\<esc>GA\<enter>\<enter\<enter>\<esc>Gkdd"

  " Merge all multiple empty lines into one
  %!cat -s

  " Delete first line (it's going to be empty)
  execute "normal! ggdd"
endfunction

