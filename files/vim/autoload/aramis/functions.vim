""
"" Pandoc functions
""

function! aramis#functions#pandocconvertarticle() abort
  normal! mz
  call system('~/.local/bin/convertit article')
  normal! `z
endfunction

function! aramis#functions#pandocconvertreport() abort
  normal! mz
  call system('~/.local/bin/convertit report')
  normal! `z
endfunction

function! aramis#functions#pandocconvertpres() abort
  normal! mz
  call system('~/.local/bin/convertit pres')
  normal! `z
endfunction

function! aramis#functions#pandocclean() abort
  normal! mz
  call system('~/.local/bin/cleanit')
  normal! `z
endfunction

