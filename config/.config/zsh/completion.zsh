# shellcheck shell=zsh
# ~/.config/zsh/completion.zsh
# ZSH Completions

: "${ZDOTDIR:=$HOME/.config/zsh}"

zmodload zsh/complist

# Faster and stable completion cache
ZSH_DISABLE_COMPFIX=true

# Deduplicate custom completion directories
typeset -gU fpath
[[ -d "$ZDOTDIR/plugins/zsh-completions/src" ]] && fpath=("$ZDOTDIR/plugins/zsh-completions/src" $fpath)
[[ -d "$ZDOTDIR/completions" ]] && fpath=("$ZDOTDIR/completions" $fpath)

autoload -Uz compinit

ZCOMP_CACHEDIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p "$ZCOMP_CACHEDIR"
ZCOMP_DUMP="$ZCOMP_CACHEDIR/.zcompdump"
compinit -d "$ZCOMP_DUMP"

# Compile for faster startup
[[ -f "$ZCOMP_DUMP" ]] && zcompile "$ZCOMP_DUMP"

_comp_options+=(globdots) # Include hidden files
# Only work with the Zsh function vman
# See $DOTFILES/zsh/scripts.zsh
# compdef vman="man"

# Use hjlk in menu selection (during completion)
# Doesn't work well with interactive mode
# Use vim keys in tab complete menu:
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char

bindkey -M menuselect '^[[Z' vi-up-line-or-history
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

bindkey -M menuselect '^xg' clear-screen
bindkey -M menuselect '^xi' vi-insert                      # Insert
bindkey -M menuselect '^xh' accept-and-hold                # Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  # Next
bindkey -M menuselect '^xu' undo                           # Undo

# +---------+
# | Options |
# +---------+

# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

# +---------+
# | zstyles |
# +---------+

# Ztyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# Define completers
zstyle ':completion:*' menu select
zstyle ':completion:*'  completer _files _extensions _complete _approximate
zstyle ':completion:*:*'  completer _files _extensions _complete _approximate
# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' verbose true
zstyle ':completion:*' complete true
zle -C alias-expension complete-word _generic
bindkey '^Xa' alias-expension
zstyle ':completion:alias-expension:*' completer _expand_alias
# Use cache for commands which use it
# Allow you to select in a menu
# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' file-list name
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases

# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''

zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# See ZSHCOMPWID "completion matching control"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' keep-prefix true

#zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

## For kubernetes
# source $DOTFILES/zsh/plugins/kubectl-completion/_kubectl
# zstyle ':completion:*:*:kubectl:*' list-grouped false

# More completions https://github.com/zsh-users/zsh-completions

[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f "$ZDOTDIR/completions/_fnm" ] && fpath=("$ZDOTDIR/completions" $fpath)
