set nocompatible

if exists('py2') && has('python')
elseif has('python3')
endif

so ~/.vim/plugins.vim
so ~/.vim/functions.vim

set showcmd
set rnu
set nu
syntax on

let mapleader = '`'
" Window is put bellow current one
set sb
" Windows is put right of the current one
set spr
set autoindent
set expandtab
set sw=2
set ts=2
set softtabstop=2
set ruler
set wrap
set wildmenu
set hlsearch
set textwidth=72
set diffopt=vertical
set emo
let g:PHP_removeCRwhenUnix=1
let w:solarized_style='dark'
set t_Co=256
colo solarized
set background=dark

if has('gui_running')
  set guifont=IBM\ Plex\ Mono\ 11
endif

nnoremap Q <nop>
nmap <leader>ev :tabedit $MYVIMRC<cr>
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

imap `? ¿
imap `! ¡

if (exists('+colorcolumn'))
  set colorcolumn=73
  highlight ColorColumn guibg=#5f8700 ctermbg=0
endif

let g:elite_mode=1
if get(g:, 'elite_mode')
  nnoremap <Up> <nop>
  nnoremap <Down> <nop>
  nnoremap <Left> <nop>
  nnoremap <Right> <nop>
endif

set lazyredraw
set regexpengine=1

command -nargs=1 E execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e
  \ <args>
let g:vue_disable_pre_processors=1
set updatetime=100
nmap <C-S> :tabe<CR>
nmap <C-W> :bd<CR>
