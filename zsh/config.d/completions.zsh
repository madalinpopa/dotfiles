
# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Nvm completions
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Kubectl completions
if [ -x "$(command -v kubectl)" ]; then
  source <(kubectl completion zsh)
fi

# # Kustomize completions
if [ -x "$(command -v kustomize)" ]; then
  source <(kustomize completion zsh)
fi
