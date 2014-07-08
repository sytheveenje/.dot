" TODO
" neobundle
" syntastic / Done!
" gitgutter
" vim-tmux-navigator / Done!
" ack.vim / Done!
" snipmate
" vim-ctag
" vim-expand-region vmap v <Plug>(expand_region_expand)
" vmap <C-v> <Plug>(expand_region_shrink)
" It allows me to:

" Hit v to select one character
" Hit vagain to expand selection to word
" Hit v again to expand to paragraph
" ...
" Hit <C-v> go back to previous selection if I went too far
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" http://learnvimscriptthehardway.stevelosh.com/

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

" Code formatting
set tabstop=4			" number of columns in tab
set softtabstop=4		" number of columns in tab when editing
set shiftwidth=4		" number of columns indented with the indent operator
set noexpandtab			" tabs are tabs, not spaces
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

" Toggle settings
set pastetoggle=<f5>

" Remapping
let mapleader = "\<Space>"
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <silent><Leader>l :set list!<CR>
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
nnoremap <Leader>o :CtrlP<CR> " Open CTRL+P
nnoremap <silent><Leader>w :w<CR> " Save file
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Color settings
syntax enable
set background=light
colorscheme solarized

" Plugin settings

" Changes CTRL-P directory to working directory
let g:ctrlp_working_path_mode = 0

" CTRL-P ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'

" Make Ctrl-P plugin lot faster for git projects
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f'] " Deze twee commando's zorgen ervoor dat de custom ignore niet meer werkt ...
" let g:ctrlp_use_caching = 0 " Nog fixen  dus ...

"YouCompleteMe settings
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" DelimtMate settings
let delimitMate_expand_cr = 2

" Reload .vimrc whenever it changes
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"Syntastic settings
let g:syntastic_scss_checkers = ['scss_lint']
