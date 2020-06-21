# kube-ps1
kon() {
    export KUBE_ON=true
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    source ~/stuff/dotfiles/shell/kubernetes_aliases.sh
    source <(kubectl completion zsh)
}

koff() {
    unset KUBE_ON
}
