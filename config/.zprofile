#!/usr/bin/env zsh
# ~/.zprofile
# Zsh Login Shell Configuration

# SSH Keyring
if [ -n "$DESKTOP_SESSION" ]; then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi

# GPG Agent
if [ -n "$GPG_AGENT_INFO" ]; then
  export GPG_AGENT_INFO
else
  if [ -f "$HOME/.gpg-agent-info" ]; then
    source "$HOME/.gpg-agent-info"
    export GPG_AGENT_INFO
  fi
fi

# Start the gpg-agent if not running
if [ -z "$GPG_AGENT_INFO" ]; then
  eval $(gpg-agent --daemon --write-env-file "$HOME/.gpg-agent-info" --enable-ssh-support)
fi

# Start the ssh-agent if not running
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval $(ssh-agent -s)
fi

# Start background applications
picom --config ~/.config/picom.conf &
nm-applet &
blueman-applet &
