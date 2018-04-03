""" Prose syntax function
function! aramis#syntax#prose() abort
  highlight! markdownBold                cterm=bold        gui=bold
  highlight! markdownBoldDelimiter       cterm=bold        gui=bold
  highlight! markdownItalic              cterm=italic      gui=italic
  highlight! markdownItalicDelimiter     cterm=italic      gui=italic
endfunction

