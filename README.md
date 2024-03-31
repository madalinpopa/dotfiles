# dotfiles
This repository contains my personal dotfiles, which are configuration files for various tools and applications that I use.

## install
```bash
git clone https://github.com/madalinpopa/dotfiles ~/.dotfiles
.dotfiles/install.sh
```
The `install.sh` script will check if Python installation exists and it will run `bootstrap.py`. The Python script will create a symlink for every entry in `config.json` file.

By default, `bootstrap.py` will check if target exists and is not a symlink. If this is the case, a prompt will ask if you want to skip or delete the existing target file. If you want to remove any existing targets by default you can run the `install.sh` with `--force` flag.

```bash
.dotfiles/install.sh --force
```
