#!/usr/bin/env bash

# To-Do: Needs curl, so check check curl installation and download curl if not found.

# mkdir -p $HOME/.local/bin/miniconda
# curl "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" \
#   --progress-bar \
#   -o "$HOME/.local/bin/miniconda/miniconda.sh"
# bash "$HOME/.local/bin/miniconda/miniconda.sh" -b -u -p "$HOME/.local/bin/miniconda"
# rm "$HOME/.local/bin/miniconda/miniconda.sh"
# source "$HOME/.local/bin/miniconda/bin/activate"
# conda init bash
conda install \
  conda-forge::openssh \
  anaconda::git \
  conda-forge::gnupg \
  conda-forge::yazi \
  --yes

curl -sS https://starship.rs/install.sh | \
  sh -s -- --bin-dir $HOME/.local/bin --yes

curl -fsSL https://tombi-toml.github.io/tombi/install.sh | sh

printf "Downloading fzf-preview.sh\n"
curl "https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/bin/fzf-preview.sh" \
  -o "$HOME/.local/bin/fzf-preview.sh" \
  --progress-bar
chmod 700 "$HOME/.local/bin/fzf-preview.sh"



