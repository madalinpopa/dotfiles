
# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias dl="cd ~/Downloads"
alias p="cd ~/Projects"
alias g="git"
alias k="kubectl"

# List all files colorized in long format, excluding . and ..
alias la="ls -lAF --color=auto"

# List only directories
alias lsd="ls -lF --color | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls --color=auto"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# git related aliases
alias gag='git exec ag'

# use neovim diff
alias vimdiff='nvim -d'

# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# LazyGit aliases
alias lg=lazygit

# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'

# zellij aliases
alias z='zellij'
