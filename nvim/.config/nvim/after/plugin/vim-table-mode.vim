
" vim: set foldmethod=marker foldlevel=0 nomodeline:

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

