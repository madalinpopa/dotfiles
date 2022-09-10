HISTSIZE=1048576
HISTFILE="$HOME/.bash_history"
SAVEHIST=$HISTSIZE
shopt -s histappend # append to history file

export EDITOR=vim

# anki blank window
export QTWEBENGINE_CHROMIUM_FLAGS="--no-sandbox"

# Java Home
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
