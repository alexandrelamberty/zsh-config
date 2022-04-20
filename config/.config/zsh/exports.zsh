#!/bin/sh

# Zsh configuration directory
export ZDOTDIR=$HOME/.config/zsh

# History
# HISTFILE="$XDG_DATA_HOME/zsh/history"
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Environment
export EDITOR="nvim"
export BROWSER="google-chrome-stable"
export LESS="--RAW-CONTROL-CHARS" # Get color support for 'less'
export MANWIDTH=999
export MANPAGER='nvim +Man!'

# Paths
export GOPATH="$HOME/.local/share/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/bin/:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.fnm:$PATH" # TODO: Check what it is

# Node Version Manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

# Keyring
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
