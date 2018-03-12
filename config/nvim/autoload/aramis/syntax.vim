" Code syntax function

function! aramis#syntax#code() abort
  " Italic comments
  highlight! Comment gui=italic cterm=italic

  " Blend vertical separators with line numbers
  highlight! link VertSplit LineNr

  " Make ColorColumn last to end of window
  execute 'set colorcolumn=' . join(range(81,335), ',')

  " Set ColorColumn to be *lighter* than background
  highlight! link ColorColumn CursorLine

  " Highlight end of file
  highlight! link NonText ColorColumn
endfunction

" Prose syntax function

function! aramis#syntax#prose() abort
  " Show delimiters in normal text colour
  highlight! link markdownCodeDelimiter     markdownError
  highlight! link markdownUrlDelimiter      markdownError
  highlight! link markdownUrl               markdownError
  highlight! link markdownListMarker        markdownError
  highlight! link markdownOrderedListMarker markdownError

  " Make headings show as bold
  highlight! link markdownH1   markdownError
  highlight! link markdownH2   markdownError
  highlight! link markdownH3   markdownError
  highlight! link markdownH4   markdownError
  highlight! link markdownH5   markdownError
  highlight! link markdownH6   markdownError
  highlight! link markdownRule markdownError

  highlight! markdownH1               cterm=bold gui=bold
  highlight! markdownH2               cterm=bold gui=bold
  highlight! markdownH3               cterm=bold gui=bold
  highlight! markdownH4               cterm=bold gui=bold
  highlight! markdownH5               cterm=bold gui=bold
  highlight! markdownH6               cterm=bold gui=bold
  highlight! markdownRule             cterm=bold gui=bold
  highlight! markdownHeadingDelimiter cterm=bold gui=bold

  highlight! link markdownHeadingDelimiter markdonwH1

  " Retain rich text syntax highlighting
  highlight! markdownBold                cterm=bold        gui=bold
  highlight! markdownItalic              cterm=italic      gui=italic
  highlight! markdownItalicDelimiter     cterm=italic      gui=italic
  highlight! markdownBoldDelimiter       cterm=bold        gui=bold
  highlight! markdownBoldItalicDelimiter cterm=bold,italic gui=bold,italic

  " Make line numbers less focused
  highlight! link LineNr       Comment
  highlight! link CursorLineNr Comment

  " Blend vertical separators with line numbers
  highlight! link VertSplit LineNr
endfunction

