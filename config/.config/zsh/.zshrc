# ~/.config/zsh/.zshrc
# Zsh Run Commands

# Source functions TODO: Replace with a package manager
source "$ZDOTDIR/functions.zsh"

zsh_add_file "completion.zsh"
zsh_add_file "settings.zsh"
zsh_add_file "aliases.zsh"
zsh_add_file "keybindings.zsh"
zsh_add_file "prompt.zsh"
zsh_add_file "vim-mode.zsh"

# plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_completion "zsh-users/zsh-completions" true

# Node Version Manager
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/eevos/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
