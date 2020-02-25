set nocompatible

if exists('py2') && has('python')
elseif has('python3')
endif

set showcmd
set relativenumber
set number
syntax enable

let mapleader='\'
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
set termguicolors

if has('gui_running')
	set guifont=IBM\ Plex\ Mono\ 11
endif

set nobackup
set nowritebackup
set shortmess+=c
set pyxversion=3
set hidden

nn Q <nop>
nn <leader>es :UltiSnipsEdit<cr>
nmap <leader>y "+y
nmap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p

nn <leader># :so $MYVIMRC<cr>

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

set lazyredraw
set regexpengine=1
set keywordprg=online-search

set updatetime=100
nn <C-S> :tabe<CR>
nn <C-_> :bd<CR>

set tags+=./.git/tags;
nn <leader>c :silent! !git ctags<cr><C-L>

set undofile
cno help tab help

" Use with anne pro 2 dvorak layout (es layout)
" noremap ñ :

" Use with anne pro 2 dvorak layout (us layout)
noremap ; :
noremap : ;

" so solarizedTheme.vim
colo archery

set undodir=$HOME/.vim/undodir
if exists("configPath")
	execute "nn <leader>ev :tabedit " . configPath . "/.vimrc"
endif
