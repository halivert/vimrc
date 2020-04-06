set sw=2
set ts=2

setlocal commentstring="{{- %s -}}"

if (&ft != 'blade.html')
  setlocal filetype=blade.html
endif

let b:caw_wrap_oneline_comment = ['{{--', '--}}']
let b:caw_wrap_multiline_comment = {'right': '--}}', 'bottom': '-', 'left': '{{--', 'top': '-'}
