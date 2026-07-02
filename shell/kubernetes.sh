# Inert on machines without kubectl (return exits just this sourced file).
command -v kubectl >/dev/null || return 0

# Sourced from zshrc AFTER Prezto: kubectl's completion calls compdef, which
# only exists once Prezto's completion module has run compinit.
source <(kubectl completion zsh)
source "${DOTFILES:-$HOME/stuff/dotfiles}/shell/kubernetes_aliases.sh"

# Make the `k` alias complete like kubectl itself.
compdef k=kubectl
