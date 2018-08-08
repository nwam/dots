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

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'leafgarland/typescript-vim'

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Syntax hilighting
sy on

" line numbers
set number

"very important
set autoindent

syntax enable
set grepprg=grep\ -nH\ $*

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
"au BufRead,BufNewFile *.py set expandtab
"au BufRead,BufNewFile *.c set noexpandtab
"au BufRead,BufNewFile *.h set noexpandtab
"au BufRead,BufNewFile Makefile* set noexpandtab

" tabs
set expandtab           " enter spaces when tab is pressed
set tabstop=2           " use 2 spaces to represent tab
set softtabstop=2
set shiftwidth=2        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler               " show line and column number
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line

