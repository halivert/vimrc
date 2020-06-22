filetype plugin indent on

call plug#begin('$HOME/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'chrisbra/unicode.vim'
Plug 'vim-test/vim-test'
Plug 'dhruvasagar/vim-table-mode'
Plug 'nelstrom/vim-visual-star-search'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-dispatch'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-projectionist'
Plug 'Shougo/context_filetype.vim'

" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Coc
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Denite
if has('nvim')
	Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/denite.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Laravel
Plug 'noahfrederick/vim-laravel'

" PHP
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
Plug 'dantleech/vim-phpunit'

" Latex
Plug 'lervag/vimtex', { 'for': 'tex' }

" Frontend
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" Jekyll
Plug 'parkr/vim-jekyll'
Plug 'tpope/vim-liquid'

" Emoji
Plug 'junegunn/vim-emoji'

" Themes
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()

call context_filetype#version()

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
let g:syntastic_html_tidy_ignore_errors=[
			\ 'proprietary attribute "ng-',
			\ 'trimming empty \<'
			\ ]
let g:syntastic_ignore_files=['\m\c\.xml$', '\m\c\.ts$']
let g:syntastic_python_checkers=['pylint']

" |----------|
" | Closetag |
" |----------|
let g:closetag_filenames='*.html,*.xhtml,*.phtml'
let g:closetag_filetypes='html,xhtml,phtml,blade,vue,markdown,liquid'

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
let g:blade_custom_directives = ['tovue', 'default']
let g:blade_custom_directives_pairs = {
			\   'cache': 'endcache',
			\   'canany': 'endcanany',
			\   'switch': 'endswitch',
			\   'error': 'enderror',
			\   'empty': 'endempty',
			\ }
let g:php_html_load=0
let g:php_sql_query=0

" |-------|
" | Latex |
" |-------|
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

" |---------|
" | Airline |
" |---------|
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#whitespace#mixed_indent_algo = 2

" |-----------|
" | Gitgutter |
" |-----------|
set signcolumn=yes

" |--------|
" | Denite |
" |--------|
call denite#custom#var('file/rec', 'com', [
			\ 'ag', '--follow', '--nocolor', '--hidden',
			\ '-U', '--nogroup', '-g', ''
			\ ])

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	nn <silent><buffer><expr> <cr> denite#do_map('do_action')
	nn <silent><buffer><expr> d denite#do_map('do_action', 'delete')
	nn <silent><buffer><expr> p denite#do_map('do_action', 'preview')
	nn <silent><buffer><expr> q denite#do_map('quit')
	nn <silent><buffer><expr> i denite#do_map('open_filter_buffer')
	nn <silent><buffer><expr> t denite#do_map('do_action', 'tabopen')
	nn <silent><buffer><expr> v denite#do_map('do_action', 'vsplit')
	nn <silent><buffer><expr> <space> denite#do_map('toggle_select')
endfunction

call denite#custom#var('grep', 'com', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
	imap <silent><buffer> <tab> <Plug>(denite_filter_quit)
	ino <silent><buffer><expr> <cr> denite#do_map('do_action')
	ino <silent><buffer><expr> <c-t> denite#do_map('do_action', 'tabopen')
	ino <silent><buffer><expr> <c-v> denite#do_map('do_action', 'vsplit')
	ino <silent><buffer><expr> <c-x> denite#do_map('do_action', 'split')
	ino <silent><buffer><expr> <esc> denite#do_map('quit')
	ino <silent><buffer> <C-j> <Esc><C-w>p:call cursor(line('.')+1,0)<cr><C-w>pA
	ino <silent><buffer> <C-k> <Esc><C-w>p:call cursor(line('.')-1,0)<cr><C-w>pA
endfunction

let s:denite_options = {
			\ 'auto_resize': 1,
			\ 'prompt': 'λ ',
			\ 'start_filter': 1,
			\ 'source_names': 'short',
			\ 'winheight': 10,
			\ 'winwidth': 69,
			\ 'split': 'floating',
			\ 'wincol': 7,
			\ 'winrow': 3,
			\ 'direction': 'topleft',
			\ 'highlight_filter_background': 'CursorLine',
			\ 'highlight_window_background': 'Type',
			\ }

call denite#custom#option('default', s:denite_options)

nn <silent> <space><space> :Denite buffer file/rec<cr>

" |-----|
" | Vue |
" |-----|
let g:vue_disable_pre_processors=1

" |-------------------|
" | Better whitespace |
" |-------------------|
nn <leader>s :StripWhitespace<cr>
let g:better_whitespace_operator='_s'

" |-----|
" | Coc |
" |-----|
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

ino <silent><expr> <c-space> coc#refresh()
nn <leader>f :call CocAction('format')<cr>

" |--------|
" | Jekyll |
" |--------|
let g:jekyll_post_extension='.md'
let g:jekyll_post_filetype = 'markdown'
let g:jekyll_post_template=[
			\ '---',
			\ 'author: halivert',
			\ 'title: "JEKYLL_TITLE"',
			\ 'date: "JEKYLL_DATE"',
			\ 'category: ""',
			\ 'tags: []',
			\ '---',
			\ '']

" |-------|
" | Emoji |
" |-------|
set completefunc=emoji#complete
nn <leader>emo :%s/:\(\w\+\):/\=emoji#for(submatch(1), submatch(0))/g<cr>
			\ let @/ = ""<cr>

" |-----|
" | Php |
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

" |-----|
" | C++ |
" |-----|
let g:clang_format#style_options = {
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "Standard" : "C++11"
			\ }

" |-------|
" | Theme |
" |-------|
let g:gruvbox_transparent_bg='1'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'

" |-------|
" | 2html |
" |-------|
let g:html_font = ['Iosevka', 'IBM Plex Mono']
let g:html_use_css = 1
let g:html_prevent_copy = "n"

" |-------|
" | Tests |
" |-------|
nn <silent> t<C-n> :TestNearest<CR>
nn <silent> t<C-f> :TestFile<CR>
nn <silent> t<C-s> :TestSuite<CR>
nn <silent> t<C-t> :TestLast<CR>
nn <silent> t<C-g> :TestVisit<CR>
