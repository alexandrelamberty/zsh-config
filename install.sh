#!/bin/bash
# ZSH configuration installation

PACKAGE=config
TARGET=$HOME

printf "ZSH configuration installation\n"
printf "Clean target\n"

# Remove needed files
rm "$HOME/.zshrc" 
rm -rf "$HOME/.config/zsh"

# Stow the package
printf "Stow in %s\n" "$TARGET" 
stow -vSt "$TARGET" $PACKAGE
