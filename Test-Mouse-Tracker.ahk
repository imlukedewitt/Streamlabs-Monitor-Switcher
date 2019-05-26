CoordMode, Mouse, Screen
global PreviousMonitor = 1
global MidPoint = 2100
SetTimer, CheckForChanges, 100
return

CheckMon()
{
    MouseGetPos, xx, yy
    if(WinActive("ahk_class Notepad2"))
        return 3
    if(xx <  MidPoint)
        return 1
    else
        return 2
}


CheckForChanges:
CurrentMon := CheckMon()
; MsgBox, Saved monitor: %PreviousMonitor% `nCurrent mouse monitor: %CurrentMon% 
if(CurrentMon != PreviousMonitor)
{
    ; MsgBox, Change detected
    if(CurrentMon = 1)
    {
        Send !+^{F1 down}{F1 up}
        ; MsgBox, 1
        MidPoint := 1700
        PreviousMonitor := 1
    }
    if(CurrentMon = 2)
    {
        Send !+^{F2 down}{F2 up}
        ; MsgBox, 2
        MidPoint := 2100
        PreviousMonitor := 2
    }
    if(CurrentMon = 3)
    {
        MsgBox, notepad
        Send !+^{F3 down}{F3 up}
        PreviousMonitor := 3
    }
}
return


Esc::ExitApp