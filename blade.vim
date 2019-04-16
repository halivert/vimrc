set sw=2
set ts=2

setlocal commentstring="{{- %s -}}"

if (&ft != 'blade.html')
  setlocal filetype=blade.html
endif
