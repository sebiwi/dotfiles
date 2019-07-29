# Virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

# Add custom binaries, and rvm
export PATH=$PATH:~/stuff/bin:$HOME/.rvm/bin:/usr/local/sbin:~/stuff/go/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Golang
export GOPATH=~/stuff/go

# Remove duplicate commands from history
export HISTCONTROL=ignoreboth:erasedups

# Increase history size
export HISTFILESIZE=10000

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

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# fzf: Fuzzy search
if [ -e /usr/local/opt/fzf/shell/completion.bash ]; then
  source /usr/local/opt/fzf/shell/key-bindings.bash
  source /usr/local/opt/fzf/shell/completion.bash
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

  _gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  "
  ## Solarized Light color scheme for fzf
  #export FZF_DEFAULT_OPTS="
  #  --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
  #  --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  #"
  }
  _gen_fzf_default_opts
fi

function terraform_env_name (){
 if  [ -f .terraform/environment ]
 then
   TERRAFORM_ENV=`cat .terraform/environment`
   TERRAFORM_MESSAGE="(${TERRAFORM_ENV})"
 else
   TERRAFORM_MESSAGE=''
 fi
 echo -e  $TERRAFORM_MESSAGE
}

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Kubernetes autocomplete
source <(kubectl completion bash)

## Kubernetes

# Alias
alias kc='kubectl'
alias kn='kubens'
alias kx='kubectx'
alias kgp='kubectl get pods'

# Autocomplete
source <(kubectl completion bash | sed 's/kubectl/kc/g')
