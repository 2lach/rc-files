" 
" Neovim config of
" 	Stefan Lachmann
" 	@2lach 
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
" either add plugins here or:
" source ~/.config/nvim/plugins.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" setup directories
"""""""""""""""""""

silent !mkdir -p ~/.config/nvim/_backup ~/.config/nvim/_temp ~/.config/nvim/_undo
set backupdir=~/.config/nvim/_backup    " where to put backup files
set directory=~/.config/nvim/_temp      " where to put swap files
set undodir=~/.config/nvim/_undo        " where to save undo histories
set viminfo+=n~/.config/nvim/viminfo		" keep viminfo file in .nvim dir

""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""

set clipboard+=unnamedplus              " use system clipboard
set shortmess=at                        " Abbr mess +truncate when necessary
set encoding=utf-8 nobomb               " Use UTF-8 without BOM

set number															" show line numbers
set rnu                                 " set relative number
set ruler                               " show ruler
set cursorline                          " Highlight cursorline
set showcmd                             " show cmdline input 
set wrap                                " handle long lines nicely.

set shiftwidth=2                        " an autoindent is two spaces
set tabstop=2                           " Make tabs as wide as two spaces
set modeline                            " Respect modeline in files
set modelines=4

set list                                " show invisible characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_    " display them
set noeol                               " Don’t add empty newlines at the end of files
set showmatch                           " show matching braces
set shell=$SHELL                        " current shell
set backspace=indent,eol,start          " Allow backspace in insert mode

set undofile
set undolevels=1000                     " How many undos
set undoreload=10000                    " number of lines to save for undo

set cmdheight=2                         " commandline window

"Tab in cmdline shows menu with buffers and filenames
" set wildchar=<Tab> wildmenu wildmode=full
set laststatus=2                        " Always show status line
set showmode                            " Show the current mode

if has('mouse')                         " enable mouse if it exists
	set mouse=a
endif

" mode based cursor shape "
set guicursor=n-v:block-nCursor             " block in normal
set guicursor=r:block20-lCursor-blinkon250  " vertical in insert 
" blinking block in replace
set guicursor=i-ci:ver30-iCursor-blinkwait300-blinkon250-blinkoff250

syntax on                                " Enable syntax highlighting
set hidden                               " Allow backgrounding buffers 
set title                                " Show the filename in the window titlebar

" colorscheme
if (has("termguicolors"))
	set termguicolors
endif


" colorscheme molotov | needs to be installed
colorscheme desert 		" acceptable default
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" System settings
"""""""""""""""""

" open new split panes to right and below
set splitright
set splitbelow

" binary paths // get it with $(which <binary>)
let g:python3 = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ruby_host_prog='/usr/bin/ruby'
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins settings
""""""""""""""""""
" either add plugin-settings here or:
" source ~/.config/nvim/plugins-settings.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fixes & autocmds 
"""""""""""""""""""

" Reload icons after init source | requires plugin webdevicons
if exists('g:loaded_webdevicons')
	call webdevicons#refresh()
endif

" set cursor to blinking underline on exit (iTerm2) tnx @gnachman!
au VimLeave * set guicursor=a:hor250-blinkon1

" save all files when focus is lost without warnings
augroup configgroup
	autocmd!
"""""""""""""""""""""""""""""""""""""""""""""""""""""
