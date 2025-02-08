# ----------------------------------------------------------------------
# Author: Madalin Popa              
# Email: coderustle@madalinpopa.com 
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# Zsh Completion System Initialization
# Ensure Zsh's autocompletion system is loaded before using completions.
# ----------------------------------------------------------------------
autoload -Uz compinit
compinit

# ----------------------------------------------------------------------
# Bun Completions
# Load Bun's autocompletion if available.
# ----------------------------------------------------------------------
BUN_COMPLETION="$HOME/.bun/_bun"
[[ -s "$BUN_COMPLETION" ]] && source "$BUN_COMPLETION"

# ----------------------------------------------------------------------
# NVM Bash Completions
# Load Node Version Manager (NVM) bash completions if available.
# ----------------------------------------------------------------------
NVM_BASH_COMPLETION="$NVM_DIR/bash_completion"
[[ -s "$NVM_BASH_COMPLETION" ]] && source "$NVM_BASH_COMPLETION"

# ----------------------------------------------------------------------
# Kubectl Completions
# Load Kubernetes' command-line tool (kubectl) completions if available.
# ----------------------------------------------------------------------
if command -v kubectl &> /dev/null; then
   source <(kubectl completion zsh)
fi

# ----------------------------------------------------------------------
# Kustomize Completions
# Load Kustomize (a Kubernetes customization tool) completions if available.
# ----------------------------------------------------------------------
if command -v kustomize &> /dev/null; then
  source <(kustomize completion zsh)
fi

# ----------------------------------------------------------------------
# OP Completions
# ----------------------------------------------------------------------
if command -v op %> /dev/null; then
    eval "$(op completion zsh)"; compdef _op op
fi

