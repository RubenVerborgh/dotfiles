tell application "Safari"
  activate
end tell

tell application "System Events"
  tell process "Safari"
    keystroke "r" using {command down}
  end tell
end tell

tell application "MacVim"
  activate
end tell
