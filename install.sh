#!/usr/bin/env bash

set -x
set -e

# Repository URL for your dotfiles
REPO_URL="https://github.com/madalinpopa/dotfiles.git"
DOTFILES_DIR="${HOME}/.dotfiles"

# Ensure Python and pip are installed
command -v python3 >/dev/null 2>&1 || { echo "Python 3 is required but not installed."; exit 1; }
command -v pip3 >/dev/null 2>&1 || { echo "pip3 is required but not installed."; exit 1; }

# Install Dotbot
echo "Installing Dotbot..."
pip3 install dotbot

# Clone dotfiles repository (or pull if it's already cloned)
if [ ! -d "${DOTFILES_DIR}" ]; then
    echo "Cloning dotfiles repository..."
    git clone "${REPO_URL}" "${DOTFILES_DIR}"
else
    echo "${DOTFILES_DIR} already exists. Pulling latest changes..."
    cd "${DOTFILES_DIR}"
    git pull origin master
fi

# Execute Dotbot
echo "Running Dotbot..."
cd "${DOTFILES_DIR}"
dotbot -c conf.yaml

echo "Dotfiles setup complete!"
