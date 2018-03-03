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
" Reset autocmd {{{1
" =============================================================================

augroup vimrc
  autocmd!
augroup END

" }}}1
" =============================================================================
" Map leader {{{1
" =============================================================================

" Map leader to <space> here so that plugin leader mappings work
let g:mapleader=' '      " Regular leader
let g:maplocalleader=' ' " Local  leader

" }}}1
" =============================================================================
" Source config files {{{1
" =============================================================================

function! s:SourceConfigFilesIn(directory)
  let a:directory_splat = '~/.config/nvim/' . a:directory . '/*'
  for a:config_file in split(glob(a:directory_splat), '\n')
    if filereadable(a:config_file)
      execute 'source' a:config_file
    endif
  endfor
endfunction

call plug#begin('~/.local/share/nvim/plugged')
call s:SourceConfigFilesIn('plugin/rcplugins')
call plug#end()

call s:SourceConfigFilesIn('plugin/rcfiles')

" }}}1
" =============================================================================

