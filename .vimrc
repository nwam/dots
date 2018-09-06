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

"arrow key insert fix
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi

" Vundle
set nocompatible              " required
filetype off                  " required

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'leafgarland/typescript-vim'
Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()            " required Vundle
filetype plugin indent on    " required Vundle

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

set encoding=utf-8

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

