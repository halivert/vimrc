call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'Shougo/denite.nvim'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'alvan/vim-closetag'
" Plug 'posva/vim-vue'
Plug 'tyru/caw.vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'dhruvasagar/vim-table-mode'
Plug 'nelstrom/vim-visual-star-search'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'powerline/powerline-fonts'
" Haskell
" Plug 'yogsototh/haskell-vim'
" Plug 'enomsg/vim-haskellConcealPlus'
" Plug 'eagletmt/ghcmod-vim'
" Plug 'eagletmt/neco-ghc'
" Plug 'Twinside/vim-hoogle'
" Plug 'pbrisbin/html-template-syntax'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Ctags
Plug 'craigemery/vim-autotag'

" Angular
" Plug 'burnettk/vim-angular'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" React
" Plug 'mxw/vim-jsx'

" Javascript
Plug 'pangloss/vim-javascript'

" Laravel
Plug 'jwalton512/vim-blade'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'

" PHP
Plug '2072/PHP-Indenting-for-VIm'

" PHP
Plug '2072/PHP-Indenting-for-VIm'

" Mustache
Plug 'mustache/vim-mustache-handlebars'

" Kotlin
Plug 'udalov/kotlin-vim'

" Latex
Plug 'vim-latex/vim-latex'
" Dev icons
" Plug 'ryanoasis/vim-devicons'
call plug#end()
filetype plugin indent on

" ------------
"  Latex
" ------------

" set grepprg=grep\ -nH\ $*
" let g:tex_flavor='latex'
" command! -nargs=1 Silent
"       \ | execute ':silent !'.<q-args>
"       \ | execute ':redraw!'

" ------------
" Syntastic
" ------------

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
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
let NERDTreeShowHidden=1

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
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_show_diagnostics_ui = 0

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
let g:airline_theme = 'minimalist'

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" ------------
" Close tags
" ------------

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" ------------
" NERDTree
" ------------

map <c-n> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
