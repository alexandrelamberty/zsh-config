# ZSH Environment
# ~/.config/zsh/.zshenv

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
# https://gitlab.freedesktop.org/xdg/xdg-specs/-/issues/63
export XDG_BIN_HOME="$HOME/.local/bin"

# FZF
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'

## History
#HISTFILE="$XDG_DATA_HOME/zsh/history"
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Environment
export BROWSER="google-chrome-stable"
export EDITOR="nvim"
# apt install source-highlight
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
# Get color support for 'less'
export LESS='-R'
export MANWIDTH=999
export MANPAGER='nvim +Man!'

# Paths
export GOPATH="$HOME/.local/share/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/bin/:$PATH"

# SSH Keyring
if [ -n "$DESKTOP_SESSION" ]; then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi
