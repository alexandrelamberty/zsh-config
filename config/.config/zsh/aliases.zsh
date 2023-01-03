#!/bin/sh

# IKBS ------------------------------------------------------------------------

alias logs='nvim $HOME/logs/README.md'
alias ideas='nvim ./ideas/README.md'
alias topics='nvim ./topics/README.md'
alias todos='nvim ./todos/README.md'

# Software configurations

alias i3rc='nvim ~/.config/i3/'
alias nvimrc='nvim ~/.config/nvim/'
alias polybarrc='nvim ~/.config/polybar/'
alias tmuxrc='nvim ~/.tmux.conf'
alias zshrc='nvim ~/.config/zsh/'

# Dmenu -----------------------------------------------------------------------

alias dmenu="dmenu -l 10 -fn Terminus:pixelsize=12 -h 26 -nb '#090B10'  -nf '#9899a0' -sb '#090B10' -sf '#fabd2f'"

# Docker ----------------------------------------------------------------------

# Docker Kill All Containers
alias dkac='docker kill $(docker ps -q)'
# Docker Remove All Containers
alias drac='docker rm $(docker ps -a -q)'
# Docker Remove All Images
alias drai='docker kill $(docker ps -q)'

# Nvim -------------------------------------------------------------------------

alias nv='nvim .'

# Pacman ----------------------------------------------------------------------

alias pu="sudo pacman -Syu"
alias pmirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias pmirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias pmirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias pmirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
# For when keys break
alias p-fix-keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"

# Tmux -------------------------------------------------------------------------

# Tmux attach session
alias tas='tmux attach-session -t $(tmux ls | sed -E "s/:.*$//" | fzf --reverse --height 40%)'
# Tmux kill Session
alias tks='tmux kill-session -t $(tmux ls | sed -E "s/:.*$//" | fzf --reverse --height 40%)'

# Zsh --------------------------------------------------------------------------

alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e \
'{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"

# File system -----------------------------------------------------------------
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
# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Disks ----------------------------------------------------------------------

alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# Processes -------------------------------------------------------------------

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# systemd
alias stle="systemctl list-unit-files --state=enabled"

# Git -------------------------------------------------------------------------

alias gcm="git checkout master"
alias gup="git add . && git commit -m 'up' && git push"
gsb() {
  BR="$(git branch | fzf )"
  CBR="${BR:2}"
  git checkout $CBR
}

# Stow the passed package name
stowth() {
	stow -vSt ~ $1
}

# Unstow the passed package name
unstow() {
	stow -vDt ~ $1
}

# Users
alias users="cat /etc/passwd | awk -F: '{print $1 "," $2}' | column -s, -t | fzf"

# Wifi
alias whome="nmcli dev wifi connect WiFi-2.4-62E0 password c6RC9zk3aR2P "

