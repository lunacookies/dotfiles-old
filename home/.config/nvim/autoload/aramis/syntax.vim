
" vim: set foldmethod=marker foldlevel=0 nomodeline:

function! aramis#syntax#code() abort
  " Italic comments
  highlight! Comment gui=italic cterm=italic

  " Blend vertical separators with line numbers
  highlight! link VertSplit LineNr
endfunction

function! aramis#syntax#prose() abort
  " Disable italic comments
  highlight! Comment gui=NONE cterm=NONE

  " Show delimiters in a faint colour
  highlight! link markdownRule                Comment
  highlight! link markdownHeadingDelimiter    Comment
  highlight! link markdownItalicDelimiter     Comment
  highlight! link markdownBoldDelimiter       Comment
  highlight! link markdownBoldItalicDelimiter Comment
  highlight! link markdownCodeDelimiter       Comment
  highlight! link markdownUrlDelimiter        Comment
  highlight! link markdownUrl                 Comment
  highlight! link markdownListMarker          Comment
  highlight! link markdownOrderedListMarker   Comment

  " Make headings show as bold
  highlight! markdownH1 cterm=bold gui=bold
  highlight! markdownH2 cterm=bold gui=bold
  highlight! markdownH3 cterm=bold gui=bold
  highlight! markdownH4 cterm=bold gui=bold
  highlight! markdownH5 cterm=bold gui=bold
  highlight! markdownH6 cterm=bold gui=bold

  " Retain rich text syntax highlighting
  highlight! markdownBold   cterm=bold   gui=bold
  highlight! markdownItalic cterm=italic gui=italic

  " Make line numbers less focused
  highlight! link LineNr       Comment
  highlight! link CursorLineNr Comment

  " Blend vertical separators with line numbers
  highlight! link VertSplit LineNr
endfunction
