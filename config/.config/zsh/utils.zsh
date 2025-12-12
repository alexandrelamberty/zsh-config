# shellcheck shell=zsh
# ~/.config/zsh/functions.zsh
# ZSH Functions

: "${ZDOTDIR:=$HOME/.config/zsh}"
ZSH_PLUGIN_DIR="$ZDOTDIR/plugins"
mkdir -p "$ZSH_PLUGIN_DIR"

# Sourcing files --------------------------------------------------------------

# Source files if they exist
zsh_add_file() {
    local file="$ZDOTDIR/$1"
    [[ -f "$file" ]] && source "$file"
}

_zsh_clone_plugin() {
    local repo="$1"
    local destination="$2"

    [[ -d "$destination" ]] && return 0
    if ! command -v git >/dev/null 2>&1; then
        printf 'git command is required to clone %s\n' "$repo" >&2
        return 1
    fi

    git clone --depth=1 "https://github.com/$repo.git" "$destination"
}

zsh_add_plugin() {
    local repo="$1"
    local plugin_name="${repo##*/}"
    local plugin_dir="$ZSH_PLUGIN_DIR/$plugin_name"

    _zsh_clone_plugin "$repo" "$plugin_dir" || return

    local loaded=false
    for candidate in "$plugin_dir"/*.plugin.zsh "$plugin_dir"/*.zsh; do
        if [[ -f "$candidate" ]]; then
            source "$candidate"
            loaded=true
            break
        fi
    done

    if [[ $loaded == false ]]; then
        printf 'No loadable entry point found for %s\n' "$plugin_name" >&2
    fi
}

zsh_add_completion() {
    local repo="$1"
    local run_compinit="${2:-false}"
    local plugin_name="${repo##*/}"
    local plugin_dir="$ZSH_PLUGIN_DIR/$plugin_name"

    _zsh_clone_plugin "$repo" "$plugin_dir" || return
    typeset -gU fpath

    [[ -d "$plugin_dir/src" ]] && fpath=("$plugin_dir/src" $fpath)
    fpath=("$plugin_dir" $fpath)

    zsh_add_file "plugins/$plugin_name/$plugin_name.plugin.zsh"

    if [[ $run_compinit == true ]]; then
        autoload -Uz compinit
        compinit -i
    fi
}
