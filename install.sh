#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlink vim directory
[ -e ~/.vim ] || ln -s $DIR/vim ~/.vim

# Symlink bash_profile
[ -e ~/.bash_profile ] || ln -s $DIR/bash_profile ~/.bash_profile

# Symlink vimrc
[ -e ~/.vimrc ] || ln -s $DIR/vimrc ~/.vimrc

# Symlink gitconfig
[ -e ~/.gitconfig ] || ln -s $DIR/gitconfig ~/.gitconfig

# Symlink tmux.conf
[ -e ~/.tmux.conf ] || ln -s $DIR/tmux.conf ~/.tmux.conf

# Launch Vim and install plugins
vim +PlugInstall +qall
