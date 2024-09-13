
# Enable zsh functions
if [ -d "${ZDOTDIR:-$HOME}/.zsh_functions" ]; then
   fpath+=~/.zfunc
   fpath+=${ZDOTDIR:-$HOME}/.zsh_functions
else
   mkdir -p ${ZDOTDIR:-$HOME}/.zsh_functions
   fpath+=~/.zfunc
   fpath+=${ZDOTDIR:-$HOME}/.zsh_functions
fi

# Set PATH, MANPATH, etc., for Homebrew.
if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

# Load homebrew
if [ -f "/opt/homebrew/bin/brew" ]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

# Load Nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Load Cargo
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

# Load direnv
if [ -x "$(command -v direnv)" ]; then
  eval "$(direnv hook zsh)"
fi

# This is needed for WSL to communicate with SSH Agent on Windows
if [ -f "$HOME/.local/bin/wsl-ssh-agent-relay" ]; then
    ${HOME}/.local/bin/wsl-ssh-agent-relay start
    export SSH_AUTH_SOCK=${HOME}/.ssh/wsl-ssh-agent.sock
fi

# Start tmux session
# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#    tmux attach -t default || tmux new -s default
# fi
