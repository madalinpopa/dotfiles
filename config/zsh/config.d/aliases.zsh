alias ll='ls -lah'
alias la='ls -A'
alias l='ls --color'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# alias vim='nvim'

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
alias ly=lazygit
