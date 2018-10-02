#!/usr/bin/env osascript

if application "Terminal" is running then
  tell application "Terminal"
    do script ""
    activate
  end tell
else
  do shell script "open -na /Applications/Utilities/Terminal.app"
end if

