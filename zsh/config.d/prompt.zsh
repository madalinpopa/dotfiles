# ----------------------------------------------------------------------
# Author: Madalin Popa             
# Email: coderustle@madalinpopa.com 
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# Zsh Hook and VCS Configuration
# ----------------------------------------------------------------------
autoload add-zsh-hook
autoload -U compinit; compinit

# Enable and configure vcs_info for various version control systems
autoload -Uz vcs_info
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:*' enable hg git cvs svn
zstyle ':vcs_info:*' formats '%s|%b|%a|%i|%R|%r|%S|%m'

# Completion Configuration
zstyle ":completion:*" menu select=2
zstyle ":completion:*" list-colors ""
zstyle ":completion:*" matcher-list "" "m:{a-z}={A-Z}" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=* l:|=*"

# ----------------------------------------------------------------------
# Prompt Setup
# ----------------------------------------------------------------------
function promptSetup() {
    setopt prompt_subst

    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))

    # Color and prompt initialization
    NOCOLOR="%{$terminfo[sgr0]%}"
    PS1=''; RPS1=''
    PS2="↷ %_>"; RPS2=''
    PS3="↷ ?#"; RPS3=''
    PS4="↷ +i>"; RPS3=''

    # Prepare VCS information
    local VCS_LINE='' VCS='' VCS_TYPE='' VCS_BRANCH='' VCS_CHANGES=''
    VCS=$vcs_info_msg_0_
    VCS_TYPE=$VCS[(ws:|:)1]
    VCS_BRANCH=$VCS[(ws:|:)2]
    
    # Set VCS-specific prompt
    if [[ -n $VCS_TYPE ]]; then
        VCS_LINE+=$NOCOLOR
        case $VCS_TYPE in
            'hg')
                VCS_LINE+='☿ '
                VCS_CHANGES=$(hg st 2>/dev/null | wc -l)
                ;;
            'git')
                local TOP=$(git rev-parse --show-toplevel)
                TOP=${TOP##*/}
                local DESC=$(git describe --always --dirty)
                VCS_LINE+="± $VCS_BRANCH @ $TOP / $DESC"
                ;;
            *)
                VCS_LINE+="$VCS_TYPE "
                ;;
        esac
    fi

    # Add changes marker if applicable
    if [[ $VCS_CHANGES -gt 0 ]]; then
        VCS_LINE+="%F{166}%B★ $VCS_CHANGES "
    fi

    # Root shell gets a special prompt
    local CURRENT_USER=$(whoami)
    local PR_SIGN=$NOCOLOR"%F{81}%B"

    # Add hostname and directory if on a remote server
    if [[ -z "$MYHOSTEXPRESSION" ]]; then
        MYHOSTEXPRESSION="^$"  # Default expression if not set
    fi

    if [[ ! "$(hostname)" =~ "$MYHOSTEXPRESSION" ]]; then
        PR_SIGN+="%T $(hostname) [~/%1d] "
    fi

    # Set the prompt sign based on user context
    if [[ $CURRENT_USER == 'root' ]]; then
        PR_SIGN+="☠"
    elif [[ $POETRY_ACTIVE == "1" ]]; then
        local PYTHON_VERSION=$(python --version | cut -d " " -f 2)
        PR_SIGN+="Ƥ ${PYTHON_VERSION}"
    elif [[ -n "$VIRTUAL_ENV" ]]; then
        PR_SIGN+="${VIRTUAL_ENV_PROMPT} 🐍"
    else
        PR_SIGN+="∴"
    fi

    PR_SIGN+="%F{white}%b"

    # Use terminfo for positioning and reset
    local terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]

    # Construct the final prompt
    PS1=$'\n'                            # Newline before prompt
    PS1+="%{$terminfo_down_sc$VCS_LINE$terminfo[rc]%}"  # VCS info
    PS1+=%(?..'%F{136}%B%'?)              # Display last error code if present
    PS1+=$PR_SIGN                         # User prompt sign
    PS1+=" "                              # Add space after prompt
}

# Hook to call the prompt setup function before each command
add-zsh-hook precmd promptSetup

# ----------------------------------------------------------------------
# Extra Hooks and Functions
# ----------------------------------------------------------------------

# Remove the second line after the prompt on execution
function eraseSecondLine() {
    print -rn -- $terminfo[el]
}
add-zsh-hook preexec eraseSecondLine

# Set window title to current directory
function set-window-title() {
    local MYTITLE=$(basename $PWD)
    MYTITLE=${MYTITLE: -20}
    echo -e "\033];$MYTITLE\007"
}
add-zsh-hook precmd set-window-title

# Update date environment variable before each prompt
function update-date() {
    export DATE=$(date +%d-%m-%Y)
}
add-zsh-hook precmd update-date
