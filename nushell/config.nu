$env.PROMPT_COMMAND = {
  $"(ansi blue_dimmed)" + $env.USER + "@" + (sys host | get hostname) + $"(ansi reset)" + $"(ansi white_dimmed):(ansi reset)" + $"(ansi green_dimmed)($env.PWD | str replace -r $"^/home/($env.USER)" "~")(ansi reset)" + "\n" + $"(ansi white_dimmed)[(ansi reset)(ansi red_dimmed)(job list | length)(ansi reset)(ansi white_dimmed)](ansi reset)(ansi red_dimmed)($env.LAST_EXIT_CODE)(ansi reset)"
}

$env.PROMPT_INDICATOR = {$"(ansi white_dimmed)$ (ansi reset)"}

$env.PROMPT_COMMAND_RIGHT = {
  "󰍛 : " + (((sys mem | get used | into int) / (sys mem | get total | into int)) * 100 | into string --decimals 2) + "%" + " | " + (date now | format date "%Y%m%d %H%M %S")
}

$env.path ++= [
  "~/.local/bin"
]

