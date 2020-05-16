set shiftwidth=2
set tabstop=2

setlocal commentstring="{{- %s -}}"

if (&ft != 'blade.html')
  setlocal filetype=blade.html
endif
