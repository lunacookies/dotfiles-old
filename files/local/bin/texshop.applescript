#!/usr/bin/env osascript

on run argv
  tell application "TeXShop"
    activate
    set theFile to item 1 of argv
    set theDoc to open ((POSIX file theFile) as alias)
    try
      tell theDoc to latexinteractive
    on error
      set theDoc to front document
      tell theDoc to latexinteractive
    end try
  end tell
end run
