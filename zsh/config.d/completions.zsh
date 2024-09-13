# -----------------------------------
# Author: Madalin Popa              -
# Email: coderustle@madalinpopa.com -
# -----------------------------------

# Ensure Zsh completion system is loaded
autoload -Uz compinit
compinit

# Bun completions
BUN_COMPLETION="$HOME/.bun/_bun"
[[ -s "$BUN_COMPLETION" ]] && source "$BUN_COMPLETION"

# Nvm bash completions
NVM_BASH_COMPLETION="$NVM_DIR/bash_completion"
[[ -s "$NVM_BASH_COMPLETION" ]] && source "$NVM_BASH_COMPLETION"

# Kubectl completions
if command -v kubectl &> /dev/null; then
   source <(kubectl completion zsh)
fi

# Kustomize completions
if command -v kustomize &> /dev/null; then
  source <(kustomize completion zsh)
fi
