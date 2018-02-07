
" vim: set foldmethod=marker foldlevel=0 nomodeline:

" =============================================================================
" aramis' init.vim {{{1
" =============================================================================

" /u/aramisreddit
" github.com/aramisgithub

" Inspired by
" github.com/junegunn
" github.com/Geospace
" gihub.com/herrbischoff

" }}}1
" =============================================================================
" MINPAC BLOCK {{{1
" =============================================================================

" -----------------------------------------------------------------------------
" Modify packpath {{{2
" -----------------------------------------------------------------------------

set packpath^=~/.local/share/nvim/site " Don't store packages in dotfiles folder

" }}}2
" -----------------------------------------------------------------------------
" Plugins {{{2
" -----------------------------------------------------------------------------

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'}) " A minimal package manager for Vim

  call minpac#add('SirVer/ultisnips')           " The ultimate snippet solution for Vim
  call minpac#add('Yggdroot/indentLine')        " Indent guides
  call minpac#add('dbmrq/vim-ditto')            " Stop repeating yourself
  call minpac#add('dhruvasagar/vim-table-mode') " Vim table mode for instant table creation
  call minpac#add('dkarter/bullets.vim')        " Automated bullet lists
  call minpac#add('jiangmiao/auto-pairs')       " Interact with brackets, parens, quotes in pair
  call minpac#add('junegunn/fzf.vim')           " Fzf on Vim
  call minpac#add('junegunn/goyo.vim')          " Distraction-free writing
  call minpac#add('junegunn/limelight.vim')     " Hyper-focus writing
  call minpac#add('junegunn/vim-easy-align')    " A Vim alignment plugin
  call minpac#add('kana/vim-textobj-entire')    " Text objects for entire buffer
  call minpac#add('kana/vim-textobj-indent')    " Text objects for indented blocks of lines
  call minpac#add('kana/vim-textobj-line')      " Text objects for the current line
  call minpac#add('kana/vim-textobj-user')      " Create your own text objects
  call minpac#add('reedes/vim-litecorrect')     " Lightweight auto-correction
  call minpac#add('romainl/flattened')          " Solarized, without the bullshit
  call minpac#add('takac/vim-hardtime')         " Stop repeating hjkl
  call minpac#add('tpope/vim-abolish')          " Act on multiple variants of a word
  call minpac#add('tpope/vim-commentary')       " Comment stuff out
  call minpac#add('tpope/vim-endwise')          " Wisely add matching closing structures
  call minpac#add('tpope/vim-fugitive')         " Git wrapper for Vim
  call minpac#add('tpope/vim-markdown')         " Vim Markdown runtime files
  call minpac#add('tpope/vim-repeat')           " Repeat plugin maps
  call minpac#add('tpope/vim-surround')         " Quoting/parenthesising made simple
  call minpac#add('tpope/vim-unimpaired')       " Pairs of handy bracket mappings
  call minpac#add('w0rp/ale')                   " Asynchronous Lint Engine
endif

" }}}2
" -----------------------------------------------------------------------------
" Pack command {{{2
" -----------------------------------------------------------------------------

command! Pack packadd minpac | source $MYVIMRC | call minpac#clean() | call minpac#update()

" }}}2
" -----------------------------------------------------------------------------

" }}}1
" =============================================================================
" SPACES AND INDENTS {{{1
" =============================================================================

set softtabstop=2      " 2 spaces per tab
set shiftwidth=2       " 2 spaces for indentation
set shiftround         " Always set indentation to a multiple of 2
set autoindent         " Copy indent from current line into adjacent line
set expandtab smarttab " Insert spaces when tab is pressed

" }}}1
" =============================================================================
" UI {{{1
" =============================================================================

" -----------------------------------------------------------------------------
" Colours and Text {{{2
" -----------------------------------------------------------------------------

set background=light        " Light background
set termguicolors           " True colour
set synmaxcol=790           " Maximum column in which to syntax highlight
set guifont=Input:h11       " Set MacVim font
set listchars=trail:•       " Show trailing spaces with a •
set list                    " Enable showing invisibles
colorscheme flattened_light " Set colourscheme
let &t_ZH="\e[3m"           " Italics fix
let &t_ZR="\e[23m"

" }}}2
" -----------------------------------------------------------------------------
" Input Methods {{{2
" -----------------------------------------------------------------------------

set noimdisable " Fix Input Methods
set iminsert=1  " Enable lmap and disable IM
set imsearch=-1 " Makes it look like imi is used when typing a search pattern

" }}}2
" -----------------------------------------------------------------------------
" Wrapping {{{2
" -----------------------------------------------------------------------------

set wrap               " Wrap text
set linebreak          " Wrap at words
let &showbreak='↳ '    " Show occurrences of wrapped text
set breakindent        " Display indents before wrapped lines
set breakindentopt=sbr " Display  showbreak  before indent

" }}}2
" -----------------------------------------------------------------------------
" Command line {{{2
" -----------------------------------------------------------------------------

set completeopt=menuone,preview " Show possible completions with preview
set wildmenu                    " Enhanced command-line completion
set wildmode=full               " Complete the next full match
set showcmd                     " Show Ex commands

