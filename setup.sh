#!/usr/bin/env sh

printf "Downloading fzf-preview.sh\n"
curl "https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/bin/fzf-preview.sh" \
  -o "$HOME/.local/bin/fzf-preview.sh" \
  --progress-bar
chmod 700 "$HOME/.local/bin/fzf-preview.sh"
