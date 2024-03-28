#!/bin/bash

set -euo pipefail

# Colors used for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Define a function to print colored text
print_color() {
    COLOR=$1
    TEXT=$2
    case $COLOR in
        "red") COLOR=$RED;;
        "green") COLOR=$GREEN;;
        "blue") COLOR=$BLUE;;
        *) COLOR=$NC;;
    esac
    echo -e "${COLOR}${TEXT}${NC}"
}

# Check if Python is installed
if command -v python3 &>/dev/null; then
    print_color "green" "============================================"
    print_color "green" "Bootstrap dotfiles"
    print_color "green" "============================================"
    echo ""
    python3 bootstrap.py
else
    echo "Python3 not found"
fi
