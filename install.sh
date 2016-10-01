#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create required directories
[ -d ~/.vim/bundle ] || mkdir -p ~/.vim/bundle

# Install Vundle
[ -d ~/.vim/bundle/Vundle.vim ] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## Install The Silver Searcher
# TODO: Add support for CentOS
# OSX
! uname -a | grep -qi darwin || brew list | grep -qi 'the_silver_searcher' || brew install the_silver_searcher
# Debian/Ubuntu
! uname -a | grep -qi ubuntu || sudo apt-get install silversearcher-ag
# Archlinux
! uname -a | grep -qi arch || sudo pacman -S the_silver_searcher

# Symlink colors and plugin directories
[ -e ~/.vim/colors ] || ln -s $DIR/colors ~/.vim/colors
[ -e ~/.vim/plugin ] || ln -s $DIR/plugin ~/.vim/plugin

# Symlink vimrc
[ -e ~/.vimrc ] || ln -s $DIR/vimrc ~/.vimrc

# Launch Vim and install plugins
vim +PluginInstall +qall

# Create prompline configuration
vim +'PromptlineSnapshot! ~/.shell_prompt.sh airline' +qall
# OSX
! uname -a | grep -qi darwin || grep -qi '^source ~/.shell_prompt.sh$' ~/.bash_profile || printf "\n# Airline shell prompt\nsource ~/.shell_prompt.sh"  >> ~/.bash_profile
# Debian/Ubuntu/Arch
! uname -a | grep -qi 'ubuntu\|arch' || grep -qi '^source ~/.shell_prompt.sh$' ~/.bashrc || printf "\n# Airline shell prompt\nsource ~/.shell_prompt.sh"  >> ~/.bashrc
