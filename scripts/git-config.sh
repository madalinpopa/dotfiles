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

USER=$(whoami)
NAME="Madalin Popa"
EMAIL="github@madalintech.com"
GIT_VERSION=$(git --version)

# Colors used for output
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
rst=$(tput sgr0)

# Function to update git version
function git_config() {
    echo "$yellow Configuring git.. $rst"
    out1=$(git config --global user.name "Madalin Popa")
    out2=$(git config --global user.email "github@madalintech.com")
    out3=$(git config --global core.editor vim)
    if [[ out1 -eq 0 && out2 -eq 0 && out3 -eq 0 ]]; then
        echo "$green Done! $rst"
    fi
}

# Check the git version
# If the version is not found, then exit.
if [[ -x $(command -v git) ]]; then
    echo "$green Git is installed $rst"
    echo "$green $GIT_VERSION $rst"
else
    echo "$red Git is not installed $rst"
    exit 1
fi

# Check if is there already a config file
# If not, then update the configuration
if [[ -f "/home/$USER/.gitconfig" ]]; then
    echo "$red Git is already configured $rst"
else
    git_config
fi
