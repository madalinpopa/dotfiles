ATTRIBUTE_BOLD='\[\e[1m\]'
ATTRIBUTE_RESET='\[\e[0m\]'
COLOR_DEFAULT='\[\e[39m\]'
COLOR_RED='\[\e[31m\]'
COLOR_GREEN='\[\e[32m\]'
COLOR_YELLOW='\[\e[33m\]'
COLOR_BLUE='\[\e[34m\]'
COLOR_MAGENTA='\[\e[35m\]'
COLOR_CYAN='\[\e[36m\]'

machine_name() {
    if [[ -f $HOME/.name ]]; then
        cat $HOME/.name
    else
        hostname
    fi
}

PROMPT_DIRTRIM=3

if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
fi

function changes_in_branch() {
    if [ -d .git ]; then
        if expr length + "$(git status -s)" 2>&1 >/dev/null; then
            echo -ne "\033[0;33m$(__git_ps1)\033[0m"
        else
            echo -ne "\033[0;32m$(__git_ps1)\033[0m"
        fi
    fi
}

function setps1() {
    PS1="\n${COLOR_BLUE}#${COLOR_DEFAULT} ${COLOR_CYAN}\\u${COLOR_DEFAULT} ${COLOR_GREEN}at${COLOR_DEFAULT} ${COLOR_MAGENTA}\$(machine_name)${COLOR_DEFAULT}${COLOR_GREEN} in ${COLOR_DEFAULT}${COLOR_YELLOW}\w${COLOR_DEFAULT}${COLOR_GREEN}$(changes_in_branch)${COLOR_DEFAULT} \n\$(if [ \$? -ne 0 ]; then echo \"${COLOR_RED}!${COLOR_DEFAULT} \"; fi)${COLOR_BLUE}>${COLOR_DEFAULT} "
}

PROMPT_COMMAND=setps1

PS2="${COLOR_BLUE}>${COLOR_DEFAULT} "

COLOR_GRAY='\e[38;5;246m'

demoprompt() {
    PROMPT_DIRTRIM=1
    PS1="${COLOR_GRAY}\w ${COLOR_BLUE}\$ "
    trap '[[ -t 1 ]] && tput sgr0' DEBUG
}
