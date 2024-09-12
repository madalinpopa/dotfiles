
# executable search path;
export PATH=/usr/local/bin:$PATH;
export PATH=/usr/local/sbin:$PATH;
export PATH=$HOME/.local/bin:$PATH;
export PATH=$HOME/.local/sbin:$PATH;
export PATH=$HOME/.cargo/bin:$PATH;

# XDG Base Directory Specification;
# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config";
export XDG_CACHE_HOME="$HOME/.cache";
export XDG_DATA_HOME="$HOME/.local/share";
export XDG_DATA_DIRS="/usr/local/share:/usr/share";

# Set date as DD-MM-YYYY
export DATE=$(date +%d-%m-%Y);

# You may need to manually set your language environment
export LANG=en_US.UTF-8;

# Enable  256 color support
# export TERM="xterm-256color";

# Enable colors for ls, etc.
export CLICOLOR=1;

# Bun
export BUN_INSTALL="$HOME/.bun";
export PATH="$BUN_INSTALL/bin:$PATH";

# NVM export
export NVM_DIR="$HOME/.nvm";

# Needed for GNU-GPG
export GPG_TTY=$(tty);

# Export default editor
export EDITOR=vim;
export VISUAL=vim;

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X";

# Go bin is used by Go to install binaries
export GOBIN=~/.local/bin/
