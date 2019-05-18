call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'alvan/vim-closetag'
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/vim-emoji'
Plug 'posva/vim-vue'
Plug 'tyru/caw.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'nelstrom/vim-visual-star-search'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'Shougo/context_filetype.vim'

" Denite
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'Shougo/denite.nvim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Laravel
Plug 'jwalton512/vim-blade', { 'for': 'php' }
Plug 'noahfrederick/vim-composer', { 'for': 'php' }
Plug 'noahfrederick/vim-laravel', { 'for': 'php' }

" PHP
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }

" Mustache
Plug 'mustache/vim-mustache-handlebars'

" Kotlin
Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }

" Latex
Plug 'lervag/vimtex', { 'for': 'tex' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }

" Frontend
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()
filetype plugin indent on

"  |-------|
"  | Latex |
"  |-------|
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" |-----------|
" | Syntastic |
" |-----------|
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_aggregate_errors = 1
let g:syntastic_cpp_compiler_options = "`pkg-config gtkmm-3.0 --libs --cflags`"
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-', 'trimming empty \<']
let g:syntastic_ignore_files = ['\m\c\.xml$', '\m\c\.ts$']
let g:syntastic_python_checkers = ['pylint']
let NERDTreeShowHidden=1

" |-----------|
" | Limelight |
" |-----------|
let g:limelight_default_coefficient = 0.7

" |----------|
" | Markdown |
" |----------|
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

" |----------|
" | Snippets |
" |----------|
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
let g:UltiSnipsSnippetDirectories=['/home/hali/.vim/snippets-used']
let g:jsx_ext_required = 0
let g:UltiSnipsEditSplit="vertical"

" |-----|
" | YCM |
" |-----|
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm/.ycm_extra_conf.py"

" |----------|
" | Mustache |
" |----------|
let mustache_abreviations = 1

" |------------|
" | Table mode |
" |------------|
let g:table_mode_corner = '|'
let g:table_mode_tableize_map = '<Leader>tz'

" |---------|
" | Airline |
" |---------|
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1

" |------------|
" | Close tags |
" |------------|
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" |----------|
" | NERDTree |
" |----------|
map <c-n> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" |--------|
" | Denite |
" |--------|
call denite#custom#var('file/rec', 'command',
\ ['ag', '--follow', '--nogroup', '-g', ''])
call denite#custom#option('default', 'prompt', '>')
call denite#custom#map(
\ 'insert',
\ '<C-J>',
\ '<denite:move_to_next_line>',
\ 'noremap'
\)
call denite#custom#map(
\ 'insert',
\ '<C-K>',
\ '<denite:move_to_previous_line>',
\ 'noremap'
\)
call denite#custom#map(
\ 'insert',
\ '<C-T>',
\ '<denite:do_action:tabopen>',
\ 'noremap'
\)
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nnoremap <silent> <space><space> :Denite buffer file/rec<cr>

Plug 'Valloric/YouCompleteMe', { 'on': [] }

augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('YouCompleteMe')
                     \| autocmd! load_us_ycm
  set completefunc=emoji#complete
augroup END

" |-------|
" | Emoji |
" |-------|
nmap <leader>emoji :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<cr>

" |----------|
" | Closetag |
" |----------|
let g:closetag_filetypes = 'html,xhtml,phtml,blade,vue'
call context_filetype#version()
