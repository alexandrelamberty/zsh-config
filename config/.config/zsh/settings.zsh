#!/bin/bash
# ~/.config/zsh/settings.zsh
# Zsh settings

setopt appendhistory
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
unsetopt BEEP

# Colors
autoload -Uz colors && colors

# colors for ls
if [ -f ~/.dir_colors ]; then
	eval "$(dircolors -b ~/.dir_colors)"
elif [ -f /etc/DIR_COLORS ]; then
	eval "$(dircolors -b /etc/DIR_COLORS)"
fi

# NVM
# TODO: Check configuration this!!!
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
# FIXME: Doe not this need to be ZSH This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

# Terminal title
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

