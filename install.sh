#!/bin/bash
# ZSH configuration installation

PACKAGE=config
TARGET=$HOME
DIR="$(dirname "$0")"

printf "ZSH configuration installation\n"
stow -d "$DIR" -vDt "$TARGET" $PACKAGE
rm "$HOME/.zshrc" 
rm -rf "$HOME/.config/zsh"
stow -d "$DIR" -vSt "$TARGET" $PACKAGE

