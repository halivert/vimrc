" fu! CambiarLetrasConAcento()
"   :%s/Ã/Á/g
"
"   :%s/Ã¡/á/g
"   :%s/Ã©/é/g
"   :%s/Ã­/í/g
"   :%s/Ã³/ó/g
" endfunction

augroup vimrc_auto_mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N] ") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END
