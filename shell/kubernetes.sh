autoload -Uz compinit
compinit
source <(kubectl completion zsh)
source ~/stuff/dotfiles/shell/kubernetes_aliases.sh
