#!/usr/bin/env sh

gum style --foreground "#FFF" --align center "SESSION MANAGER"

session=$(
    printf "CREATE NEW SESSION\n%s" "$(zellij list-sessions --short | sort)" 2>/dev/null |
    gum filter --no-show-help --header "CHOOSE:"
)

[ -z "$session" ] && exit 0

if [ "$session" = "CREATE NEW SESSION" ]; then
    session=$(gum input --cursor.foreground "#FFF" --placeholder "Enter new session name..." --no-show-help)
    [ -z "$session" ] && exit 0
fi


zellij action switch-session $session
