call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'alvan/vim-closetag'
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tyru/caw.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'nelstrom/vim-visual-star-search'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'Shougo/context_filetype.vim'
Plug 'altercation/vim-colors-solarized'

" Prettier
Plug 'sbdchd/neoformat'

" Coc
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" YCM
" Plug 'Valloric/YouCompleteMe', {
"      \ 'do': 'python3 install.py --clang-completer'
"      \ }

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

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

let g:syntastic_aggregate_errors=1
let g:syntastic_cpp_compiler_options="`pkg-config gtkmm-3.0 --libs --cflags`"
let g:syntastic_html_tidy_ignore_errors=['proprietary attribute "ng-', 'trimming empty \<']
let g:syntastic_ignore_files=['\m\c\.xml$', '\m\c\.ts$']
let g:syntastic_python_checkers=['pylint']

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

" |----------|
" | Snippets |
" |----------|
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
let g:UltiSnipsSnippetDirectories=['/home/hali/.vim/snippets-used']
let g:jsx_ext_required=0
let g:UltiSnipsEditSplit="vertical"

" |-----|
" | YCM |
" |-----|
" let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
" let g:ycm_show_diagnostics_ui=0
" let g:ycm_global_ycm_extra_conf="~/.vim/ycm/.ycm_extra_conf.py"

" |----------|
" | Mustache |
" |----------|
let mustache_abreviations=1

" |------------|
" | Table mode |
" |------------|
let g:table_mode_corner='|'
let g:table_mode_tableize_map='<Leader>tz'

" |---------|
" | Airline |
" |---------|
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1

" |------------|
" | Close tags |
" |------------|
let g:closetag_filenames='*.html,*.xhtml,*.phtml'

" |--------|
" | Denite |
" |--------|
call denite#custom#var('file/rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
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
  nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
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
  inoremap <silent><buffer><expr> <CR>
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
        \ <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
  inoremap <silent><buffer> <C-k>
        \ <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
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

" |----------|
" | Closetag |
" |----------|
let g:closetag_filetypes='html,xhtml,phtml,blade,vue'
call context_filetype#version()

" |-----|
" | Vue |
" |-----|
let g:vue_disable_pre_processors=1

" |-----------|
" | Solarized |
" |-----------|
silent! call togglebg#map("<F5>")

" |-----|
" | Coc |
" |-----|
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
