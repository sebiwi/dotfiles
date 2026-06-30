# fzf reverse search

# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Appearance: consistent layout + Solarized-dark colors (matches terminal/bat/delta).
export FZF_DEFAULT_OPTS="
  --height 60% --layout=reverse --border --info=inline
  --prompt='❯ ' --marker='✓'
  --color=fg:#839496,bg:#002b36,hl:#268bd2
  --color=fg+:#93a1a1,bg+:#073642,hl+:#268bd2
  --color=info:#586e75,prompt:#859900,pointer:#d33682
  --color=marker:#d33682,spinner:#cb4b16,header:#586e75,border:#073642"

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
# Use fd (faster than ag, respects .gitignore). CTRL-T mirrors the file search;
# ALT-C lists directories.
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# fzf-git.sh: git-object pickers under the CTRL-G prefix --
# CTRL-G CTRL-F files, CTRL-B branches, CTRL-T tags, CTRL-R remotes,
# CTRL-H hashes, CTRL-S stashes, CTRL-L reflogs, CTRL-W worktrees, CTRL-E each.
# Installed by the `fzf-git` playbook tag; guarded so it is inert if absent.
[ -f ~/.fzf-git/fzf-git.sh ] && source ~/.fzf-git/fzf-git.sh
