# shellcheck shell=zsh
# ~/.config/zsh/aliases.zsh
# ZSH Aliases

# Dmenu -----------------------------------------------------------------------

# Docker Kill/Remove Helpers
_docker_available() {
    if ! command -v docker >/dev/null 2>&1; then
        printf 'docker command not found.\n' >&2
        return 1
    fi
}

dkac() {
    _docker_available || return 1
    local -a ids
    ids=("${(@f)$(docker ps -q 2>/dev/null)}")
    if (( ${#ids[@]} == 0 )); then
        printf 'No running containers.\n'
        return 0
    fi
    docker kill "${ids[@]}"
}

drac() {
    _docker_available || return 1
    local -a ids
    ids=("${(@f)$(docker ps -aq 2>/dev/null)}")
    if (( ${#ids[@]} == 0 )); then
        printf 'No containers to remove.\n'
        return 0
    fi
    docker rm "${ids[@]}"
}

drai() {
    _docker_available || return 1
    local -a images
    images=("${(@f)$(docker images -q 2>/dev/null)}")
    if (( ${#images[@]} == 0 )); then
        printf 'No images to remove.\n'
        return 0
    fi
    docker rmi "${images[@]}"
}

# Git -------------------------------------------------------------------------
# git status
alias gs="git status"
# git add
alias ga="git add"
# git commit
alias gc="git commit"
# checkout master 
alias gcm="git checkout master"
# fast add, commit and push
alias gup="git add . && git commit -m 'up' && git push"
# switch branch
alias gsb="git-switch-branch"
# open remote repository
alias gor="git-open-remote"
# clone repository
alias gcr="git-clone"
# clone personal repo
alias gcpr="git-clone-personal"

# NPM -------------------------------------------------------------------------

alias ni="pnpm install"
alias nr="pnpm run"
alias ne="npm-execute-script"

# Nvim -------------------------------------------------------------------------

alias nv='nvim .'

# Tmux -------------------------------------------------------------------------

tmcs() {
    local session="${1:-main}"
    tmux new -s "$session"
}
alias tmas='tmux-attach-session'  # Attach to an existing session 
alias tmks='tmux-kill-session'    # Kill a session
alias tmgs='tmux-git-session'     # Create a Git based session

# System ----------------------------------------------------------------------

alias bye="sudo shutdown -h now"
alias df='df -h'
alias free='free -m'
alias log='sudo tail -f'
alias ls='ls --color=tty --group-directories-first'
alias ll='ls -1 --group-directories-first'
alias la='ls -a'
alias tr='tree -L 2 --dirsfirst'
alias cp="cp -i"
alias grep='grep --color=auto'
alias grepe='egrep --color=auto'
alias grepf='fgrep --color=auto'
alias mv='mv -i'
alias rm='rm -i'
