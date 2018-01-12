set nocompatible

so ~/.vim/plugins.vim

set showcmd
set rnu
syntax on

let mapleader = '`'
set path+=**
set splitbelow
set splitright
set autoindent
set expandtab
set sw=2
set softtabstop=2
set ruler
set wrap
set wildmenu
set hlsearch
set textwidth=117
set diffopt=vertical
let g:PHP_removeCRwhenUnix=1
colo solarized
nnoremap Q <nop>
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader><space> :nohlsearch<cr>
nmap <Leader>es :UltiSnipsEdit<cr>
nmap <Leader>y "+y
nmap <Leader>p "+p
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p
vnoremap // y/<C-R>"<cr>

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
