#!/usr/bin/env zsh
# ~/.config/zsh/.zshrc
# ZSH Main Configuration File
# Author: Alexandre Lamberty <mail@alexandrelamberty.com>

# Source functions TODO: Replace with a package manager ?
source "$ZDOTDIR/functions.zsh"

# Load configuration files
zsh_add_file "completion.zsh"
zsh_add_file "paths.zsh"
zsh_add_file "settings.zsh"
zsh_add_file "aliases.zsh"
zsh_add_file "keybindings.zsh"
zsh_add_file "prompt.zsh"
zsh_add_file "vim-mode.zsh"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

# Completions
zsh_add_completion "zsh-users/zsh-completions" true