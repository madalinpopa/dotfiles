# ----------------------------------------------------------------------
# Author: Madalin Popa              
# Email: coderustle@madalinpopa.com 
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# Zsh functions directory setup
# This sets up the fpath to include custom Zsh functions.
# ----------------------------------------------------------------------
ZSH_FUNC_DIR="${ZDOTDIR:-$HOME}/.zsh_functions"
if [[ -d "$ZSH_FUNC_DIR" ]]; then
   fpath+=("$HOME/.zfunc" "$ZSH_FUNC_DIR")
else
   mkdir -p "$ZSH_FUNC_DIR"
   fpath+=("$HOME/.zfunc" "$ZSH_FUNC_DIR")
fi

# ----------------------------------------------------------------------
# Homebrew configuration
# Add Homebrew binaries to the PATH, depending on the installation path.
# ----------------------------------------------------------------------
if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ----------------------------------------------------------------------
# NVM configuration
# Load Node Version Manager (NVM) if the script is available.
# ----------------------------------------------------------------------
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ----------------------------------------------------------------------
# Cargo configuration
# Load Cargo (Rust's package manager) environment if available.
# ----------------------------------------------------------------------
CARGO_ENV="$HOME/.cargo/env"
[[ -f "$CARGO_ENV" ]] && source "$CARGO_ENV"

# ----------------------------------------------------------------------
# Direnv configuration
# Load Direnv for managing project-specific environment variables.
# ----------------------------------------------------------------------
# ensure compatibility tmux <-> direnv
# if [[ -n "$TMUX" ]] && [[ -n "$DIRENV_DIR" ]]; then
#     # zsh syntax for unsetting matching variables
#     unset ${(M)parameters:#DIRENV_*}
# fi
# if command -v direnv &> /dev/null; then
#   eval "$(direnv hook zsh)"
# fi



# ----------------------------------------------------------------------
# WSL SSH Agent Relay (Windows-specific)
# Start the WSL SSH Agent Relay for communication with the Windows SSH agent.
# ----------------------------------------------------------------------
WSL_SSH_RELAY="$HOME/.local/bin/wsl-ssh-agent-relay"
if [[ -f "$WSL_SSH_RELAY" ]]; then
  "$WSL_SSH_RELAY" start
  export SSH_AUTH_SOCK="$HOME/.ssh/wsl-ssh-agent.sock"
fi

# ----------------------------------------------------------------------
# Zellij configuration
# ----------------------------------------------------------------------
# if command -v zellij &> /dev/null; then
#   eval "$(zellij setup --generate-auto-start zsh)"
# fi

# ----------------------------------------------------------------------
# FZF configuration
# ----------------------------------------------------------------------
if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
fi

# ----------------------------------------------------------------------
# ZSH auto-suggestions
# ----------------------------------------------------------------------
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

