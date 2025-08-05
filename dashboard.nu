#!/usr/bin/env nu

def getOngoingCalendarNotes []: nothing -> string {
  const NOTES_PATH: string = ($nu.home-path | path join ".local/share/notes")
  return "Hello"
}

def main [] {
  http get "https://wttr.in/Dhaka?format=%C%20%c%t%20(Feels%20Like:%20%f)\\nMoon:%20%m%20(Day:%20%M)\\nSunrise:%20%S%20|%20Sunset:%20%s\\nWind:%20%w\\n" | print
  getOngoingCalendarNotes

}
