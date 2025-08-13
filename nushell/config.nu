source ./theme.nu

$env.config.show_banner = false

$env.PROMPT_COMMAND = {
  $"(ansi blue_dimmed)" + $env.USER + "@" + (sys host | get hostname) + $"(ansi reset)" + $"(ansi white_dimmed):(ansi reset)" + $"(ansi green_dimmed)($env.PWD | str replace -r $"^/home/($env.USER)" "~")(ansi reset)" + "\n" + $"(ansi white_dimmed)[(ansi reset)(ansi red_dimmed)(job list | length)(ansi reset)(ansi white_dimmed)](ansi reset)(ansi red_dimmed)($env.LAST_EXIT_CODE)(ansi reset)"
}

$env.PROMPT_INDICATOR = {$"(ansi white_dimmed)$ (ansi reset)"}

$env.PROMPT_COMMAND_RIGHT = {
   $"(ansi white_dimmed)" + "  " + (((sys mem | get used | into int) / (sys mem | get total | into int)) * 100 | into string --decimals 2) + "%" + " 󰁹 " + (cat /sys/class/power_supply/BAT0/capacity) + "%" + $"(ansi reset)"
}

alias ls = ls -a

$env.path ++= [
  "~/.local/bin"
]

