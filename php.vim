set sw=4
set ts=4
set softtabstop=4

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a', 'n')
endfunction
inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>

let g:php_namespace_sort_after_insert = 1
