#!/bin/bash
# config/.config/zsh/.zshrc
# ZSH Configuration 
# Author: Alexandre Lamberty <mail@alexandrelamberty.com>

# ZSH Environment
export ZDOTDIR=$HOME/.config/zsh
source "$ZDOTDIR/.zshrc"
echo "ZSH Configuration loaded"

# Node Version Manager
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