" }}}2
" -----------------------------------------------------------------------------
" Window title {{{2
" -----------------------------------------------------------------------------

set titlestring=     " Reset what shows in window title
set titlestring+=%:t " Show filename and file path in window title
set title            " Show the window title

" }}}2
" -----------------------------------------------------------------------------
" Scrolling {{{2
" -----------------------------------------------------------------------------

set scrolloff=5      " Leave 5 lines at edges of window when scrolling vertically
set sidescrolloff=10 " Leave 10 lines at edges of window when scrolling horizontally
set sidescroll=1     " Scroll horizontally at edge of window

" }}}2
" -----------------------------------------------------------------------------
" Status line {{{2
" -----------------------------------------------------------------------------

set laststatus=2                           " Always show status line
set visualbell                             " Flash indicator on status line instead of bell
set statusline=                            " Reset status line
set statusline+=\ %8(%l\ :\ %-2v%)         " Lines and columns
set statusline+=\ %m                       " Modified/read-only flag
set statusline+=\ %{fugitive#statusline()} " Git branch
set statusline+=\ %=                       " Separator
set statusline+=\ %y                       " Filetype
                                           " Spacer
set statusline+=\ 

" }}}2
" -----------------------------------------------------------------------------
" Misc {{{2
" -----------------------------------------------------------------------------

set conceallevel=0        " Never conceal
set shortmess=aIT         " Abbreviate error messages
set numberwidth=4         " Leave space for 2 digits in line numbers
set guioptions=           " Hide scrollbars in MacVim
set nocursorline          " Never show cursor guide
set relativenumber        " Relative line numbers
set number                " Absolute line numbers
set lazyredraw            " Prevent unnecessary redrawing
" Don't show dashes when folding
set fillchars=fold:\ 
if exists('&colorcolumn') " Highlight 79th column
  set colorcolumn=80
endif

" }}}2
" -----------------------------------------------------------------------------

" }}}1
" =============================================================================
" SEARCHING {{{1
" =============================================================================

set hlsearch             " Highlight search matches
set incsearch            " Highlight as you type while searching
set ignorecase smartcase " Smart capitalisation handling

" }}}1
" =============================================================================
" FILES {{{1
" =============================================================================

set fileencoding=utf-8 " Write UTF-8
set encoding=utf-8     " Display UTF-8
set nrformats=hex      " Use hexadecimal and base ten
set sessionoptions-=options      " Do not save manually set options
set sessionoptions-=folds        " Do not save manually created folds
set undofile           " Keep undo history between sessions
set hidden             " A buffer becomes hidden when abandoned
set autoread           " Automatically read a file when it has been changed outside of vim

" }}}1
" =============================================================================
" EDITING {{{1
" =============================================================================

set virtualedit=block    " Allow cursor placement where characters are not in Visual Block
set formatoptions=1cjroq " Auto-format comments
set mouse=a              " Use mouse
set clipboard=unnamed    " Use macOS clipboard
set timeoutlen=500       " Time in milliseconds to complete a shortcut
set textwidth=79         " 79 chars/line
set modelines=3          " Set how many lines are checked for set commands
set nojoinspaces         " Insert only one space after punctuation
set nostartofline        " Keep cursor on same column
set spell                " Spell check comments and text
set spelllang=en_gb      " Use British English
if exists('&fixeol')     " Handle end of lines at end of files
  set nofixeol
endif

" }}}1
" =============================================================================
" MAPPINGS {{{1
" =============================================================================

" -----------------------------------------------------------------------------
" Escaping {{{2
" -----------------------------------------------------------------------------

" Insert mode
inoremap jk <esc>

" Visual mode
xnoremap fd <esc>

" Ex command-line mode
cnoremap jk <c-c>

" }}}2
" -----------------------------------------------------------------------------
" Navigating splits {{{2
" -----------------------------------------------------------------------------

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" }}}2
" -----------------------------------------------------------------------------
" Leader {{{2
" -----------------------------------------------------------------------------

let g:mapleader=' '      " Regular leader
let g:maplocalleader=' ' " Local  leader

" }}}2
" -----------------------------------------------------------------------------
" Easy enter into command line mode {{{2
" -----------------------------------------------------------------------------

" Normal mode
nnoremap ; :
nnoremap : ;

" Visual mode
xnoremap ; :
xnoremap : ;

" }}}2
" -----------------------------------------------------------------------------
" Save {{{2
" -----------------------------------------------------------------------------

nnoremap <c-s> :w<cr> " Save in normal mode
inoremap <c-s> :w<cr> " Save in insert mode too

" }}}2
" -----------------------------------------------------------------------------
" Quit {{{2
" -----------------------------------------------------------------------------

nnoremap <c-q> :wq<cr> " Save and quit in normal mode
inoremap <c-q> :wq<cr> " Save and quit in insert mode too

" }}}2
" -----------------------------------------------------------------------------
" Markdown headings {{{2
" -----------------------------------------------------------------------------

nnoremap <leader>1 0i#<space><esc>0
nnoremap <leader>2 0i##<space><esc>0
nnoremap <leader>3 0i###<space><esc>0
nnoremap <leader>4 0i####<space><esc>0
nnoremap <leader>5 0i#####<space><esc>0
nnoremap <leader>6 0i######<space><esc>0

" }}}2
" -----------------------------------------------------------------------------
" Thesaurus {{{2
" -----------------------------------------------------------------------------

" Use <space>d on top of a word to look it up in Dictionary.app
nnoremap <leader>d :!open dict://<cword><cr><cr>

" }}}2
" -----------------------------------------------------------------------------
" Folds {{{2
" -----------------------------------------------------------------------------

nnoremap , za

" }}}2
" -----------------------------------------------------------------------------
" Upper-case current word {{{2
" -----------------------------------------------------------------------------

inoremap <c-u> <esc>lviwUea
nnoremap <c-u> viwUe

" }}}2
" -----------------------------------------------------------------------------

" }}}1
" =============================================================================
" PLUGINS {{{1
" =============================================================================

" -----------------------------------------------------------------------------
" vim-plug {{{2
" -----------------------------------------------------------------------------

let g:plug_window='-tabnew' " Open vim-plug in new tab

" }}}2
" -----------------------------------------------------------------------------
" indentLine {{{2
" -----------------------------------------------------------------------------

let g:indentLine_showFirstIndentLevel=1       " Show indent guides at the first level as well
let g:indentLine_enabled=1                    " Enable indent guides by default
let g:indentLine_fileTypeExclude=['markdown'] " Don't show indent guides in Markdown files
let g:indentLine_color_tty_light=14           " Set indent guide colour for terminal
let g:indentLine_color_gui='#93a1a1'          " Set indent guide colour for MacVim

" }}}2
" -----------------------------------------------------------------------------
" goyo.vim + limelight.vim {{{2
" -----------------------------------------------------------------------------

let g:limelight_paragraph_span=1 " Make limelight.vim span 3 paragraphs
let g:goyo_width=86              " Leave space for line numbers
let g:limelight_priority=-1      " Don't overrule hlsearch
let g:goyo_linenr=1              " Show line numbers in Goyo mode

nnoremap <leader>g :Goyo<cr>        " Map goyo.vim
nnoremap <leader>l :Limelight!!<cr> " Map limelight.vim

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
  hi markdownItalic cterm=italic gui=italic

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

autocmd! User GoyoEnter nested call <sid>goyo_enter()
autocmd! User GoyoLeave nested call <sid>goyo_leave()

" }}}2
" -----------------------------------------------------------------------------
" vim-table-mode {{{2
" -----------------------------------------------------------------------------

function! s:isAtStartOfLine(mapping)
  let l:text_before_cursor=getline('.')[0 : col('.')-1]
  let l:mapping_pattern='\V' . escape(a:mapping, '\')
  let l:comment_pattern='\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (l:text_before_cursor=~? '^' . ('\v(' . l:comment_pattern . '\v)?') . '\s*\v' . l:mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
  \ <sid>isAtStartOfLine('\|\|') ?
  \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'

inoreabbrev <expr> __
  \ <sid>isAtStartOfLine('__') ?
  \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" }}}2
" -----------------------------------------------------------------------------
" vim-easy-align {{{2
" -----------------------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Allow alignment of % character
let g:easy_align_delimiters = {
\  '%': { 'pattern': '%\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
\ }

" }}}2
" -----------------------------------------------------------------------------
" vim-ditto {{{2
" -----------------------------------------------------------------------------

let g:ditto_hlgroups=['Error'] " Highlight overused words in red

" }}}2
" -----------------------------------------------------------------------------
" vim-hardtime {{{2
" -----------------------------------------------------------------------------

let g:hardtime_default_on = 1 " Learn better habits

" }}}2
" -----------------------------------------------------------------------------
" UltiSnips {{{2
" -----------------------------------------------------------------------------

let g:UltiSnipsExpandTrigger = '<tab>'                                        " Expand snippet with tab
let g:UltiSnipsJumpForwardTrigger='<tab>'                                     " Go to next field with tab
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'                                  " Go to previous field with shift-tab
let g:UltiSnipsSnippetDir = ['~/.config/nvim/UltiSnips']                      " Search for and save snippets here
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips'] " Name of snippet directory

" }}}2
" -----------------------------------------------------------------------------

" }}}1
" =============================================================================
" AUTOCMD {{{1
" =============================================================================

augroup vimrc

  " ---------------------------------------------------------------------------
  " Help in new tabs {{{2
  " ---------------------------------------------------------------------------

  function! s:helptab()
    if &buftype==#'help'
      wincmd T
      nnoremap <buffer> q :q<cr>
    endif
  endfunction
  autocmd vimrc BufEnter *.txt call s:helptab()

  " }}}2
  " ---------------------------------------------------------------------------
  " tmux tab title {{{2
  " ---------------------------------------------------------------------------

  autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))

  " }}}2
  " ---------------------------------------------------------------------------

augroup END

" }}}1
" =============================================================================

