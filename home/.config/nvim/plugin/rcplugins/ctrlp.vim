
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file, buffer, mru, tag, etc finder

let g:ctrlp_show_hidden=1 " Search hidden files with ctrl-p

" Open ctrl=p file search with <leader>f
nnoremap <leader>f :CtrlP<cr>

" Open ctrl-p buffer search with <leader>b
nnoremap <leader>b :CtrlPBuffer<cr>

" Open ctrl-p MRU files search with <leader>b
nnoremap <leader>m :CtrlPMRUFiles<cr>

