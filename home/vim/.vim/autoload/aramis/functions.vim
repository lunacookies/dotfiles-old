""
"" Pandoc functions
""

function! aramis#functions#pandocconvertarticle() abort
  normal! mz
  call system('~/bin/convertit article')
  normal! `z
endfunction

function! aramis#functions#pandocconvertreport() abort
  normal! mz
  call system('~/bin/convertit report')
  normal! `z
endfunction

function! aramis#functions#pandocconvertpres() abort
  normal! mz
  call system('~/bin/convertit pres')
  normal! `z
endfunction

function! aramis#functions#pandocclean() abort
  normal! mz
  call system('~/bin/cleanit')
  normal! `z
endfunction

