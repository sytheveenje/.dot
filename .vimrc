call pathogen#runtime_append_all_bundles()
syntax on
filetype plugin indent on

" Display settings
set scrolloff=2         " 2 lines above/below cursor when scrolling
set matchpairs+=<:>     " specially for html
set number              " show line numbers
set matchtime=2         " show matching bracket for 0.2 seconds
set title               " Show file in titlebar
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.meta 

" Editor settings
set ignorecase
set smartcase
set linebreak
set cursorline
set autoindent
set noexpandtab
set tabstop=2
set shiftwidth=2
set incsearch
set hlsearch
set laststatus=1       " Always show the statusline

" System settings
set nobackup
set nowritebackup
set noswapfile
set nocompatible       " Disable vi-compatibility
set encoding=utf-8     " Necessary to show Unicode glyphs
set listchars=tab:▸\ ,eol:¬

" Toggle settings
set pastetoggle=<f5>

" Remapping
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <silent><Leader>l :set list!<CR>
nmap j gj
nmap k gk
nmap <C-e> :e#<CR>
nmap <silent> <leader>d <Plug>DashSearch
nnoremap <silent><Leader>/ :nohlsearch<CR>

" Color settings
set t_Co=256 " Color settings for iTerm
colorscheme baardbaard-256 " Picks colorscheme

" Changes CTRL-P directory to working directory
let g:ctrlp_working_path_mode = 0

" Reload .vimrc whenever it changes
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
