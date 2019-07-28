set nocompatible

if exists('py2') && has('python')
elseif has('python3')
endif

set showcmd
set relativenumber
set number
syntax enable

let mapleader='`'
set splitbelow
set splitright
set autoindent
set noexpandtab
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

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1

if has('gui_running')
  set guifont=IBM\ Plex\ Mono\ 11
endif

set nobackup
set nowritebackup
set shortmess+=c
set pyxversion=3
set hidden

nnoremap Q <nop>
nnoremap <leader>es :UltiSnipsEdit<cr>
nmap <leader>y "+y
nmap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p

nnoremap <leader># :so $MYVIMRC<cr>

set viewoptions=folds,cursor
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview
  autocmd BufWinEnter ?* silent! loadview
augroup end

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
set keywordprg=online-search

set updatetime=100
nnoremap <C-S> :tabe<CR>
nnoremap <C-_> :bd<CR>

set tags+=./.git/tags;
nnoremap <leader>c :silent! !git ctags<cr><C-L>

nnoremap <silent><leader>tc :call ToggleBackgroundTransparency()<cr>

function! ToggleBackgroundTransparency()
  if g:solarized_termtrans
    let g:solarized_termtrans=0
    colo solarized
  else
    let g:solarized_termtrans=1
    colo solarized
  endif
endfunction

set undofile
cno help tab help
noremap ; :
noremap : ;

set undodir=$HOME/.vim/undodir
if exists("configPath")
	execute "nnoremap <leader>ev :tabedit " . configPath . "/.vimrc"
endif
