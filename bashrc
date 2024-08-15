PS1='\[\e[32;2m\]\u@\h\[\e[0;90m\]:\[\e[34;2m\]\w\[\e[0m\]\n\[\e[90m\][\[\e[31m\]$?\[\e[90m\]]>\[\e[0m\] '

alias ls="ls -lah --group-directories-first --color"
alias z="zellij attach --create"
alias aria2c="aria2c -x 16 --seed-time=0"

PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.local/bin/nvim/bin:$PATH"
PATH="$HOME/.local/bin/zig:$PATH"
