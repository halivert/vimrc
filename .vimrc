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
set tabstop=2
set shiftwidth=2

set ruler
set wrap
set wildmenu
set hlsearch
set diffopt=vertical
set termguicolors
set timeoutlen=500

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
nn <leader><leader> :let @/ = ""<cr>
nm <leader>y "+y
nm <leader>p "+p
vn <leader>y "+y
vn <leader>p "+p

vn J :m '>+1<cr>gv=gv
vn K :m '<-2<cr>gv=gv

nn <leader># :so $MYVIMRC<cr>

set viewoptions=folds,cursor
augroup AutoSaveFolds
	autocmd!
	autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview
	autocmd BufWinEnter ?* silent! loadview
augroup end

ino `<< «
ino `>> »

set textwidth=80
if (exists('+colorcolumn'))
	set colorcolumn=81
	highlight ColorColumn guibg=#5f8700 ctermbg=8
endif

set lazyredraw
set regexpengine=1
set keywordprg=online-search

set updatetime=200
nn <C-S> :tabe<CR>
nn <C-_> :bd<CR>

nn <C-TAB> :bn<CR>
nn <C-S-Tab> :bp<CR>

set tags+=./.git/tags;
nn <leader>c :silent! !git ctags<cr><C-L>

set undofile
cno help tab help

" Use with anne pro 2 dvorak layout (es layout)
" no ñ :

" Use with anne pro 2 dvorak layout (us layout)
no ; :
no : ;

" so solarizedTheme.vim
colo gruvbox

set undodir=$HOME/.vim/undodir
if exists("configPath")
	execute "nn <leader>ev :tabedit " . configPath . "/.vimrc"
	execute "nn <leader>ep :tabedit " . configPath . "/plugins.vim"
endif

function! InitialBackground()
	let l:initial = split("10:00", ":")
	let l:final = split("19:00", ":")
	let l:now = split(strftime("%H:%M"), ":")

	let l:initialToNow = ((l:now[0] * 60 + l:now[1]) - (l:initial[0] * 60 + l:initial[1]))
	let l:nowToFinal = ((l:now[0] * 60 + l:now[1]) - (l:final[0] * 60 + l:final[1]))

	if (l:initialToNow > 0 && l:nowToFinal < 0)
		set background=light
	else
		set background=dark
	endif
endfunction

call InitialBackground()

autocmd BufRead,BufNewFile *.vifm set filetype=vim
