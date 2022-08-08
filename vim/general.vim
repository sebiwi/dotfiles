""""""""""""""""""""""""""""
" Vim general configuration
""""""""""""""""""""""""""""
" Enable filetype indenting
filetype plugin indent on

" Encoding
set encoding=utf-8

" Map leader to space
let mapleader = "\<Space>"

" Map local leader to backslash
let maplocalleader = "\\"

" Delete over line breaks, automatically inserted indentation, etc.
set backspace=indent,eol,start

" Enable multiple unsaved buffers
set hidden

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

" Display file names when :e
set wildmenu

" Syntax highlighting
syntax on

" Solarized Dark theme
set background=dark
colorscheme solarized

" When on, splitting a window will put the new window right of the current one.
set splitright

" When on, splitting a window will put the new window below of the current one.
set splitbelow

" Same as :print, but display unprintable characters with '^' and put $ after
" the line.how trailing whitespaces
set list

" Show trailing whitespaces as dashes
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:+

""""""""""""""""""""""""""""
"     Text, tab, indent
""""""""""""""""""""""""""""
" Default indentation when no filetype is detected
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab

""""""""""""""""""""""""""""""""""""""""
" Swap, backup and persistent undo
""""""""""""""""""""""""""""""""""""""""
set undofile
set undolevels=1000
set undoreload=10000
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
