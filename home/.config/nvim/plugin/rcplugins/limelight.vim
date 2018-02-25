
Plug 'junegunn/limelight.vim' " Hyper-focus writing

let g:limelight_priority=-1             " Don't overrule hlsearch
let g:limelight_default_coefficient=0.6 " Dim other paragraphs more
let g:limelight_paragraph_span=1        " Don't dim surrounding paragraphs

" Map limelight.vim
nnoremap <leader>l :Limelight!!<cr>

