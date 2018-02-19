" Install vim-plug if it is not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Nerdtree / Filetree view
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Fuzzy file/buffer/tag search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Nice status bar
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Ack support
Plug 'mileszs/ack.vim', { 'on': 'Ack' }

" Go support
Plug 'fatih/vim-go', { 'for': 'go' }

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
Plug 'tpope/vim-dispatch' , { 'on': ['Make', 'Dispatch'] }

" Syntax check
Plug 'w0rp/ale'

" Indent guidelines
Plug 'Yggdroot/indentLine'

" JSON Highlight
Plug 'elzr/vim-json', { 'for': 'json' }

" Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer --tern-completer' }

" Terraform
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'

" Snippets
Plug 'SirVer/ultisnips'

call plug#end()            " required
