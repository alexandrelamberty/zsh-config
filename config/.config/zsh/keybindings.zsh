# shellcheck shell=zsh
# ~/.config/zsh/keybindings.zsh
# ZSH Keybindings

# Applications
if command -v ranger >/dev/null 2>&1; then
    bindkey -s '^f' 'ranger^M'
    bindkey -s '^h' 'ranger^M'
fi

# History search
# Fzf already provides a keybinding with 'Ctrl+r' for the zsh history

# Load the functions
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

# Add function to the line editor
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Create bindings
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
