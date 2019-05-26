; Streamlabs Multi Monitor Switcher
; Code: Luke DeWitt - https://github.com/imlukedewitt
;
; AutoHotKey script to switch displays in Streamlabs based on mouse position

CoordMode, Mouse, Screen
;;; setup memory vars to keep track of changes
global PreviousMonitor = 1
global PreviousFocus = 1
;;; use variable for midpoint to allow some overlap on the edge of the screen
global MidPoint = 2100
;;; run "CheckForChanges" every 100ms
SetTimer, CheckForChanges, 100
return

CheckForChanges:
;;; assign Mouse coordinates to 'xx' and 'yy'
MouseGetPos, xx, yy

;;; get current states
if(WinActive("ahk_class Notepad2"))
    currentFocus := 1
else
    currentFocus := 0
if(xx <  MidPoint)
    currentMonitor := 1
else
    currentMonitor := 2

;;; check for changes from previous check
if (currentFocus = 1 and currentMonitor != PreviousMonitor)
{
    ;;; Cubase is focused, change scenes based on mouse position
    if (currentMonitor = 1)
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
    ;;; Cubase not in focus, change to static scene
    Send !+^{F3 down}{F3 up}
}
PreviousMonitor := currentMonitor
PreviousFocus := currentFocus
return

Esc::ExitApp