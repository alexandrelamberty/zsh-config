#!/usr/bin/env zsh
# ~/.zshenv
# ZSH Environment Variables

# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_BIN_HOME="$HOME/.local/bin" # https://gitlab.freedesktop.org/xdg/xdg-specs/-/issues/63

# Environment
export BROWSER="google-chrome-stable"
export TERMINAL="alacritty"
export EDITOR="nvim"

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s" # apt install source-highlight

export LESS='-R' # Get color support for 'less'
export MANWIDTH=999
export MANPAGER='nvim +Man!'
export COLORTERM=truecolor

export GOPATH="$HOME/.local/share/go"
export GOBIN="$GOPATH/bin"


