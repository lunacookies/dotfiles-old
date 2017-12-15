
" vim: set foldmethod=marker foldlevel=0 nomodeline:

" ----------------------------------------------------------------------------
" vim-plug {{{
" ----------------------------------------------------------------------------

let g:plug_window = '-tabnew' " Open vim-plug in new tab

" }}}
" ----------------------------------------------------------------------------
" indentLine {{{
" ----------------------------------------------------------------------------

let g:indentLine_setConceal = 0        " Disable conceal in random files
let g:indentLine_char = '│'            " Make indent guides real lines
let g:indentLine_color_term = 239      " Set indent guide colour for terminal
let g:indentLine_color_gui = '#616161' " Set indent guide colour for MacVim

" }}}
" ----------------------------------------------------------------------------
" goyo.vim + limelight.vim {{{
" ----------------------------------------------------------------------------

"  Make limelight.vim span 3 paragraphs
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

" Toggle goyo.vim
function s:goyo_toggle()
  set linespace=7!
  :Goyo
endfunction

nnoremap <Leader>g :call <SID>goyo_toggle()<CR> " Map goyo.vim
nnoremap <Leader>l :Limelight!!<CR>             " Map limelight.vim

" }}}
" ----------------------------------------------------------------------------
" vim-easy-align {{{
" ----------------------------------------------------------------------------

xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign in visual mode (e.g. vipga)
nmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)

" }}}
" ----------------------------------------------------------------------------

