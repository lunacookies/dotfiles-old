""
"" Pandoc functions
""

function! aramis#functions#pandocconvertarticle() abort
  normal! mz
  call system('~/bin/convertitarticle')
  normal! `z
endfunction

function! aramis#functions#pandocconvertreport() abort
  normal! mz
  call system('~/bin/convertitreport')
  normal! `z
endfunction

function! aramis#functions#pandocconvertpres() abort
  normal! mz
  call system('~/bin/convertitpres')
  normal! `z
endfunction

function! aramis#functions#pandocclean() abort
  normal! mz
  call system('~/bin/cleanit')
  normal! `z
endfunction

