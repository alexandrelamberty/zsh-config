#!/bin/bash
# ZSH configuration installation

PACKAGE=config
TARGET=$HOME

printf "ZSH configuration installation\n"
stow -vSt "$TARGET" $PACKAGE
rm "$HOME/.zshrc" 
rm -rf "$HOME/.config/zsh"
stow -vSt "$TARGET" $PACKAGE

