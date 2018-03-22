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
  highlight! link markdownCodeDelimiter     Normal
  highlight! link markdownListMarker        Normal
  highlight! link markdownOrderedListMarker Normal
  highlight! link markdownUrl               Normal
  highlight! link markdownUrlDelimiter      Normal

  " Make headings show as bold
  highlight! link markdownH1               Normal
  highlight! link markdownH2               Normal
  highlight! link markdownH3               Normal
  highlight! link markdownH4               Normal
  highlight! link markdownH5               Normal
  highlight! link markdownH6               Normal
  highlight! link markdownHeadingDelimiter Normal
  highlight! link markdownRule             Normal

  highlight! markdownH1               cterm=bold gui=bold
  highlight! markdownH2               cterm=bold gui=bold
  highlight! markdownH3               cterm=bold gui=bold
  highlight! markdownH4               cterm=bold gui=bold
  highlight! markdownH5               cterm=bold gui=bold
  highlight! markdownH6               cterm=bold gui=bold
  highlight! markdownHeadingDelimiter cterm=bold gui=bold
  highlight! markdownRule             cterm=bold gui=bold

  " Retain rich text syntax highlighting
  highlight! markdownBold                cterm=bold        gui=bold
  highlight! markdownBoldDelimiter       cterm=bold        gui=bold
  highlight! markdownItalic              cterm=italic      gui=italic
  highlight! markdownItalicDelimiter     cterm=italic      gui=italic
endfunction

