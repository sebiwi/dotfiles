# Virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

# Add custom binaries, and rvm
export PATH=$PATH:~/stuff/bin:$HOME/.rvm/bin:/usr/local/sbin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Golang
export GOPATH=~/stuff/go

# Remove duplicate commands from history
export HISTCONTROL=ignoreboth:erasedups

# Forward search
stty -ixon

# Ctags for mac
alias ctags="`brew --prefix`/bin/ctags"

# Use GNU ls for dircolors
alias ls='gls --color=auto'
eval `gdircolors ~/.dircolors`

# Airline shell prompt
source ~/.shell_prompt.sh

# Import previous bash history
alias u='history -n'

# FIRE AND FORGET!
ff(){
 ssh-keygen -R $1
}

# FIRE AND FORGET!
sssh(){
 ff $1
 ssh $1
}
