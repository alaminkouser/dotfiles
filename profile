if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi

if ! pgrep -x "gpg-agent" > /dev/null; then
  gpgconf --launch gpg-agent
fi

if ! pgrep -x "aria2c" > /dev/null; then
  aria2c --enable-rpc=true \
    --rpc-listen-all=false \
    --rpc-listen-port=16800 \
    --rpc-secret=aria2 \
    --input-file="$HOME/.local/share/aria2/aria2.session" \
    --save-session="$HOME/.local/share/aria2/aria2.session" \
    --save-session-interval=60 \
    --continue=true \
    --daemon=true \
    -x 16 \
    --dir="$HOME/FILES/DOWNLOADS"
fi