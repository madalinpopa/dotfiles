#!/usr/bin/env bash

set -x
set -e


echo "Start program.."

# Ensure Python and pip are installed
command -v python3 >/dev/null 2>&1 || { echo "Python 3 is required but not installed."; exit 1; }
command -v pip3 >/dev/null 2>&1 || { echo "pip3 is required but not installed."; exit 1; }

# Install Dotbot
echo "Installing Dotbot..."
pip3 install dotbot

# Execute Dotbot
echo "Running Dotbot..."
dotbot -c conf.yaml

echo "Dotfiles setup complete!"
