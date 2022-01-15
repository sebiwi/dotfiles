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
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim', {
        \ 'on': [
            \ 'Ag',
            \ 'Rg',
            \ 'FZF',
            \ 'Files',
            \ 'Buffers',
            \ 'Commits',
            \ 'BCommits',
            \ 'Tags',
            \ 'BTags',
            \ 'History',
            \ 'Lines',
            \ 'BLines',
            \ 'Marks'
        \ ] }

" Nice status bar
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Go support
Plug 'fatih/vim-go', { 'for': 'go' }

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv', { 'on': ['Gitv'] }

" Airline-like bash prompt
" Plug 'edkolev/promptline.vim'

" Airline-like tmux status bar
"Plug 'edkolev/tmuxline.vim'

" Easy surroundings editing
Plug 'tpope/vim-surround'

" Indent guidelines
Plug 'Yggdroot/indentLine'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Terraform
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'rhadley-recurly/vim-terragrunt', { 'for': 'hcl' }

" Tagbar-like
Plug 'liuchengxu/vista.vim'

" Ansible
Plug 'pearofducks/ansible-vim', { 'for': 'yaml.ansible' }

" Bracked bindings
Plug 'tpope/vim-unimpaired'

" Repeat plugin maps
Plug 'tpope/vim-repeat'

" Alignment tool
Plug 'godlygeek/tabular', { 'on': 'Tab' }

" Organization tools
Plug 'vimwiki/vimwiki'

" Development icons
Plug 'ryanoasis/vim-devicons'

" Easy search and replace
Plug 'thinca/vim-qfreplace'

call plug#end()            " required
