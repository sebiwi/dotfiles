# kube-ps1
kon() {
    export KUBERNETES_INFO=$(kube_ps1)
}

koff() {
    unset KUBERNETES_INFO
}

# Alias
alias k='kubectl'
alias kn='kubens'
alias kx='kubectx'
