; App F-Keys megascript
;
; Activates/deactivates/launches apps using F1-F6
; Functions borrowed largely from Ron Jouch: https://gist.github.com/ronjouch/2428558
;
; Variables definition
; -----------------------------------------------------------------------------
EnvGet, userProfile, USERPROFILE
Software := "C:\Program Files (x86)\"
DropboxWindows := userProfile . "\Dropbox\Windows\"

; -----------------------------------------------------------------------------
ToggleWinMinimize(WindowTitle)
{
	SetTitleMatchMode,2
	DetectHiddenWindows, Off
	IfWinActive, %WindowTitle%
	WinMinimize, %WindowTitle%
	Else
	IfWinExist, %WindowTitle%
	{
		WinActivate
	}
	Return
}

RunOrActivateOrMinimizeProgram(Program, WorkingDir="", WindowSize="")
{
	SplitPath Program, ExeFile
	Process, Exist, %ExeFile%
	PID = %ErrorLevel%
	if (PID = 0)
	{
		Run, %Program%, %WorkingDir%, %WindowSize%
	}
	else
	{
		SetTitleMatchMode,2
		DetectHiddenWindows, Off
		IfWinActive, ahk_pid %PID%
		WinMinimize, ahk_pid %PID%
		Else
		IfWinExist, ahk_pid %PID%
		WinActivate, ahk_pid %PID%
		Return
	}
}

; Remap F1-F6 to toggle apps I most care about
F1::RunOrActivateOrMinimizeProgram(Software . "Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe", UserProfile)
F2::RunOrActivateOrMinimizeProgram(Software . "Google\Chrome\Application\chrome.exe", UserProfile)
F3::RunOrActivateOrMinimizeProgram(DropboxWindows . "Console2\Console.exe", UserProfile)
F4::RunOrActivateOrMinimizeProgram(Software . "Zeal\zeal.exe", UserProfile)
F5::RunOrActivateOrMinimizeProgram(Software . "Clover\clover.exe", UserProfile)
F6::RunOrActivateOrMinimizeProgram(DropboxWindows . "Sublime Text Build 3083 x64\sublime_text.exe", UserProfile)


; Below this saved for later ;) 
; -----------------------------------------------------------------------------

; Hotstrings
; -----------------------------------------------------------------------------
;:R*:p@mail::my.personal@email.com
;:R*:.pweb::http://my.personal.website.com
;:R*:btw::by the way
;:R*:afaik::as far as I know

; Resize current window to standard sizes
; -----------------------------------------------------------------------------
MoveWindow(width, height)
{
	WinMove, A, , , , width, height
	ToolTip, %width%x%height%
	Sleep, 500
	ToolTip,
	Return
}

;<#1::MoveWindow(1619, 1049) ; that's not "standard", just my whole screen
;<#2::MoveWindow(1280, 800)
;<#3::MoveWindow(1024, 768)
;<#4::MoveWindow(800, 600)
