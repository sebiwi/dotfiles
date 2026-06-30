# General shell aliases.
# Sourced from zshrc AFTER Prezto, so these override Prezto's utility-module
# ls-family aliases (ls/l/ll/la/lt) instead of being clobbered by them.
# Aliases only apply to interactive shells, so scripts that call `ls`/`cat`
# directly are unaffected.

# Drop Prezto's ls-family aliases FIRST, at top level. This must run before the
# block below is parsed: zsh parses a whole `if ... fi` as one unit, and you
# can't define a function (lt) whose name is still an active alias, so unaliasing
# inside the block would be too late.
command -v eza >/dev/null && unalias ls l ll la lt tree 2>/dev/null

# eza: a modern ls. Icons need a Nerd Font (JetBrainsMono Nerd Font is installed).
if command -v eza >/dev/null; then
  alias ls='eza --group-directories-first --icons=auto'
  alias l='eza --group-directories-first --icons=auto'
  alias ll='eza -l --group-directories-first --icons=auto --git'
  alias la='eza -la --group-directories-first --icons=auto --git'
  # Analog of `ls -ltrh`: long, sorted by mtime, oldest first / newest last.
  alias llt='eza -l --sort=modified --icons=auto --git'
  alias tree='eza --tree --icons=auto'

  # lt [depth] [paths...] -- tree view, depth defaults to 2.
  #   lt        -> 2 levels of the current dir
  #   lt 4      -> 4 levels
  #   lt 3 src  -> 3 levels of ./src
  lt() {
    local depth=2
    if [[ "$1" == <-> ]]; then  # zsh glob: $1 is all digits
      depth=$1
      shift
    fi
    eza --tree --level="$depth" --icons=auto "$@"
  }
fi

# bat: a modern cat with syntax highlighting. `cat` is left untouched so pipes
# and scripts behave normally; use `bat` directly, or `catp` for a plain,
# no-decorations view that still highlights.
if command -v bat >/dev/null; then
  alias catp='bat --paging=never --style=plain'
fi
