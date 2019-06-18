set nocompatible

if exists('py2') && has('python')
elseif has('python3')
endif

so ~/.vim/plugins.vim
so ~/.vim/functions.vim
so ~/.vim/secret.vim

set showcmd
set relativenumber
set number
syntax enable

let mapleader='`'
set splitbelow
set splitright
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set ruler
set wrap
set wildmenu
set hlsearch
set textwidth=78
set diffopt=vertical
set t_Co=256

colorscheme solarized
let w:solarized_style='dark'
set background=dark

if has('gui_running')
  set guifont=IBM\ Plex\ Mono\ 11
endif

nnoremap Q <nop>
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>y "+y
nmap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p

set viewoptions-=options
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

imap `? ¿
imap `! ¡
imap `<< «
imap `>> »

if (exists('+colorcolumn'))
  set colorcolumn=79
  highlight ColorColumn guibg=#5f8700 ctermbg=8
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

set updatetime=100
nmap <C-S> :tabe<CR>
nmap <C-_> :bd<CR>

set tags+=./.git/tags;
nnoremap <leader>c :silent! !git ctags<cr><C-L>

set foldmethod=indent
nmap <silent><leader>tc :call ToggleBackgroundTransparency()<cr>

let g:background_transparent=0
function! ToggleBackgroundTransparency()
  if g:background_transparent
    highlight Normal ctermbg=233
    let g:background_transparent=0
  else
    highlight Normal ctermbg=none
    let g:background_transparent=1
  endif
endfunction

set undofile
set undodir=~/.vim/undodir

" netrw
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=3
let g:netrw_winsize=25
