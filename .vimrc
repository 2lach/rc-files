" ~/.vimrc
 " 2lach

" Vimplug | https://github.com/junegunn/vim-plug
call plug#begin()
" Themes
Plug 'fugalh/desert.vim'
Plug 'cocopon/iceberg.vim'
Plug 'gf3/molotov'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
" Format
" #Plug 'sbdchd/neoformat'

" Autocomplete
Plug 'machakann/vim-highlightedyank'
" Plug 'ycm-core/YouCompleteMe' " for *nix apt install build-essential cmake vim-nox python3-dev
Plug 'moll/vim-node'
Plug 'dense-analysis/ale'

" Shorthand notation
Plug 'junegunn/vim-easy-align'

" Vim filetree           | Lazyload
Plug 'preservim/nerdtree',{ 'on':'NERDTreeToggle' }
" Initialize plugin system
call plug#end()

" Turn on filetype detection plugin and indent
if exists(":filetype") == 2
  filetype plugin indent on
endif

" Always turn syntax highlighting on
" should come after filetype plugin command
if has("syntax")
  syntax on
endif

syntax enable
colorscheme molotov
"evening dracula snazzy ron
set background=dark

set termguicolors
set t_Co=256

" Make Vim more useful
set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swap
if exists("&undodir")
        set undodir=~/.vim/undo
endif

" keep an undofile
set undofile

" keep viminfo file in .vim dir
set viminfo+=n~/.vim/viminfo

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4

" Enable line numbers
set number

" use mouse
set mouse=a

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

" Make tabs as wide as two spaces
set tabstop=2

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Use relative line numbers
if exists("&relativenumber")
        set relativenumber
        au BufReadPost * set relativenumber
endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (/ss)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
        " Enable file type detection
        filetype on
        " Treat .json files as .js
        autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
        " Treat .md files as Markdown
        autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" set cursor
let &t_SI = "\<Esc>]50;CursorShape=2\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=2\x7"

" Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" Cursor Mode Settings
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[1 q" "SR = REPLACE mode
let &t_EI.="\e[3 q" "EI = NORMAL mode (ELSE)

"""""""""""""""""""""
" === NerdTREE ==== "
"""""""""""""""""""""
" show hidden files
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticaly close vim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" toogle with <Ctrl> + n
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""
" ===  Airline ==== "
"""""""""""""""""""""
let g:airline_theme='google_dark' " google_light papercolor
let g:airline_extensions = []
let g:airline#extensions#ale#enabled = 1

"""""""""""""""""""""""""""""""
" === vim-highlightedyank === "
"""""""""""""""""""""""""""""""
if !exists('##TextYankPost')
        map Y <Plug>(highlightedyank)
        map y <Plug>(highlightedyank)
endif

let g:highlightedyank_highlight_duration = 450

""""""""""""""""""""""""""""
" === ALE === "
""""""""""""""""""""""""""""

let g:ale_fixers = {
\   'astro': ['prettier'],
\   'css': ['prettier'],
\   'javascript': ['prettier'],
\   'javascriptreact': ['prettier'],
\   'json': ['prettier'],
\   'python': ['black', 'isort'],
\   'sh': ['shellcheck'],
\   'yaml': ['yamllint'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" Fix on save
let g:ale_fix_on_save = 1

" Fix on save
let g:ale_fix_on_save = 1

" Disable whitespace warnings
" let g:ale_warn_about_trailing_whitespace = 0

" list current file config with
" :ALEInfo

" Set this in your vimrc file to disabling highlighting
" let g:ale_set_highlights = 0

" The quickfix list can be enabled by turning the g:ale_set_quickfix option on. If you wish to also disable the loclist, you can disable the g:ale_set_loclist option.
" let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1

" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0

" You can disable this option too
" if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 0

"""""""""""""""""""""""""""""""