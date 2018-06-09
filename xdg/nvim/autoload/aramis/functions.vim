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


""
"" Search in open buffers
""

function! aramis#functions#clearquickfixList() abort
  call setqflist([])
endfunction

function! aramis#functions#vimgrepall(pattern) abort
  call aramis#functions#clearquickfixList()
  exe 'bufdo vimgrepadd ' . a:pattern . ' %'
  cnext
endfunction
