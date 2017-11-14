set nu
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
" set cursorline
set tags=./tags;
let php_sql_query=1
let php_noShortTags=1
let php_parent_error_close=1
nnoremap <silent><C-e> :NERDTreeToggle<CR>
set showmatch

" NeoSnippetの設定
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" If php-cs-fixer is in $PATH, you don't need to define line below
if has('mac')
else
    let g:php_cs_fixer_path = '$HOME/.vim/phpCsFixer/php-cs-fixer' " define the path to the php-cs-fixer.phar
endif
let g:php_cs_fixer_level = 'all' " which level ?
let g:php_cs_fixer_config = 'default' " configuration
let g:php_cs_fixer_php_path = '/usr/local/bin/php' " Path to PHP
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = 'linefeed,short_tag,indentation'
let g:php_cs_fixer_enable_default_mapping = 1 " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0 " Call command with dry-run option
let g:php_cs_fixer_verbose = 0 " Return the output of command if 1, else an inline information.
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
"nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
" augroup phpCsFixer
"   autocmd!
"   autocmd BufWrite *.php :call PhpCsFixerFixFile()<CR>
" augroup END

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

    filetype off

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" Neocomplcacheの設定
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Unite.vimの設定
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>Unite file<CR>

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'stephpy/vim-php-cs-fixer'
NeoBundle 'tpope/vim-fugitive'

call neobundle#end()

filetype plugin indent on     " required!
filetype indent on
syntax on

NeoBundleCheck
