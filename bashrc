PS1="\[\e[5 q\]\[\e]2;[\j]\$?:\w\a\]\[\033[38;2;64;64;128;1m\]\u@\h\[\033[0m\]:\[\033[38;2;64;128;64;1m\]\w\[\033[0m\]\n[\[\033[38;2;128;64;64;1m\]\j\[\033[0m\]]\[\033[38;2;128;64;64;1m\]\$?\[\033[0m\]\$ "
PS2="$> "

alias ls="ls -lah --group-directories-first --color"
alias z="zellij attach --create main"
alias aria2c="aria2c -x 16 --seed-time=0"

export EDITOR="nvim"

PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.local/bin/busybox:$PATH"
PATH="$HOME/.local/bin/nvim/bin:$PATH"
PATH="$HOME/.local/bin/yazi:$PATH"
PATH="$HOME/.local/bin/miniconda/bin:$PATH"
PATH="$HOME/.local/bin/node/bin:$PATH"
PATH="$HOME/.local/bin/helix:$PATH"
PATH="$HOME/.local/bin/lua-language-server/bin:$PATH"

# Deno
export DENO_INSTALL="$HOME/.local/bin/deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Nushell
PATH="$HOME/.local/bin/nushell:$PATH"

# Dotnet
export PATH="$HOME/.dotnet:$PATH" && export DOTNET_ROOT="$HOME/.dotnet"
