if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi

if ! pgrep -x "gpg-agent" > /dev/null; then
  gpgconf --launch gpg-agent
fi

