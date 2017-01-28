#InstallKeybdHook

^!Left::
    Keywait, RWin
    Keywait, LWin
    Send {LWin Up}
    Send, {RWin Down}{Left}{RWin Up}
Return

^!Right::
    Keywait, RWin
    Keywait, LWin
    Send {LWin Up}
    Send, {RWin Down}{Right}{RWin Up}
Return