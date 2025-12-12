# shellcheck shell=zsh
# ~/.config/zsh/paths.zsh
# ZSH Paths Configuration File

typeset -gxU path

path_prepend() {
    local dir="$1"
    [[ -z $dir ]] && return
    mkdir -p "$dir" 2>/dev/null || true
    [[ -d $dir ]] || return
    path=("$dir" "${path[@]}")
}

# User local bin
path_prepend "$HOME/.local/bin"
path_prepend "$HOME/.local/share/bin"

# Specific language binaries
[[ -n ${GOBIN:-} ]] && path_prepend "$GOBIN"
