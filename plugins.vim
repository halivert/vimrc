call plug#begin('$HOME/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'alvan/vim-closetag'
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular' " Needed for plasticboy/vim-markdown
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'dhruvasagar/vim-table-mode'
Plug 'nelstrom/vim-visual-star-search'
Plug 'suy/vim-context-commentstring'
Plug 'altercation/vim-colors-solarized'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-dispatch'

" Prettier
Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x' }

" Coc
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

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

" Vue
Plug 'posva/vim-vue', { 'for': 'vue' }

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Laravel
Plug 'jwalton512/vim-blade', { 'for': ['php', 'blade'] }
Plug 'noahfrederick/vim-composer', { 'for': ['php', 'blade'] }
Plug 'noahfrederick/vim-laravel'

" PHP
Plug 'stanangeloff/php.vim', { 'for': 'php' }
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'ncm2/ncm2'
Plug '2072/PHP-Indenting-for-VIm'

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

" Jekyll
Plug 'parkr/vim-jekyll'
Plug 'tpope/vim-liquid'

" Emoji
Plug 'junegunn/vim-emoji'

call plug#end()
filetype plugin indent on

" |-----------|
" | Syntastic |
" |-----------|
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

let g:syntastic_aggregate_errors=1
let g:syntastic_cpp_compiler_options="`pkg-config gtkmm-3.0 --libs --cflags`"
let g:syntastic_html_tidy_ignore_errors=['proprietary attribute "ng-', 'trimming empty \<']
let g:syntastic_ignore_files=['\m\c\.xml$', '\m\c\.ts$']
let g:syntastic_python_checkers=['pylint']

" |----------|
" | Closetag |
" |----------|
let g:closetag_filenames='*.html,*.xhtml,*.phtml'
let g:closetag_filetypes='html,xhtml,phtml,blade,vue,markdown,liquid'

" |-----------|
" | Limelight |
" |-----------|
let g:limelight_default_coefficient=0.7

" |----------|
" | Markdown |
" |----------|
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

" |------------|
" | Table mode |
" |------------|
let g:table_mode_tableize_map='<Leader>tz'

" |---------|
" | Laravel |
" |---------|
let g:blade_custom_directives = ['tovue']
let g:blade_custom_directives_pairs = {
			\   'cache': 'endcache',
			\   'canany': 'endcanany',
			\ }
let g:php_html_load=0
let g:php_sql_query=0

"  |-------|
"  | Latex |
"  |-------|
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" |----------|
" | Snippets |
" |----------|
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=['/home/hali/.vim/snippets-used']
let g:jsx_ext_required=0
let g:UltiSnipsEditSplit="vertical"

" |----------|
" | Mustache |
" |----------|
let mustache_abreviations=1

" |---------|
" | Airline |
" |---------|
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_close_button = 0

" |-----------|
" | Gitgutter |
" |-----------|
set signcolumn=yes

" |--------|
" | Denite |
" |--------|
call denite#custom#var('file/rec', 'command',
			\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	nnoremap <silent><buffer><expr> <cr>
				\ denite#do_map('do_action')
	nnoremap <silent><buffer><expr> d
				\ denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p
				\ denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> q
				\ denite#do_map('quit')
	nnoremap <silent><buffer><expr> i
				\ denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> t
				\ denite#do_map('do_action', 'tabopen')
	nnoremap <silent><buffer><expr> v
				\ denite#do_map('do_action', 'vsplit')
	nnoremap <silent><buffer><expr> <space>
				\ denite#do_map('toggle_select')
endfunction

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
	imap <silent><buffer> <tab> <Plug>(denite_filter_quit)
	inoremap <silent><buffer><expr> <cr>
				\ denite#do_map('do_action')
	inoremap <silent><buffer><expr> <c-t>
				\ denite#do_map('do_action', 'tabopen')
	inoremap <silent><buffer><expr> <c-v>
				\ denite#do_map('do_action', 'vsplit')
	inoremap <silent><buffer><expr> <c-x>
				\ denite#do_map('do_action', 'split')
	inoremap <silent><buffer><expr> <esc>
				\ denite#do_map('quit')
	inoremap <silent><buffer> <C-j>
				\ <Esc><C-w>p:call cursor(line('.')+1,0)<cr><C-w>pA
	inoremap <silent><buffer> <C-k>
				\ <Esc><C-w>p:call cursor(line('.')-1,0)<cr><C-w>pA
endfunction

let s:denite_options = {
			\ 'auto_resize': 1,
			\ 'prompt': 'λ ',
			\ 'start_filter': 1,
			\ 'source_names': 'short',
			\ 'winheight': 10,
			\ 'winwidth': 80,
			\ 'split': 'floating',
			\ 'wincol': 45,
			\ 'winrow': 3,
			\ 'direction': 'topleft',
			\ 'highlight_filter_background': 'CursorLine',
			\ 'highlight_window_background': 'Type',
			\ }

call denite#custom#option('default', s:denite_options)

nnoremap <silent> <space><space>
			\ :Denite buffer file/rec<cr>

" |-----|
" | Vue |
" |-----|
let g:vue_disable_pre_processors=1

" |-----------|
" | Solarized |
" |-----------|
colorscheme solarized
silent! call togglebg#map("<F5>")

" |-------------------|
" | Better whitespace |
" |-------------------|
nnoremap <leader>s :StripWhitespace<cr>
let g:better_whitespace_operator='_s'

" |-----|
" | Coc |
" |-----|
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
command! -nargs=0 Format :call CocAction('format')
nn <leader>f :call CocAction('format')<cr>
" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
" call context_filetype#version()

" |--------|
" | Jekyll |
" |--------|
let g:jekyll_post_extension='.md'
let g:jekyll_post_filetype = 'markdown'
let g:jekyll_post_template=[
			\ '---',
			\ 'author: "Hali"',
			\ 'title: "JEKYLL_TITLE"',
			\ 'date: "JEKYLL_DATE"',
			\	'categories: []',
			\ '---',
			\ '']

" |-------|
" | Emoji |
" |-------|
nn <leader>emo :%s/:\(\w\+\):/\=emoji#for(submatch(1), submatch(0))/g<cr>
			\ /\asonetuh<cr>

" |-----|
" | PHP |
" |-----|

no <Leader>u :call phpactor#UseAdd()<CR>
no <Leader>mm :call phpactor#ContextMenu()<CR>
no <Leader>nn :call phpactor#Navigate()<CR>
no <Leader>o :call phpactor#GotoDefinition()<CR>
no <Leader>K :call phpactor#Hover()<CR>
no <Leader>tt :call phpactor#Transform()<CR>
no <Leader>cc :call phpactor#ClassNew()<CR>
no <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
vn <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
vn <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
