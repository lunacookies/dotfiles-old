function! aramis#pandoc#convertarticle() abort
  normal! mz
  call system('~/bin/convertitarticle')
  normal! `z
endfunction

function! aramis#pandoc#convertreport() abort
  normal! mz
  call system('~/bin/convertitreport')
  normal! `z
endfunction

function! aramis#pandoc#convertpres() abort
  normal! mz
  call system('~/bin/convertitpres')
  normal! `z
endfunction

function! aramis#pandoc#clean() abort
  normal! mz
  call system('~/bin/cleanit')
  normal! `z
endfunction

