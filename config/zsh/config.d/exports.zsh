
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# anki blank window
export QTWEBENGINE_CHROMIUM_FLAGS="--no-sandbox"

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
# Set PATH, MANPATH, etc., for Homebrew.
if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
if [ -f "/opt/homebrew/bin/brew" ]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

# settings for pyenv
if [ -f "/home/linuxbrew/.linuxbrew/bin/pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# bun completions
[ -s "/Users/madalinpopa/.bun/_bun" ] && source "/Users/madalinpopa/.bun/_bun"

# kubectl completions
if [ -x "$(command -v kubectl)" ]; then
        source <(kubectl completion zsh)
fi

# kustomize completions
if [ -x "$(command -v kustomize)" ]; then
        source <(kustomize completion zsh)
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if [ -x "$(command -v thefuck)" ]; then
  eval $(thefuck --alias)
fi

# Alacrity completions
if [ -d "${ZDOTDIR:-~}/.zsh_functions" ]; then
   fpath+=~/.zfunc
   fpath+=${ZDOTDIR:-~}/.zsh_functions
else
   mkdir -p ${ZDOTDIR:-~}/.zsh_functions
   fpath+=~/.zfunc
   fpath+=${ZDOTDIR:-~}/.zsh_functions
fi

