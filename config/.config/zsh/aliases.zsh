#!/bin/sh
# ZSH Aliases

# Apps
alias arduino="~/downloads/arduino-ide_2.2.1_Linux_64bit.AppImage"
alias browser=chrome
alias chrome='google-chrome'
alias google-chrome='google-chrome-stable'
alias postman="~/downloads/Postman/Postman"
alias rpi-imager="sudo rpi-imager"

# Dmenu -----------------------------------------------------------------------

alias dmenu="dmenu -l 10 -fn Terminus:pixelsize=12 -h 26 -nb '#090B10'  -nf '#9899a0' -sb '#090B10' -sf '#fabd2f'"

# Docker ----------------------------------------------------------------------

# Docker Kill All Containers
alias dkac='docker kill $(docker ps -q)'
# Docker Remove All Containers
alias drac='docker rm $(docker ps -a -q)'
# Docker Remove All Images
alias drai='docker kill $(docker ps -q)'

# Git -------------------------------------------------------------------------
# git status
alias gs="git status"
# git add
alias ga="git add "
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

# Create a new session
alias tmcs='tmux new -s $1'
# Attach to an existing session
alias tmas='tmux-attach-session'
# Kill a session
alias tmks='tmux-kill-session'
# Create a Git based session
alias tmgs='tmux-git-session'

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

