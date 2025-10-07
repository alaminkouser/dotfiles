PS1="\[\e[5 q\]\[\e]2;[\j]\$?:\w\a\]\[\033[38;2;64;64;128;1m\]\u@\h\[\033[0m\]:\[\033[38;2;64;128;64;1m\]\w\[\033[0m\]\n[\[\033[38;2;128;64;64;1m\]\j\[\033[0m\]]\[\033[38;2;128;64;64;1m\]\$?\[\033[0m\]\$ "
PS2="$> "


alias ls="ls -lah --group-directories-first --color"
alias z="zellij attach --create main"
alias aria2c="aria2c -x 16 --seed-time=0"
alias rm="rm -rfv"

export EDITOR="nvim"

PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.local/bin/busybox:$PATH"
PATH="$HOME/.local/bin/nvim/bin:$PATH"
PATH="$HOME/.local/bin/yazi:$PATH"
PATH="$HOME/.local/bin/miniconda/bin:$PATH"
PATH="$HOME/.local/bin/node/bin:$PATH"
PATH="$HOME/.local/bin/zig:$PATH"
PATH="$HOME/.local/bin/lua:$PATH"
PATH="$HOME/.local/bin/lua-language-server/bin:$PATH"

# Deno
export DENO_INSTALL="$HOME/.local/bin/deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Nushell
PATH="$HOME/.local/bin/nushell:$PATH"

# Pandoc
PATH="$HOME/.local/bin/pandoc:$PATH"

# google-cloud-sdk
PATH="$HOME/.local/bin/google-cloud-sdk/bin:$PATH"

# Dotnet
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true

which gpgconf > /dev/null && export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)" && export GPG_TTY=$(tty)

# fzf
which fzf > /dev/null && eval "$(fzf --bash)"
export FZF_COMPLETION_TRIGGER=""
export FZF_COMPLETION_DIR_OPTS="--walker dir,follow,hidden"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#000000,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4 \
--style full \
--reverse \
--bind \"change:first\" \
--select-1 \
--preview \"test -d {} && \
  ls -lah --group-directories-first --color {} || \
  fzf-preview.sh {}\""
