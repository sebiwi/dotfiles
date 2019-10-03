" Install vim-plug if it is not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Nerdtree / Filetree view
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTree', 'NERDTreeFind'] }

" Fuzzy file/buffer/tag search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim', { 'on': ['Files', 'Ag'] }

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
Plug 'gregsexton/gitv', { 'on': ['Gitv'] }

" Airline-like bash prompt
" Plug 'edkolev/promptline.vim'

" Airline-like tmux status bar
Plug 'edkolev/tmuxline.vim'

" Easy surroundings editing
Plug 'tpope/vim-surround'

" Launch asynchronous tasks
Plug 'tpope/vim-dispatch' , { 'on': ['Make', 'Dispatch'] }

" Indent guidelines
Plug 'Yggdroot/indentLine'

" JSON Highlight
Plug 'elzr/vim-json', { 'for': 'json' }

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Terraform
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'terraform' }

" Snippets
Plug 'SirVer/ultisnips'

" Tagbar
Plug 'majutsushi/tagbar'

" Ansible
Plug 'pearofducks/ansible-vim', { 'for': 'yaml.ansible' }

" Ruby
Plug 'tpope/vim-endwise', { 'for': 'ruby' }

" Bracked bindings
Plug 'tpope/vim-unimpaired'

" Repeat plugin maps
Plug 'tpope/vim-repeat'

" Alignment tool
Plug 'godlygeek/tabular', { 'on': 'Tab' }

" Organization tools
Plug 'vimwiki/vimwiki'

call plug#end()            " required
