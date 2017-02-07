call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

" Nerdtree / Filetree view
Plug 'scrooloose/nerdtree'

" Ctrlp / Nice file searching
Plug 'ctrlpvim/ctrlp.vim'

" Nice status bar
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Ack support
Plug 'mileszs/ack.vim'

" Go support
Plug 'fatih/vim-go'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Airline-like bash prompt
Plug 'edkolev/promptline.vim'

" Airline-like tmux status bar
Plug 'edkolev/tmuxline.vim'

" Easy surroundings editing
Plug 'tpope/vim-surround'

" Launch asynchronous tasks
Plug 'tpope/vim-dispatch'

" Syntax check
Plug 'w0rp/ale'

" Indent guidelines
Plug 'Yggdroot/indentLine'

" JSON Highlight
Plug 'elzr/vim-json'

" Ansible support
Plug 'pearofducks/ansible-vim'

" Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer --tern-completer' }

" All of your Plugins must be added before the following line
call plug#end()            " required
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

" Delete over line breaks, automatically inserted indentation, etc.
set backspace=indent,eol,start

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
"    Copy/Paste shortcuts
""""""""""""""""""""""""""""

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

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
"       Spelling
""""""""""""""""""""""""""""

" Toggle spell checking with: Leader + s (spelling)
noremap <silent> <leader>s :set spell!<cr>

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
match Error /\%121v.\+/

"When on, splitting a window will put the new window right of the current one.
set splitright

" When on, splitting a window will put the new window right of the current one.
set splitbelow

" Same as :print, but display unprintable characters with '^' and put $ after
" the line.how trailing whitespaces
set list

" Show trailing whitespaces as dashes
set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:+

""""""""""""""""""""""""""""
"     Text, tab, indent
""""""""""""""""""""""""""""

" A <BS> will delete a 'shiftwidth' worth of space at the start of the line. Be
" smart when using tabs.
set smarttab

" Copy indent from current line when starting a new line
set autoindent

" Default
if &filetype==""
  setlocal ts=2 sts=2 sw=2 expandtab
endif

" Ansible, Yaml, tf, JSON
autocmd FileType vim,ansible,yaml,tf,json setlocal ts=2 sts=2 sw=2 expandtab

" Go, Makefile
autocmd FileType go,make setlocal ts=8 sts=8 sw=8 noexpandtab

" Python, Bash, Markdown, HTML, Javascript
autocmd FileType python,sh,markdown,html,xhtml,javascript setlocal ts=4 sts=4 sw=4 expandtab

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
"       CtrlP-specific
""""""""""""""""""""""""""""

" Ignore unnecessary directories
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|dist\|tmp\|DS_Store\|git\|target'

""""""""""""""""""""""""""""
"       Dispatch-specific
""""""""""""""""""""""""""""

" Dispatch: Leader + d (dispatch)
nnoremap <leader>d :Dispatch<space>

""""""""""""""""""""""""""""
"       NERDTree-specific
""""""""""""""""""""""""""""

" Open NERDTree: Leader + t (tree)
nnoremap <leader>t :NERDTree<cr>

" Ignore .pyc files
let NERDTreeIgnore = ['\.pyc$']

""""""""""""""""""""""""""""
"     Promptline-specific
""""""""""""""""""""""""""""

" Generate with :PromptlineSnapshot <promptfile-name>
" Shell prompt: Vitualenv > hostname > user > cwd > git branch > exit code

let g:promptline_preset = {
        \'a' : [ promptline#slices#python_virtualenv() ],
        \'b' : [ promptline#slices#host({ 'only_if_ssh': 1 }), promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

""""""""""""""""""""""""""""
"     tmuxline-specific
""""""""""""""""""""""""""""

let g:tmuxline_preset = {
      \'a'       : '#S:#I',
      \'b disabled'       : '',
      \'c disabled'       : '',
      \'win'     : ['#I', '#W'],
      \'cwin'    : ['#I', '#W'],
      \'x'       : '#(tmux-battery)',
      \'y'       : ['%a', '%Y-%m-%d', '%l:%M%p'],
      \'z'       : ['#(whoami)', '#(getipfortmux || echo raspi)'],
      \'options' : {'status-justify': 'left'}}

""""""""""""""""""""""""""""
"     vim-go-specific
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

""""""""""""""""""""""""""""
"     indentLine-specific
""""""""""""""""""""""""""""

" Disable hidden quotes for JSON files
let g:vim_json_syntax_conceal = 0
