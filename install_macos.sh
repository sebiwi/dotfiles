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
        mkdir -p ~/.tmux/plugins
        git clone git@github.com:minhdanh/macos-network-speed.git ~/.tmux/plugins/tmux-mem-cpu-load
        pushd ~/.tmux/plugins/tmux-mem-cpu-load
        cmake .
        make
        ln -s tmux-mem-cpu-load /usr/local/bin/tmux-mem-cpu-load
        ln -s $PWD/tmux-mem-cpu-load /usr/local/bin/tmux-mem-cpu-load
        popd
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

# Install fonts
if [[ ! -f ~/Library/Fonts/Menlo-Regular-Normal.ttf ]] ; then
    echo "instaling fonts..."
    ln -s $DIR/macos/fonts/Menlo-Regular-Normal.ttf ~/Library/Fonts/Menlo-Regular-Normal.ttf
else
    echo "fonts already installed, moving on..."
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
    echo "installing node..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
    NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    nvm install --lts
else
    echo "node already installed, moving on..."
fi

# Install python
if [[ ! -f /usr/local/bin/python ]] ; then
    echo "installing python"
    brew install python
    # set Python3 as default Python: https://dev.to/irfnhm/how-to-set-python3-as-a-default-python-version-on-mac-4jjf
    [ -e /usr/local/bin/python ] || ln -s -f /usr/local/bin/python3.7 /usr/local/bin/python
    echo "installing virtualenvwrapper"
    pip3 install virtualenvwrapper
else
    echo "python already installed, moving on..."
fi

# Install autojump tools
which -s autojump
if [[ $? != 0 ]] ; then
    echo "installing autojump"
    brew install autojump
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

# Install prezto
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

# Install the silver searcher
which -s ag
if [[ $? != 0 ]] ; then
    echo "installing the silver searcher..."
    brew install the_silver_searcher
else
    echo "the silver searcher already installed, moving on..."
fi

set -e

# Symlink gitconfig
[ -e ~/.gitconfig ] || ln -s $DIR/shell/gitconfig ~/.gitconfig
