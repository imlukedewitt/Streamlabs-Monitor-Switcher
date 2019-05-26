; Streamlabs Multi Monitor Switcher
; Code: Luke DeWitt - https://github.com/imlukedewitt
;
; AutoHotKey script to switch displays in Streamlabs based on mouse position
; Script is heavily commented so it will (hopefully) be easy to customize


CoordMode, Mouse, Screen                                           ;;; setup screen coordinate checking
global PreviousMonitor = 1                                         ;;; setup memory vars to keep track of changes
global PreviousFocus = 1
global MidPoint = 2100                                             ;;; use variable for midpoint to allow some overlap on the edge of the screen
SetTimer, CheckForChanges, 100                                     ;;; run "CheckForChanges" every 100ms
return

CheckForChanges:
MouseGetPos, xx, yy                                                ;;; assign Mouse coordinates to 'xx' and 'yy'

if(WinActive("ahk_class Notepad2"))                                ;;; get current states
    currentFocus := 1
else
    currentFocus := 0
if(xx <  MidPoint)
    currentMonitor := 1
else
    currentMonitor := 2

if (currentFocus = 1 and currentMonitor != PreviousMonitor)        ;;; check for changes from previous tick
{
    if (currentMonitor = 1)                                        ;;; Cubase is focused, change scenes based on mouse position
    {
        Send !+^{F1 down}{F1 up}
        MidPoint := 2100
    }
    if (currentMonitor = 2)
    {
        Send !+^{F2 down}{F2 up}
        MidPoint := 1700
    }
}
if (currentFocus = 0 and PreviousFocus != currentFocus)
{
    Send !+^{F3 down}{F3 up}                                       ;;; Cubase not in focus, change to static scene
}
PreviousMonitor := currentMonitor
PreviousFocus := currentFocus
return

Esc::ExitApp