#!/usr/bin/env sh

[ "$(zellij action list-panes --all | grep -F "\$HOME/.config/zellij/session-manager.sh" | wc -l)" -gt 1 ] && exit 0

session=$(
    printf "# FZF\n# CREATE NEW SESSION\n# DETACH\n%s" "$(zellij list-sessions --short | sort)" 2>/dev/null |
    gum filter --placeholder "Search..." --no-show-help --indicator ">" --indicator.foreground "#FFF"
)

[ -z "$session" ] && exit 0

if [ "$session" = "# CREATE NEW SESSION" ]; then
    session=$(gum input --cursor.foreground "#FFF" --placeholder "Enter new session name..." --no-show-help)
    [ -z "$session" ] && exit 0
fi

if [ "$session" = "# FZF" ]; then
    zellij action write-chars "$(fzf --walker "file,dir,follow,hidden")" -p 0
    exit 0
fi

if [ "$session" = "# DETACH" ]; then
    zellij action detach
    exit 0
fi

if printf "%s\n" "$session" | grep -q "^[^#][A-Za-z0-9-]*$"; then
    zellij action switch-session $session
    exit 0
fi

printf "NOT VALID"
sleep 5
exit 1
