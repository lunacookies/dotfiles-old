
" vim: set foldmethod=marker foldlevel=0 nomodeline:

let g:goyo_width=86              " Leave space for line numbers
let g:goyo_linenr=1              " Show line numbers in Goyo mode

nnoremap <leader>g :Goyo<cr>        " Map goyo.vim

function! s:goyo_enter()
  set nolist " Disable invisibles

  " Show delimiters and rules in a faint colour
  hi link markdownRule                Comment
  hi link markdownHeadingDelimiter    Comment
  hi link markdownItalicDelimiter     Comment
  hi link markdownBoldDelimiter       Comment
  hi link markdownBoldItalicDelimiter Comment
  hi link markdownCodeDelimiter       Comment
  hi link markdownUrlDelimiter        Comment
  hi link markdownUrl                 Comment
  hi link markdownListMarker          Comment
  hi link markdownOrderedListMarker   Comment

  " Make headings show as bold
  hi markdownH1 cterm=bold gui=bold
  hi markdownH2 cterm=bold gui=bold
  hi markdownH3 cterm=bold gui=bold
  hi markdownH4 cterm=bold gui=bold
  hi markdownH5 cterm=bold gui=bold
  hi markdownH6 cterm=bold gui=bold

  " Retain rich text syntax highlighting
  hi markdownBold cterm=bold gui=bold
  hi markdownItalic cterm=underline gui=underline

  hi link LineNr Comment

  set scrolloff=999
  DittoOn
  Limelight
endfunction

function! s:goyo_leave()
  set nolist " Disable invisibles

  " Show delimiters and rules in a faint colour
  hi link markdownRule                Comment
  hi link markdownHeadingDelimiter    Comment
  hi link markdownItalicDelimiter     Comment
  hi link markdownBoldDelimiter       Comment
  hi link markdownBoldItalicDelimiter Comment
  hi link markdownCodeDelimiter       Comment
  hi link markdownUrlDelimiter        Comment
  hi link markdownUrl                 Comment
  hi link markdownListMarker          Comment
  hi link markdownOrderedListMarker   Comment

  " Make headings show as bold
  hi markdownH1 cterm=bold gui=bold
  hi markdownH2 cterm=bold gui=bold
  hi markdownH3 cterm=bold gui=bold
  hi markdownH4 cterm=bold gui=bold
  hi markdownH5 cterm=bold gui=bold
  hi markdownH6 cterm=bold gui=bold

  " Retain rich text syntax highlighting
  hi markdownBold cterm=bold gui=bold
  hi markdownItalic cterm=italic gui=italic

  hi link LineNr Comment

  set scrolloff=999
  Limelight!
endfunction

autocmd! vimrc User GoyoEnter nested call <sid>goyo_enter()
autocmd! vimrc User GoyoLeave nested call <sid>goyo_leave()

" }}}1
" -----------------------------------------------------------------------------

