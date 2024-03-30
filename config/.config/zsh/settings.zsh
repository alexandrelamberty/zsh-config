#!/bin/bash
# ~/.config/zsh/settings.zsh
# Zsh settings

setopt appendhistory
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
unsetopt BEEP

# autoload -Uz compinit
# FIXME: No improvement
# https://gist.github.com/ctechols/ca1035271ad134841284
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

# Colors
autoload -Uz colors && colors

# colors for ls
if [ -f ~/.dir_colors ]; then
	eval "$(dircolors -b ~/.dir_colors)"
elif [ -f /etc/DIR_COLORS ]; then
	eval "$(dircolors -b /etc/DIR_COLORS)"
fi

