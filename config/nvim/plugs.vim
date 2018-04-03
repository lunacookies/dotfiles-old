" vim: set foldmethod=marker foldlevel=0 nomodeline:

" Plugs
" ----------------------------------------------------------

Plug '/usr/local/opt/fzf'
Plug 'Valloric/YouCompleteMe', { 'do': function('aramis#ycm#install') }
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim',      { 'for': 'markdown' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-xmark',     { 'for': 'markdown', 'do': 'make' }
Plug 'justinmk/vim-sneak'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sheerun/vim-polyglot'
Plug 'skwp/greplace.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'

" Options
" ----------------------------------------------------------

" Easy align {{{1

" Allow alignment of % character
let g:easy_align_delimiters = {
      \  '%': { 'pattern': '%\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
      \ }

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}1
" Fzf {{{1

" Set colours
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" }}}1
" Goyo {{{1

let g:goyo_width  = 67 " Leave a few extra chars more than textwidth
let g:goyo_linenr = 1  " Show line numbers in goyo mode

function! s:goyo_enter()     " On goyo enter:
  set nolist                 " Disable invisibles
  set noshowmode             " Don't show current mode
  set noshowcmd              " Don't show last command
  call aramis#syntax#prose() " Call prose syntax function
  set scrolloff=999          " Centre current line
  set nocursorline           " Don't show cursor guide
  Limelight                  " Enable paragraph focus mode
endfunction

function! s:goyo_leave()     " On goyo exit:
  set nolist                 " Disable invisibles
  set showmode               " Show current mode
  set showcmd                " Show last command
  call aramis#syntax#prose() " Call prose syntax function
  set scrolloff=1            " Show 1 lines of context when scrolling
  set cursorline             " Show cursor guide
  Limelight!                 " Disable paragraph focus mode
endfunction

" Activate respective function on goyo enter and leave
autocmd! vimrc User GoyoEnter nested call <sid>goyo_enter()
autocmd! vimrc User GoyoLeave nested call <sid>goyo_leave()

" }}}1
" Limelight {{{1

let g:limelight_priority            = -1  " Don't overrule hlsearch
let g:limelight_default_coefficient = 0.6 " Dim other paragraphs more

" }}}1
" Sneak {{{1

let g:sneak#use_ic_scs = 1 " Use case settings from vimrc
let g:sneak#s_next     = 1 " Emulate clever-f

" Use sneak for regular movements as well
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Make sneak highlighting the same as search results
hi! link Sneak Search

" }}}1
" indentLine {{{1

let g:indentLine_color_gui            = '#616161' " Set GUI colour
let g:indentLine_color_term           = 239       " Set terminal colour
let g:indentLine_faster               = 1         " Don't slow down vim
let g:indentLine_showFirstIndentLevel = 1         " Show all indentation
let g:indentLine_first_char           = '│'       " Make indent guides smooth
let g:indentLine_char                 = '│'

" }}}1
" Slash {{{

" Centre on search
noremap <plug>(slash-after) zz

" }}}
" ALE {{{

" Lint less
let g:ale_lint_on_text_changed = 0
autocmd vimrc CursorHold * call ale#Lint()
autocmd vimrc CursorHoldI * call ale#Lint()
autocmd vimrc InsertEnter * call ale#Lint()
autocmd vimrc InsertLeave * call ale#Lint()

" }}}
" Polyglot {{{

let g:polyglot_disabled = ['markdown']

" }}}

