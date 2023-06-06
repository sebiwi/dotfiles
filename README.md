# Dotfiles

The dotfiles.

## Requirements

- brew
- asdf
  - python
    - virtualenv
    - virtualenvwrapper

## Installation

Install the requirements under the `Requirements` section, then:

```bash
# Create a virtualenv for this repository
mkvirtualenv dotfiles

# Install ansible
pip install ansible

# Run the install script
ansible-playbook install.yaml -K
```

Change iTerm's colorscheme to Solarized Dark, and use the Powerlevel10k patched fonts.

## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## License
MIT - see LICENSE for more details
