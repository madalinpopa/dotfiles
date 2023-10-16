#!/usr/bin/env bash
#
#  ███    ███ ██████
#  ████  ████ ██   ██
#  ██ ████ ██ ██████
#  ██  ██  ██ ██
#  ██      ██ ██
#
#
# Author: Madalin Popa
# Version: 0.1.0
# Email: github@madalinpopa.com

apt-get install zsh

# chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
