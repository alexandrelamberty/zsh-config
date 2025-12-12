# shellcheck shell=zsh
# ~/.config/zsh/settings.zsh
# Zsh Settings

setopt appendhistory \
       sharehistory \
       hist_ignore_dups \
       hist_ignore_space \
       autocd \
       extendedglob \
       nomatch \
       menucomplete \
       interactive_comments
unsetopt beep

## History
HIST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/zsh"
mkdir -p "$HIST_DIR"
HISTFILE="$HIST_DIR/history"
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
