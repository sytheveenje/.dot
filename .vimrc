call pathogen#runtime_append_all_bundles()
syntax on
filetype plugin indent on
set incsearch
set ignorecase
set smartcase
set linebreak
set number
set cursorline
set autoindent
set noexpandtab
set tabstop=2
set shiftwidth=2
set nobackup
set nowritebackup
set noswapfile
set hlsearch
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.meta 
set listchars=tab:▸\ ,eol:¬

au BufNewFile,BufRead *.less set filetype=less

" Remapping
nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <silent><Leader>l :set list!<CR>
nnoremap <silent><Leader>/ :nohlsearch<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap j gj
nmap k gk
nmap <C-e> :e#<CR>

" Changes CTRL-P directory to working directory
let g:ctrlp_working_path_mode = 0

" Color settings for iTerm
set t_Co=256

" Picks colorscheme
colorscheme baardbaard-256

" Reload .vimrc whenever it changes
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Remove GUI from Mac Vim.
if has("gui_running")
    set guioptions=egmrt
endif
