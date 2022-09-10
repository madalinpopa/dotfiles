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

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install --lts
