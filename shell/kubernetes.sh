# kube-ps1
kon() {
    export KUBE_ON=true
}

koff() {
    unset KUBE_ON
}

# Alias
alias k='kubectl'
alias kn='kubens'
alias kx='kubectx'
