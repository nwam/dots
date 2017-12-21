"MAPPINGS
"remapping of escaping insert mode
inoremap jk <esc>
inoremap kj <esc>
inoremap <esc> <nop>
"remapping of autocomplete to ctrl space
inoremap <Nul> <C-n>
"moving lines up and down
nnoremap - ddp
nnoremap _ ddkkp
"unmap arrow keys because of bad habbits
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"Better movement
noremap l h
noremap ; l
noremap h ; 

"set the color scheme
colorscheme elflord
sy on

"set line numbers
set number

"very important
set autoindent

"for color scheme
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

"tab as 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"enable mouse
set mouse=a

"enable wildmenu (lists tab options)
set wildmenu
set wildmode=list:longest,full

"hilight things found with search
set hlsearch

"set copy/paste to global clipboard
set clipboard=unnamedplus

"enable indent folding
"set fdm=indent

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
"set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler               " show line and column number
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line

"Run filetype specific options
au Filetype html set tabstop=2
au Filetype html set shiftwidth=2
au Filetype html set softtabstop=2

