#!/bin/bash
# ~/.config/zsh/settings.zsh
# Zsh Settings

setopt appendhistory
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
unsetopt BEEP

## History
#HISTFILE="$XDG_DATA_HOME/zsh/history"
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Colors
autoload -Uz colors && colors

# Colors for ls
if [ -f ~/.dir_colors ]; then
	eval "$(dircolors -b ~/.dir_colors)"
elif [ -f /etc/DIR_COLORS ]; then
	eval "$(dircolors -b /etc/DIR_COLORS)"
fi

