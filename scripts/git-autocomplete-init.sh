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
# Date: 2021-11-10
# Version: 0.1.0
# Email: github@madalinpopa.com

if [ ! -f ~/.git-completion.bash ]; then
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
        -o ~/.git-completion.bash
fi
