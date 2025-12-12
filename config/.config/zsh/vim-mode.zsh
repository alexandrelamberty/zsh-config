# shellcheck shell=zsh
# ~/.config/zsh/vim-mode.zsh
# ZSH Vim mode
bindkey -v
export KEYTIMEOUT=1

bindkey -v '^?' backward-delete-char

# Zsh Line Editor - Special Widgets

cursor_block='\e[1 q'
cursor_block_blink='\e[2 q'
cursor_beam='\e[5 q'
cursor_beam_blink='\e[6 q'

# Exectued every time a keymap changes.
function zle-keymap-select () {
    case $KEYMAP in
        # Change the
        vicmd) echo -ne '\e[2 q';;      # block
        viins|main) echo -ne '\e[6 q';; # beam
    esac
}
zle -N zle-keymap-select

# Execute every time the line editor is started.
zle-line-init() {
    zle -K viins # Change the zle keymap to `vi insert` mode
    echo -ne "\e[6 q"
}
zle -N zle-line-init

echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.
