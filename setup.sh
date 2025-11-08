#!/usr/bin/env sh

# To-Do: Needs curl, so check check curl installation and download curl if not found.

curl -sS https://starship.rs/install.sh | \
  sh -s -- --bin-dir $HOME/.local/bin --yes

curl -fsSL https://tombi-toml.github.io/tombi/install.sh | sh

printf "Downloading fzf-preview.sh\n"
curl "https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/bin/fzf-preview.sh" \
  -o "$HOME/.local/bin/fzf-preview.sh" \
  --progress-bar
chmod 700 "$HOME/.local/bin/fzf-preview.sh"
