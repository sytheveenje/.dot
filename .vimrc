syntax on
filetype plugin indent on
filetype indent on

call plug#begin('~/.vim/plugged')

" Vim-plug color schemes {{{1
Plug 'altercation/vim-colors-solarized'

" Vim-plug plugins {{{1
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jwalton512/vim-blade'
Plug 'evidens/vim-twig'
Plug 'embear/vim-localvimrc'
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'Yggdroot/indentLine'
Plug 'vexxor/phpdoc.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'majutsushi/tagbar'

call plug#end()

" Display {{{1
set scrolloff=2         " 2 lines above/below cursor when scrolling
set matchpairs+=<:>     " specially for html
set number              " show line numbers
set matchtime=2         " show matching bracket for 0.2 seconds
set title               " Show file in titlebar
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.meta,*.png,*.jpg
set colorcolumn=80      " Mark where column is at 80 characters

" Make cursorline only visible in active window
augroup highlight_follows_focus
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

augroup highligh_follows_vim
    autocmd!
    autocmd FocusGained * set cursorline
    autocmd FocusLost * set nocursorline
augroup END

" Code formatting {{{1
set tabstop=4
set softtabstop=4       " number of columns in tab when editing
set shiftwidth=4
set noexpandtab
set smartindent
set autoindent

" PHP folding
" let php_folding=1

" Editor {{{1
set autoread            " reload files when they are updated
set linebreak
set cursorline
set laststatus=1        " always show the statusline
set equalalways
set nofoldenable        " disable folding
:filetype indent on

" Reload .vimrc whenever it changes
" augroup reload_vimrc " {
"   autocmd!
"   autocmd BufWritePost $MYVIMRC source $MYVIMRC
" augroup END " }

" virtual tabstops using spaces
let my_tab=4
execute "set shiftwidth=".my_tab
execute "set softtabstop=".my_tab
set expandtab
" allow toggling between local and default mode
function! TabToggle()
  if &expandtab
    set shiftwidth=4
    set softtabstop=0
    set noexpandtab
  else
    execute "set shiftwidth=".g:my_tab
    execute "set softtabstop=".g:my_tab
    set expandtab
  endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z

nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" Persistent undo
set undofile
set undodir=~/.vim/undodir

" Search {{{1
set ignorecase          " case-insensitive search
set smartcase           " case-sensitive searc if query contains caps
set incsearch           " search as you type
set hlsearch            " highlight search results

" System {{{1
set nobackup
set nowritebackup
set noswapfile
set nocompatible        " Disable vi-compatibility
set encoding=utf-8      " Necessary to show Unicode glyphs
set listchars=tab:▸\ ,eol:¬
set clipboard=unnamed

" Color {{{1
syntax enable
set background=light
colorscheme solarized

" Remapping {{{1
nnoremap <Space> <Nop>
map <Space> <Leader>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> <C-D> :Lexplore<CR>
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
vmap <Leader>P "+P
nmap <leader>wcd :VimwikiMakeDiaryNote<cr>
nmap <Leader>f :tag<space>

"Tag bar
nnoremap <silent> <Leader>b :TagbarToggle<CR>

"
nnoremap <silent> <Leader>t :CtrlPTag<CR>

" Toggle settings {{{1
set pastetoggle=<f5>

" Plugin settings {{{1

" IndentLine {{{2

" CTRL-P {{{2
let g:ctrlp_map = '<Leader>o'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'	" CTRL-P ignore

" Ag.vim: The Silver Searcher {{{2
" nmap \ :Ag<space>
let g:ag_working_path_mode="r" " start searching from your project root instead of the cwd

" Syntastic  {{{2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_html_tidy_exec = 'tidy5'

" Netwr {{{2
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = -28
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu'  " --> I want line numbers on the netrw buffer
nnoremap <silent> <leader>k :Lexplore<cr>

" php.vim  {{{2
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

" PHP doc {{{2
noremap <leader>pd :call PhpDoc()<CR>

" Vimwiki {{{2
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END


" Tips & Tricks {{{1

" Ctags {{{2
" :tag      Search for instance.
" :tn       Go to next instance.
" :tp       Go to previous instance.
" :ts       Get list of instances.

" :so %     Reload .vimrc file
