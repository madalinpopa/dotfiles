# dotfiles
This repository contains my personal dotfiles, which are configuration files for various tools and applications that I use.

To setup my dotfiles I use plain Python with no other dependencies beside what is include in standard library.

## install
```bash
git clone https://github.com/madalinpopa/dotfiles ~/.dotfiles
.dotfiles/install.sh
```
**Step 1**: The first step is to run the `install.sh` script which will create symlinks for all the files in the `config.json` file. If the target file already exists and is not a symlink, the script will ask if you want to skip or delete the existing target file. Using the `--force` flag will remove any existing targets by default.

**Step 2**: The second step is to run the `install.sh` using the `--setup` flag. This will install all the necessary tools and applications that are listed in the `config.json` file under `external_scripts`.

## test
To test the dotfiles config and how they look, you can run `make build` and `make run`.
