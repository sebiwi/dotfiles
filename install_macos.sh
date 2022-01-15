#!/bin/bash

set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install Homebrew
which -s brew
if [[ $? != 0 ]] ; then
    echo "installing brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "brew already installed, moving on..."
fi

# Install vim
which -s vim
if [[ $? != 0 ]] ; then
    echo "instaling vim..."
    brew install vim
    # Symlink vim directory
    [ -e ~/.vim ] || ln -s $DIR/vim ~/.vim
    # Create undo dir
    [ -e ~/.vim/undo ] || mkdir ~/.vim/undo
    # Create backup dir
    [ -e ~/.vim/backup ] || mkdir ~/.vim/backup
    # Create swap dir
    [ -e ~/.vim/swap ] || mkdir ~/.vim/swap
    # Symlink vimrc
    [ -e ~/.vimrc ] || ln -s $DIR/vimrc ~/.vimrc
    # Launch Vim and install plugins
    vim +PlugInstall +qall
else
    echo "vim already installed, moving on..."
fi

# Install fzf
which -s fzf
if [[ $? != 0 ]] ; then
    echo "instaling fzf..."
    brew install fzf
    $(brew --prefix)/opt/fzf/install
    [ -e ~/.fzf.sh ] || ln -s $DIR/macos/shell/fzf.sh ~/.fzf.sh
else
    echo "fzf already installed, moving on..."
fi

# Install iterm2
if [[ ! -d /Applications/iTerm.app ]] ; then
    echo "instaling iTerm2"
    brew cask install iterm2
else
    echo "iTerm2 already installed, moving on..."
fi

# Install tmux and related
which -s tmux
if [[ $? != 0 ]] ; then
    echo "instaling tmux..."
    brew install tmux cmake
    # Symlink tmux configuration
    [ -e ~/.tmux.conf ] || ln -s $DIR/macos/tmux/tmux.conf ~/.tmux.conf
    [ -e ~/.tmuxline ] || ln -s $DIR/macos/tmux/tmuxline ~/.tmuxline
    # Install tmux plugin manager
    [ -e ~/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # Install macos-network-speed
    which macos-network-speed
    if [[ $? != 0 ]]; then
        git clone git@github.com:minhdanh/macos-network-speed.git
        pushd macos-network-speed
        go build -o macos-network-speed
        go install
        popd
        rm -rf macos-network-speed
    fi
    which tmux-mem-cpu-load
    if [[ $? != 0 ]]; then
        brew install tmux-mem-cpu-load
    fi
    which getipfortmux
    if [[ $? != 0 ]]; then
        git clone git@github.com:JoshOldenburg/ipaddrutil.git
        pushd ipaddrutil
        make all
        mv getipfortmux /usr/local/bin/getipfortmux
        popd
        rm -rf ipaddrutil
    fi
    which tmux-battery
    if [[ $? != 0 ]]; then
        git clone git@github.com:JoshOldenburg/tmux-battery.git
        pushd tmux-battery
        make all
        mv tmux-battery /usr/local/bin/tmux-battery
        popd
        rm -rf tmux-battery
    fi
else
    echo "tmux already installed, moving on..."
fi

# Install rbenv
which -s rbenv
if [[ $? != 0 ]] ; then
    echo "installing rbenv..."
    brew install rbenv
else
    echo "rbenv already installed, moving on..."
fi

# Install nvm
which -s node
if [[ $? != 0 ]] ; then
    brew install nvm
    mkdir ~/.nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
    nvm install --lts
else
    echo "node already installed, moving on..."
fi

## Install python
which -s pyenv
if [[ $? != 0 ]] ; then
    echo "installing pyenv"
    brew install pyenv
    brew install pyenv-virtualenvwrapper
else
    echo "pyenv already installed, moving on..."
fi

# Install autojump tools
which -s autojump
if [[ $? != 0 ]] ; then
    echo "installing autojump"
    brew install autojump
else
    echo "autojump already installed, moving on..."
fi

# Install bat
which -s bat
if [[ $? != 0 ]] ; then
    echo "installing bat"
    brew install bat
else
    echo "autojump already installed, moving on..."
fi

# Install kubernetes tools
which -s kubectl
if [[ $? != 0 ]] ; then
    echo "installing kubectl"
    brew install kubernetes-cli kube-ps1 kubectx
else
    echo "kubernetes tools already installed, moving on..."
fi

## Install prezto
if [[ ! -f ~/.zprezto ]] ; then
    echo "installing prezto"
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    # Symlink zprestorc
    [ -e ~/.zpreztorc ] || ln -s $DIR/macos/shell/zpreztorc ~/.zpreztorc
    # Symlink zshrc
    [ -e ~/.zshrc ] || ln -s $DIR/macos/shell/zshrc ~/.zshrc
    ## Symlink shell prompt
    [ -e ~/.shell_prompt.sh ] || ln -s $DIR/shell/shell_prompt.sh ~/.shell_prompt.sh
else
    echo "prezto already installed, moving on..."
fi

## Install the silver searcher
which -s ag
if [[ $? != 0 ]] ; then
    echo "installing the silver searcher..."
    brew install the_silver_searcher
else
    echo "the silver searcher already installed, moving on..."
fi

# Symlink gitconfig
[ -e ~/.gitconfig ] || ln -s $DIR/shell/gitconfig ~/.gitconfig
