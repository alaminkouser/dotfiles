if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi

if ! pgrep -x "gpg-agent" > /dev/null; then
  gpgconf --launch gpg-agent
fi

if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
  # $(which sshd)
  # pg_ctl -D $HOME/FILES/DATABASE -l /dev/null start  
fi
