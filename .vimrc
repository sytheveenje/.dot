syntax on
filetype plugin indent on
filetype indent on

call plug#begin('~/.vim/plugged')

" Vim-plug color schemes
Plug 'altercation/vim-colors-solarized'

" Vim-plug plugins
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jwalton512/vim-blade'
Plug 'embear/vim-localvimrc'

call plug#end()

" Display settings
set scrolloff=2         " 2 lines above/below cursor when scrolling
set matchpairs+=<:>     " specially for html
set number              " show line numbers
set matchtime=2         " show matching bracket for 0.2 seconds
set title               " Show file in titlebar
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.meta,*.png,*.jpg
set colorcolumn=80      " Mark where column is at 80 characters

" Code formatting
set tabstop=4
set shiftwidth=4
set expandtab
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

" Reload .vimrc whenever it changes
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
