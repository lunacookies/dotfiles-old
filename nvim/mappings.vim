
" vim: set foldmethod=marker foldlevel=0 nomodeline:

" ----------------------------------------------------------------------------
" Basic mappings {{{
" ----------------------------------------------------------------------------

" jk | Escaping!
inoremap jk <Esc>
xnoremap fd <Esc>
cnoremap jk <C-c>

" Map leader key to space
let mapleader      = ' '
let maplocalleader = ' '

" Easy enter into Ex mode
nnoremap ; :
nnoremap : ;

" Save
nnoremap <C-s> :w<CR>
inoremap <C-s> :w<CR>

" Quit
nnoremap <C-q> :wq<CR>
inoremap <C-q> :wq<CR>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>a

" }}}
" ----------------------------------------------------------------------------
" Buffers {{{
" ----------------------------------------------------------------------------

nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" }}}
" ----------------------------------------------------------------------------
" Tabs {{{
" ----------------------------------------------------------------------------

nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" }}}
" ----------------------------------------------------------------------------
" Add newlines around cursor {{{
" ----------------------------------------------------------------------------

nnoremap ]<Space> o<Esc>k
nnoremap [<Space> ko<Esc>j

" }}}
" ----------------------------------------------------------------------------
" Exchange lines {{{
" ----------------------------------------------------------------------------

nnoremap ]e ddp
nnoremap [e ddkp

" }}}
" ----------------------------------------------------------------------------
" Automatically insert matching pairs {{{
" ----------------------------------------------------------------------------

inoremap fd <Esc>:set nohlsearch<Enter>/<!!><Enter>lh4x:noh<Enter>a
inoremap ( ()<!!><Esc>4hi
inoremap [ []<!!><Esc>4hi
inoremap ' ''<!!><Esc>4hi

" }}}
" ----------------------------------------------------------------------------
" Markdown headings {{{
" ----------------------------------------------------------------------------

nnoremap <leader>1 m`yypVr=``
nnoremap <leader>2 m`yypVr-``
nnoremap <leader>3 m`^i### <esc>``0w
nnoremap <leader>4 m`^i#### <esc>``0w
nnoremap <leader>5 m`^i##### <esc>``0w

" }}}
" ----------------------------------------------------------------------------

