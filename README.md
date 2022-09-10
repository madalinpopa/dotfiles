## Dotfiles

This is a repository with all my dotfiles.
The structure is pretty simple, I have a config folder
with the configuration for all the tools/applications that I use.

I use [dotbot](https://github.com/anishathalye/dotfiles_template) to create soft links for all
the config files in my dotfiles.

**install.conf.yaml**

```yaml
- defaults:
    link:
      create: true
      relink: true

- clean: ['~']

- link:
    # Git configuration
    ~/.gitconfig:
      path: config/git/gitconfig
    ~/.gitignore_global:
      path: config/git/gitignore_global
    # Bash configuration
    ~/.bashrc.d:
      path: config/bash/bashrc.d
    ~/.bashrc:
      path: config/bash/bashrc
      force: true
    ~/.profile:
      path: config/bash/profile
      force: true
    # Tmux configuration
    ~/.tmux.conf:
      path: config/tmux/tmux.conf

- shell:
    - git submodule sync --recursive
    # the following have to run after linking ~/.gitconfig
    - git update-submodules
    - ./scripts/git-autocomplete-init.sh
    - source ~/.bashrc
```
