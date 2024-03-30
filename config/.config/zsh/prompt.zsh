#!/bin/sh
# ZSH - Prompt
# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
# https://stackoverflow.com/questions/57468808/zsh-prompt-with-directory-and-virtual-environment
# https://www.csse.uwa.edu.au/programming/linux/zsh-doc/zsh_13.html

autoload -Uz vcs_info
precmd() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:*' enable git

# add a function to check for untracked files in the directory.
# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] &&
    git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
# 
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}[%{$fg[yellow]%}%m%{$fg[red]%}%u%{$fg[yellow]%}%c%{$fg[orange]%} %{$fg[magenta]%} %b%{$fg[blue]%}]"


prompt_virtualenv () {
    # Check if we are in a virtual environment
    # if we are then VIRTUAL_ENV variable will be set
    local virtualenv_path="$VIRTUAL_ENV"
    if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]
    then
        # We are in virtual env so show just the project name
        prompt_segment blue black "(`basename $virtualenv_path`)"
    fi
}

# PROMPT='$(build_my_zsh_prompt)'

# PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %(?:%{$fg[green]%}➜ :%{$fg[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT=""
# PROMPT+="%{$fg[yellow]%}%n%{$fg[red]%}@%{$fg[blue]%}%m "
PROMPT+="%{$fg[cyan]%}%~" # Current PWD folder name
PROMPT+="\$vcs_info_msg_0_ " # Git
PROMPT+="%{$reset_color%}"
PROMPT+="%(?.%{$fg[yellow]%}$ .%{$fg[red]%}$ )" # The return code of the last command executed.
PROMPT+="%b" # Start (stop) boldface mode
