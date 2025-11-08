if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi

if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
  $HOME/.local/bin/miniconda/bin/gpgconf --launch gpg-agent
  $HOME/.local/bin/miniconda/bin/sshd -f ./.ssh/sshd/sshd_config
  $HOME/.local/bin/miniconda/bin/pg_ctl -D $HOME/FILES/DATABASE -l /dev/null start  
  exec sway
fi
