""""""""""""""""""""""""""""
"         Vundle
""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Nerdtree / Filetree view
Plugin 'scrooloose/nerdtree'

" Ctrlp / Nice file searching
Plugin 'ctrlpvim/ctrlp.vim'

" Nice status bar
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Ack support
Plugin 'mileszs/ack.vim'

" Go support
Plugin 'fatih/vim-go'

" Git integration
Plugin 'tpope/vim-fugitive'

"Syntax check
"Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

""""""""""""""""""""""""""""
" Vim general configuration
""""""""""""""""""""""""""""

" Encoding
set encoding=utf-8

" Map leader to space
let mapleader = "\<Space>"

" Map local leader to backslash
let maplocalleader = "\\"

" Enable multiple unsaved buffers
set hidden

""""""""""""""""""""""""""""
"     .vimrc-specific
""""""""""""""""""""""""""""

" Open vim configuration in a vsplit: Leader + ev (edit vim)
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source vim configuration inmediatly: Leader + sv (source vim)
nnoremap <leader>sv :source $MYVIMRC<cr>

""""""""""""""""""""""""""""
"         Search
""""""""""""""""""""""""""""

" If the 'ignorecase' option is on, the case of normal letters is ignored.
set ignorecase

" 'smartcase' can be set to ignore case when the pattern contains lowercase
" letters only.
set smartcase

" While typing a search command, show where the pattern, as it was typed
" so far, matches.  The matched string is highlighted.
set incsearch

" When there is a previous search pattern, highlight all its matches.
set hlsearch

" Disable highlight after search is done: Leader + space
nnoremap <leader><space> :noh<cr>

" Replace highlighted word in the current file
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

""""""""""""""""""""""""""""
"          UI
""""""""""""""""""""""""""""

" Show the line and column number of the cursor position, separated by a comma.
" Ignore with airline
set ruler

" Precede each line with its line number
set number

" Highlight the screen line of the cursor
set cursorline

" Syntax highlighting
syntax on

" Solarized Dark theme
colorscheme solarized
set background=dark

" Highlight lines that go over 80 characters
match Error /\%81v.\+/

"When on, splitting a window will put the new window right of the current one.
set splitright

" When on, splitting a window will put the new window right of the current one.
set splitbelow

" Same as :print, but display unprintable characters with '^' and put $ after
" the line.how trailing whitespaces
set list

" Show trailing whitespaces as dashes
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

""""""""""""""""""""""""""""
"     Text, tab, indent
""""""""""""""""""""""""""""
"" General

" tabstop: Number of spaces that a <Tab> in the file counts for.
set tabstop=2

" softtabstop: Number of spaces that a <Tab> counts for while performing
" editing operations, like inserting a <Tab> or using <BS>.
set softtabstop=2

" shiftwidth: Number of spaces to use for each step of (auto)indent. Used for
" |'cindent'|, |>>|, |<<|, etc.
set shiftwidth=2

" expandtab: Spaces are used instead of tab characters
set expandtab

" A <BS> will delete a 'shiftwidth' worth of space at the start of the line. Be
" smart when using tabs.
set smarttab

" Copy indent from current line when starting a new line
set autoindent

" Go, Makefile
autocmd FileType go,make setlocal ts=8 sts=8 sw=8 noexpandtab

" Python
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

""""""""""""""""""""""""""""
"       Movement
""""""""""""""""""""""""""""

"" Window movement

" Ctrl + h: Move left
nnoremap <c-h> <c-w>h

" Ctrl + j: Move down
nnoremap <c-j> <c-w>j

" Ctrl + k: Move up
nnoremap <c-k> <c-w>k

" Ctrl + l: Move right
nnoremap <c-l> <c-w>l

""""""""""""""""""""""""""""
"       Text Editing
""""""""""""""""""""""""""""

" Remove trailing whitespaces: Leader + W (whitespaces)
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Delete over line breaks, automatically inserted indentation, etc.
set backspace=indent,eol,start

""""""""""""""""""""""""""""
"     Airline-specific
""""""""""""""""""""""""""""

" Airline status bar even when no open tabs/splits
set laststatus=2

" Solarized theme
let g:airline_theme='solarized'

" Enable tabline
" let g:airline#extensions#tabline#enabled = 1

" Use powerline fonts
let g:airline_powerline_fonts=1

""""""""""""""""""""""""""""
"       Ack-specific
""""""""""""""""""""""""""""

" Use the Silver Searcher instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Don't jump to first result
cnoreabbrev Ack Ack!

" Search: Leader + a (ack)
nnoremap <leader>a :Ack!<space>

""""""""""""""""""""""""""""
"       NERDTree-specific
""""""""""""""""""""""""""""

" Open NERDTree: Leader + t (tree)
nnoremap <leader>t :NERDTree<cr>

" Ignore .pyc files
let NERDTreeIgnore = ['\.pyc$']

""""""""""""""""""""""""""""
"         Go
""""""""""""""""""""""""""""

augroup filetype_go

" Remove previous configuration
    autocmd!

" Run Go: Leader + r (run)
    autocmd FileType go nmap <localleader>r <Plug>(go-run)

" Build Go: Leader + b (run)
    autocmd FileType go nmap <localleader>b <Plug>(go-build)

" Test Go: Leader + t (test)
    autocmd FileType go nmap <localleader>t <Plug>(go-test)

" Coverage Go: Leader + c (coverage)
    autocmd FileType go nmap <localleader>c <Plug>(go-coverage)

augroup END
