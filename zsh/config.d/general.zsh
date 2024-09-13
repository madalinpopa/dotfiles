# -----------------------------------
# Author: Madalin Popa              -
# Email: coderustle@madalinpopa.com -
# -----------------------------------


ZSH_FUNC_DIR="${ZDOTDIR:-$HOME}/.zsh_functions"
if [[ -d "$ZSH_FUNC_DIR" ]]; then
   fpath+=("$HOME/.zfunc" "$ZSH_FUNC_DIR")
else
   mkdir -p "$ZSH_FUNC_DIR"
   fpath+=("$HOME/.zfunc" "$ZSH_FUNC_DIR")
fi

# Set PATH, MANPATH, etc., for Homebrew
if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Load NVM if available
NVM_SCRIPT="$NVM_DIR/nvm.sh"
[[ -s "$NVM_SCRIPT" ]] && source "$NVM_SCRIPT"

# Load Cargo if available
CARGO_ENV="$HOME/.cargo/env"
[[ -f "$CARGO_ENV" ]] && source "$CARGO_ENV"

# Load direnv if available
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# Start WSL SSH Agent Relay if available (for Windows SSH agent communication)
WSL_SSH_RELAY="$HOME/.local/bin/wsl-ssh-agent-relay"
if [[ -f "$WSL_SSH_RELAY" ]]; then
  "$WSL_SSH_RELAY" start
  export SSH_AUTH_SOCK="$HOME/.ssh/wsl-ssh-agent.sock"
fi
