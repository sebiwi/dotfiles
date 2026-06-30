# Dotfiles

The dotfiles.

These currently work on MacOs. I haven't tested them elsewhere.

- nvim
- vim (but I'm trying to let go)
- wezterm
- tmux (but I'm trying to let go x2)
- zsh (Prezto + Powerlevel10k)
- git
- aerospace
- Various CLI tools (bat, eza, fd, fzf, ripgrep, zoxide, atuin, delta, ...)

## Requirements

- `brew`
  - `mise` -> `python` -> `pdm`

## Installation

```bash
pdm install                                   # install ansible
pdm run ansible-playbook install.yaml -K      # run everything
```

Install only some parts with tags:

```bash
pdm run ansible-playbook install.yaml -K --tags nvim,wezterm
```

Available tags: `brew`, `vim`, `nvim`, `gh`, `shell-color-scripts`, `tmux`,
`fzf`, `prezto`, `git`, `wezterm`, `aerospace`, `pre-commit`.

## Post-install

- Use the **JetBrainsMono Nerd Font** (installed by the `brew` tag) in your
  terminal so icons render.
- `git/gitconfig` includes `~/.gitconfig.user` for machine-local identity and
  signing. Create it (not tracked here), e.g.:

  ```ini
  [user]
      name = Your Name
      email = you@example.com
      signingkey = ~/.ssh/id_ed25519.pub
  ```

- atuin (shell history) stores data locally on first use; run `atuin import auto`
  once to import existing history. Sync is opt-in (`atuin register`).
- A `pre-commit` hook (gitleaks secret scan, stylua, zsh syntax check, generic
  hygiene) runs on commit. The `pre-commit` tag installs the git hook; bump
  pinned versions with `pre-commit autoupdate`. Bypass once with
  `git commit --no-verify`.

## License

MIT - see LICENSE for more details.
