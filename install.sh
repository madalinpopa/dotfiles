#!/bin/bash

set -euo pipefail
#=====================================================================
# DOTFILES INSTALL SCRIPT
#=====================================================================
# Author: Madalin Popa
# E-mail: contact@madalinpopa.com

#=====================================================================
# GLOBAL VARIABLES
#=====================================================================
# Colors used for output
declare -r RED='\033[0;31m'
declare -r GREEN='\033[0;32m'
declare -r BLUE='\033[0;34m'
declare -r NC='\033[0m' # No Color

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r ROOT="$(pwd)"

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r CONFIG_PATH="$SCRIPT_DIR/config.json"

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r BOOTSTRAP_SCRIPT="$SCRIPT_DIR/scripts/bootstrap.py"
declare -r PACKAGES_SCRIPT="$SCRIPT_DIR/scripts/packages.py"

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

export PYTHONPATH="$SCRIPT_DIR/scripts"

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#Flags
FORCE_FLAG="true"
PACKAGE_FLAG="false"

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Parse arguments
for arg in "$@"
do
  if [[ "$arg" == "--interactive" ]]; then
    FORCE_FLAG="false"
  fi
  if [[ "$arg" == "--packages" ]]; then
    PACKAGE_FLAG="true"
  fi
done

#=====================================================================
# FUNCTIONS
#=====================================================================
# Define a function to print colored text
info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

header () {
  info ""
  info "============================================"
  info "$1"
  info "============================================"
  info ""
}
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_dotfiles () {
    if [[ -f "$BOOTSTRAP_SCRIPT" ]]; then
      python3 "$BOOTSTRAP_SCRIPT" "$CONFIG_PATH" "$SCRIPT_DIR" $FORCE_FLAG
    else
      echo "Error: Unable to find bootstrap.py at $BOOTSTRAP_SCRIPT"
      exit 1
    fi
}

install_packages () {
  info ""
}
# Script entrypoint
main () {
  if command -v python3 &>/dev/null ; then

    if [[ "$PACKAGE_FLAG" == "false" ]]; then
      header "Install dotfiles"
      install_dotfiles
    fi

    if [[ "$PACKAGE_FLAG" == "true" ]]; then
      header "Install packages"
      install_packages
    fi

  else

    fail "Python3 not found"
    exit 1

  fi
}

#=====================================================================
# START INSTALLATION
#=====================================================================
info "============================================"
info "Bootstrap dotfiles"
info "============================================"
info ""
info "SCRIPT_DIR: $SCRIPT_DIR"
info "CONFIG_PATH: $CONFIG_PATH"
info "BOOTSTRAP_SCRIPT: $BOOTSTRAP_SCRIPT"
info "PYTHONPATH: $PYTHONPATH"
info ""
main
