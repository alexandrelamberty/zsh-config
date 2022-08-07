# Zsh Run Commands
# ~/.config/zsh/.zshrc

# Source functions TODO: Replace with a package manager
export ZDOTDIR=$HOME/.config/zsh
source "$ZDOTDIR/functions.zsh"

zsh_add_file "settings.zsh"
zsh_add_file "aliases.zsh"
zsh_add_file "completion.zsh"
zsh_add_file "exports.zsh"
zsh_add_file "keybinds.zsh"
zsh_add_file "prompt.zsh"
zsh_add_file "vim-mode.zsh"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_completion "esc/conda-zsh-completion" false

