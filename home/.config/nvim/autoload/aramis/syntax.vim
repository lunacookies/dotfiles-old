
" vim: set foldmethod=marker foldlevel=0 nomodeline:

function! aramis#syntax#code() abort
  " Italic comments
  hi! Comment gui=italic cterm=italic
endfunction

function! aramis#syntax#prose() abort
  " Disable italic comments
  hi! Comment gui=NONE cterm=NONE

  " Show delimiters in a faint colour
  hi! link markdownRule                Comment
  hi! link markdownHeadingDelimiter    Comment
  hi! link markdownItalicDelimiter     Comment
  hi! link markdownBoldDelimiter       Comment
  hi! link markdownBoldItalicDelimiter Comment
  hi! link markdownCodeDelimiter       Comment
  hi! link markdownUrlDelimiter        Comment
  hi! link markdownUrl                 Comment
  hi! link markdownListMarker          Comment
  hi! link markdownOrderedListMarker   Comment

  " Make headings show as bold
  hi! markdownH1 cterm=bold gui=bold
  hi! markdownH2 cterm=bold gui=bold
  hi! markdownH3 cterm=bold gui=bold
  hi! markdownH4 cterm=bold gui=bold
  hi! markdownH5 cterm=bold gui=bold
  hi! markdownH6 cterm=bold gui=bold

  " Retain rich text syntax highlighting
  hi! markdownBold   cterm=bold   gui=bold
  hi! markdownItalic cterm=italic gui=italic

  " Make line numbers less focused
  hi! link LineNr       Comment
  hi! link CursorLineNr Comment
endfunction
