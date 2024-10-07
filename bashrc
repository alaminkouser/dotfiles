PS1="\[\e]2;[\j]\$?:\w\a\]\[\033[38;2;64;64;128;1m\]\u@\h\[\033[0m\]:\[\033[38;2;64;128;64;1m\]\w\[\033[0m\]\n[\[\033[38;2;128;64;64;1m\]\j\[\033[0m\]]\[\033[38;2;128;64;64;1m\]\$?\[\033[0m\]\$ "
PS2="$> "

alias ls="ls -lah --group-directories-first --color"
alias z="zellij attach --create main"
alias aria2c="aria2c -x 16 --seed-time=0"

PATH="$PATH:$HOME/.local/bin/busybox"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.local/bin/nvim/bin:$PATH"
PATH="$HOME/.local/bin/node/bin:$PATH"
PATH="$HOME/.local/bin/zig:$PATH"
# PATH="$HOME/.local/bin/pandoc/bin:$PATH"
PATH="$HOME/.local/bin/lua:$PATH"
# PATH="$HOME/.local/bin/lua-language-server/bin:$PATH"
PATH="$HOME/.local/bin/helix/usr/bin:$PATH"
PATH="$HOME/.local/bin/sioyek/usr/bin:$PATH"

export DENO_INSTALL="$HOME/.local/bin/deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export EDITOR="nvim"

