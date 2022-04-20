# ~/.config/zsh/keybinds.zsh
# Keybinds

# Applications

bindkey -s '^o' 'ranger^M'
bindkey -s '^h' 'ranger^M'

# History search
# Fzf provide a keybind with ´Ctrl+r´ for the zsh history 

# Load the functions
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

# Add function to the line editor
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Create bindings
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
