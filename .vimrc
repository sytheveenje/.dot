syntax on
filetype plugin indent on
filetype indent on

call pathogen#runtime_append_all_bundles()

" Display settings
set scrolloff=2         " 2 lines above/below cursor when scrolling
set matchpairs+=<:>     " specially for html
set number              " show line numbers
set matchtime=2         " show matching bracket for 0.2 seconds
set title               " Show file in titlebar
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.meta,*.png,*.jpg
set colorcolumn=80      " Mark where column is at 80 characters

" Code formatting
set tabstop=2           " number of columns in tab
set softtabstop=2       " number of columns in tab when editing
set shiftwidth=2        " number of columns indented with the indent operator
set noexpandtab         " tabs are tabs, not spaces
set smartindent
set autoindent

" Editor settings
set autoread            " reload files when tye are updated
set linebreak
set cursorline
set laststatus=1        " always show the statusline
set equalalways
:filetype indent on

" Search settings
set ignorecase          " case-insensitive search
set smartcase           " case-sensitive searc if query contains caps
set incsearch           " search as you type
set hlsearch            " highlight search results

" System settings
set nobackup
set nowritebackup
set noswapfile
set nocompatible        " Disable vi-compatibility
set encoding=utf-8      " Necessary to show Unicode glyphs
set listchars=tab:▸\ ,eol:¬

" Color settings
syntax enable
set background=light
colorscheme solarized

" Remapping
nnoremap <Space> <Nop>
map <Space> <Leader>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <silent> <Leader>l :set list!<CR>
nmap j gj
nmap k gk
nmap <C-e> :e#<CR>
nmap <silent><leader>d <Plug>DashSearch
nmap <Leader><Leader> V
vmap <Leader>y "+y      " Copy & paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nnoremap <silent><Leader>/ :nohlsearch<CR>
nnoremap <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>
nnoremap <silent><Leader>w :w<CR> " Save file
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Toggle settings
set pastetoggle=<f5>

" Plugin settings

" Changes CTRL-P directory to working directory
let g:ctrlp_map = '<Leader>o'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'	" CTRL-P ignore

" Make Ctrl-P plugin lot faster for git projects
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f'] 
" Deze twee commando's zorgen ervoor dat de custom ignore niet meer werkt ...
" let g:ctrlp_use_caching = 0 " Nog fixen  dus ...

"YouCompleteMe settings
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" DelimtMate settings
let delimitMate_expand_cr = 2

" Syntastic settings
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_html_tidy_exec = 'tidy5'

" php.vim settings
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

let php_ignore_phpdoc=1
let g:phpcomplete_enhance_jump_to_definition = 0

" UltiSnips
set runtimepath+=~/.vim/bundle/ultisnips
let g:UltiSnipsEditSplit="horizontal"

" Make UltiSnips and YCM play nice
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
							return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Reload .vimrc whenever it changes
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
