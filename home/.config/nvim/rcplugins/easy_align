Plug 'junegunn/vim-easy-align' " A Vim alignment plugin

" Allow alignment of % character
let g:easy_align_delimiters={
\  '%': { 'pattern': '%\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
\ }

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Mappings for aligning common characters
nmap <leader>" mz<Plug>(EasyAlign)ip"`z
nmap <leader># mz<Plug>(EasyAlign)ip#`z
nmap <leader>% mz<Plug>(EasyAlign)ip%`z
nmap <leader>& mz<Plug>(EasyAlign)ip&`z
nmap <leader>' mz<Plug>(EasyAlign)ip"`z
nmap <leader>, mz<Plug>(EasyAlign)ip,`z
nmap <leader>. mz<Plug>(EasyAlign)ip.`z
nmap <leader>: mz<Plug>(EasyAlign)ip:`z
nmap <leader><space> mz<Plug>(EasyAlign)ip*<space>`z
nmap <leader>= mz<Plug>(EasyAlign)ip=`z
nmap <leader>t mz<Plug>(EasyAlign)ip*\|`z

