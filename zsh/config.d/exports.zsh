# ----------------------------------------------------------------------
# Author: Madalin Popa              
# Email: coderustle@madalinpopa.com 
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# Executable search path
# ----------------------------------------------------------------------
export PATH="$HOME/.local/bin:$HOME/.local/sbin:$HOME/.cargo/bin:/usr/local/bin:/usr/local/sbin:$BUN_INSTALL/bin:$GOBIN:$PATH"

# ----------------------------------------------------------------------
# XDG Base Directory Specification
# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# ----------------------------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"

# ----------------------------------------------------------------------
# System Settings
# ----------------------------------------------------------------------
# Set date as DD-MM-YYYY
export DATE=$(date +%d-%m-%Y)

# Language settings
export LANG="en_US.UTF-8"

# 256 color support for terminal (uncomment if needed)
# export TERM="xterm-256color"

# Enable colors for `ls`, etc.
export CLICOLOR=1

# GNU-GPG TTY setting (for GPG support)
export GPG_TTY=$(tty)

# ----------------------------------------------------------------------
# Tool-specific configurations
# ----------------------------------------------------------------------
# Bun
export BUN_INSTALL="$HOME/.bun"

# NVM Directory
export NVM_DIR="$HOME/.config/nvm"

# Go binary path
export GOBIN="$HOME/.local/bin"

# ----------------------------------------------------------------------
# Editor settings
# ----------------------------------------------------------------------
# Default editor settings
export EDITOR="vim"
export VISUAL="vim"

# Python should use UTF-8 encoding for stdin, stdout, stderr
export PYTHONIOENCODING="UTF-8"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
