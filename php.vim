set sw=4
set ts=4
set softtabstop=4

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>
"if (&ft != 'php.html.javascript')
  "setlocal filetype=php.html.javascript
"endif
