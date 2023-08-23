#!/bin/sh

# Tmux create git session ession based on the current git repository and its submodules.
# https://stackoverflow.com/a/49001088/9241975
function tmgs() {
    isGitDirectory() {
        if [ -d ".git" ]
        then
            # # Use -d to allow the rest of the function to run
            project=${PWD##*/}
            # Check if session already exist
            tmux new-session -d -s $project
            tmux new-window -n $project
            # Tmux create a window named after the shell used
            tmux kill-window -t zsh
            # Open README.md with nvim if available
            # TODO: EDITOR env variable
            # TODO: check for README.md
            tmux send-keys -t $project:$project 'nvim README.md' Enter
            
            # Check for submodules
            # -d to prevent current window from changing
            git submodule foreach 'tmux new-window -d -n $name'
            
            # -d to detach any other client
            tmux attach-session -d -t $project
            
            return 0
        else
            return 1
        fi
    }
    
    if isGitDirectory; then ; else echo "Not a Git repository!"; fi
    
}

# Tmux attach session
function tmas() {
    local fsession
    fsession=$(tmux ls | sed -E "s/:.*$//" | fzf --reverse --height 40%) || return
    tmux attach-session -t "$fsession"
}

# Tmux kill session
function tmks() {
    local fsession
    fsession=$(tmux ls | sed -E "s/:.*$//" | fzf --reverse --height 40%) || return
    tmux kill-session -t "$fsession"
}

# GIT

# Git clone repository
gc () {
    git clone git@github.com:${1}
}

# Git clone personal repository
gcr () {
    git clone git@github.com:alexandrelamberty/${1}
}

# Source files if they exist
function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        # For plugins
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

function zsh_add_completion() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        # For completions
        completion_file_path=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
        fpath+="$(dirname "${completion_file_path}")"
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
        fpath+=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
        [ -f $ZDOTDIR/.zccompdump ] && $ZDOTDIR/.zccompdump
    fi
    completion_file="$(basename "${completion_file_path}")"
    if [ "$2" = true ] && compinit "${completion_file:1}"
}
