set nocompatible

so ~/.vim/plugins.vim
so ~/.vim/functions.vim

set showcmd
set rnu
syntax on

let mapleader = '`'
set path+=**
" Window is put bellow current one
set sb
" Windows is put right of the current one
set spr
set autoindent
set expandtab
set sw=2
set tabstop=2
set softtabstop=2
set ruler
set wrap
set wildmenu
set hlsearch
set textwidth=117
set diffopt=vertical
set emo
let g:PHP_removeCRwhenUnix=1
set t_Co=256
colo solarized

if has('gui_running')
  set guifont=IBM\ Plex\ Mono\ 11
  let w:solarized_style='dark'
endif

nnoremap Q <nop>
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader><space> :nohlsearch<cr>
nmap <leader>es :UltiSnipsEdit<cr>
nmap <leader>y "+y
nmap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p

augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

cmap w!! w !sudo tee > /dev/null %

if (exists('+colorcolumn'))
    set colorcolumn=120
    highlight ColorColumn ctermbg=8
endif
