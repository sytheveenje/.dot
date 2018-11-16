syntax on
filetype plugin indent on
filetype indent on

call plug#begin('~/.vim/plugged')

" Vim-plug color schemes
Plug 'altercation/vim-colors-solarized'

" Vim-plug plugins
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'justinj/vim-pico8-syntax'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jwalton512/vim-blade'
Plug 'mustache/vim-mustache-handlebars'
Plug 'lumiliet/vim-twig'
Plug 'vexxor/phpdoc.vim'
Plug 'elmcast/elm-vim'
Plug 'mileszs/ack.vim'
" Plug 'shumphrey/fugitive-gitlab.vim'
" Plug 'tommcdo/vim-fubitive'
Plug 'embear/vim-localvimrc'
" Plug 'Chun-Yang/vim-action-ag'
" Plug 'Yggdroot/indentLine'
" Plug 'joonty/vim-phpqa'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'majutsushi/tagbar'
" Plug 'ervandew/supertab'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'tommcdo/vim-fubitive'
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'scrooloose/syntastic'
" Plug 'neomake/neomake'

call plug#end()

" Editor settings
syntax enable           " Switches on syntax highlighting.
set scrolloff=2         " 2 lines above/below cursor when scrolling.
set matchpairs+=<:>     " Specially for HTML.
set number              " Show line numbers.
set matchtime=2         " Show matching bracket for 0.2 seconds.
set title               " Show file in titlebar.
set colorcolumn=80      " Mark where column is at 80 characters.
set autoread            " Reload files when they are updated.
set linebreak           " On long lines break at a good point.
set laststatus=1        " Always show the statusline.
set equalalways         " Windows are same size when splitting.
set nofoldenable        " Disable code folding.
set background=dark     " Will try to use colors that will look good on dark background.
set diffopt+=vertical
colorscheme solarized

" Code format settings
set tabstop=4           " Width of a hard tabstop measured in spaces.
set softtabstop=4       " Number of spaces that tab counts while editing.
set shiftwidth=4        " Size of an indent.
set noexpandtab         " Don't insert spaces instead of tab characters.
set smartindent         " Do smart auto-indenting when starting a new line.
set autoindent          " Copy indent from current line when starting a new line.
:filetype indent on     " When file is edited, it's plugin file is loaded.

" Search
set ignorecase          " Case-insensitive search.
set smartcase           " Case-sensitive search if query contains caps.
set incsearch           " Search as you type.
set hlsearch            " Highlight search results.

" System
set nocompatible        " Disable vi-compatibility. Gets ignored by Nvim.
set nobackup            " Don't make backups.
set nowritebackup       " Don't make backups before overwriting a file.
set noswapfile          " Don't use a swap file for the buffer.
set encoding=utf-8      " Necessary to show Unicode glyphs.
set undofile            " Persistent undo.
set undodir=~/.vim/undodir " Directory of persistent undo.
set clipboard+=unnamedplus " Use clipboard of system.

" Netwr
let g:netrw_banner = 0                         " Hide banner.
let g:netrw_liststyle=3                        " Set tree style listing.
let g:netrw_browse_split = 4                   " Open file in a previous buffer (right window).
let g:netrw_altv = 1                           " Vspilt netrw to the left window.
let g:netrw_winsize = 25                       " 25% of the screen for the netrw window.
let g:netrw_list_hide='netrw_gitignore#Hide()' " Hide stuff in your .gitingore
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S+'   " Hide swp, DS_Store files.
let g:netrw_sort_sequence='[\/]$'              " Display directories first.
let g:netrw_sort_options='i'                   " Ignore case on sorting.
let g:netrw_bufsettings = 'nomodifiable nomodified readonly nobuflisted nowrap number' " Buffer setting.

" JSON
let g:vim_json_syntax_conceal = 0 " Don't hide JSON quotes.

" Commands
command! MakeTags !ctags -R .

" Mappings: Window resizing
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" Mappings: Movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Mappings: PHPUnit tests
nmap <leader>t :!clear && phpunit<cr>
nmap <leader>f :!clear && phpunit %<cr>
nmap <leader>m yiw:!clear && phpunit --filter " %<cr>

" Yarn run scripts
map <leader>b :!yarn run build<cr> 

" Mappings: Snippets
nnoremap <Leader>html :-1read $HOME/.vim/snippets/.skeleton.html<CR>3jwf>a

" Mappings: Misc
" Make spacebar the leader.
nnoremap <Space> <Nop>
let mapleader = "\<Space>"
" Open file explorer.
nmap <silent><C-D> :Lexplore<CR>
" map <C-D> :NERDTreeToggle<CR>
" Toggle list.
nmap <silent><Leader>l :set list!<CR>
" Remove search highlight.
nnoremap <silent><Leader>/ :nohlsearch<CR>
" Save file.
nnoremap <silent><Leader>w :w<CR>
" Toggles the tagbar.
" nnoremap <silent><Leader>b :TagbarToggle<CR>
" PHP doc
noremap <leader>pd :call PhpDoc()<CR>
" Toggle paste.
set pastetoggle=<f5>

" Plugin: CTRL-P
let g:ctrlp_map = '<Leader>o' " Open CTRL-P.
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|dist'	" CTRL-P ignore.

" Plugin: Ag.vim - The Silver Searcher
let g:ag_working_path_mode="r" " Start searching from your project root instead of the cwd.

" Plugin: Ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Plugin: Elm
let g:elm_format_autosave = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

" Plugin: Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

" Plugin: php.vim
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

" Plugin: vim-phpqa
" let g:phpqa_codesniffer_autorun = 0
let g:phpqa_codesniffer_cmd='./vendor/bin/phpcs'

" Function: Strips trailing whitespace when file is saved.
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre *.php,*.js,*.scss :call <SID>StripTrailingWhitespaces()

" Function: Make cursorline only visible in active window.
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

" Function: Switch between tabs and spaces with <F9>.
let my_tab=4
execute "set shiftwidth=".my_tab
execute "set softtabstop=".my_tab
set expandtab
" Allow toggling between local and default mode.
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

" !! Don't know what everything below this line does. !!
" set listchars=tab:▸\ ,eol:¬ 
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]
" vmap <Leader>P "+P
" nmap j gj
" nmap k gk
" nmap <C-e> :e#<CR>
" nnoremap <leader>i :CtrlPTag<cr>
"
" augroup phpSyntaxOverride
"   autocmd!
"   autocmd FileType php call PhpSyntaxOverride()
" augroup END
