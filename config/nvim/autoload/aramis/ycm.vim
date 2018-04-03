" Build YCM using this function
function! aramis#ycm#install(info) abort
  if executable('cmake')
    if a:info.status ==# 'installed' || a:info.force
      !./install.py
    endif
  else
    echom('You do not have cmake installed. YCM depends on it.')
    finish
  endif
endfunction

