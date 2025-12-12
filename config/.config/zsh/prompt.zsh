#!/bin/sh
# ~/.config/zsh/prompt.zsh
# Clean ZSH prompt using vcs_info, with icons preserved.

autoload -Uz vcs_info
setopt prompt_subst

# ──────────────────────────────────────────────────────────
# vcs_info configuration
# ──────────────────────────────────────────────────────────

# Git only
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true

# Untracked files marker "!"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == 'true' ]] &&
       git status --porcelain | grep '??' >/dev/null; then
        hook_com[staged]+='!'   # "!" when untracked files exist
    fi
}

# Git formatting with icons preserved:
# %m = staged, %u = unstaged, %c = conflicts, %b = branch
zstyle ':vcs_info:git:*' formats \
  " %{$fg[blue]%}(%{$fg[yellow]%}%m%{$fg[red]%}%u%{$fg[yellow]%}%c%{$fg[orange]%}%{$fg[magenta]%} %b%{$fg[blue]%})"

# Run before each prompt
precmd() { vcs_info }

# ──────────────────────────────────────────────────────────
# PROMPT
# ──────────────────────────────────────────────────────────

PROMPT=""
PROMPT+="%{$fg[cyan]%}%~" # Current directory
PROMPT+="\$vcs_info_msg_0_ " # Git info (icons included)
PROMPT+="%{$reset_color%}"
PROMPT+="%(?.%{$fg[yellow]%}$ .%{$fg[red]%}$  )" # Colored prompt symbol depending on exit status

