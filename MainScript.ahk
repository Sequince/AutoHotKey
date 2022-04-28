;Jacob Thomas
;Main script for AutoHotKey
;Created April 27, 2014, updated daily

#WinActivateForce
#NoEnv
#SingleInstance force
#MaxThreadsPerHotkey 2
DetectHiddenWindows, On
SetTitleMatchMode, 2
SendMode Input
TrayTip, AutoHotKey, Started, 1
CoordMode, Mouse, Screen
if not A_IsAdmin
{
	Run *RunAs %A_ScriptFullPath%
	exitApp
}

;Global Variable for multiple scripts
seqNumber = 0

;D2R - toggle right click variable
SeqRightClickValue = On

I_Icon = C:\Icons\Seq.ico
IfExist, %I_Icon%
  Menu, Tray, Icon, %I_Icon%

;Quick reference examples of methods to display GUI for debugging new scripts
;SeqGUIMain("Hello")
;SeqGUIMain2("Hello", 1638, 196)
;SeqGUIMain4("Hello", 800, 5, 0x800080)

;ValueSent(1000,250)

msgbox,,, Script stopped and restarted!, 3

IfWinNotExist, Noob.ahk
	;Run, C:\AutoHotKeyScripts\noob.ahk
	;Run, C:\AutoHotKeyScripts\SeqChannel.ahk
	;SetTimer, getSeq, 60000
Return




;Shuts off monitors, press 'Escape' to wake them up and break the loop
$!j::
Loop
{    If GetKeyState("Escape","P")
		;reload	- Seemed to duplicate AHK?  Maybe I messed up on my end.
        break
    else If(A_TimeIdlePhysical<1000)
        SendMessage,0x112,0xF170,2,,Program Manager
}
return


;Close 'download' popup at bottom of Chrome
#IF WinActive("ahk_exe chrome.exe")
~escape::
CoordMode, Mouse, Window
ImageSearch, foundx,foundy, 1705, 998, A_Screenwidth, A_Screenheight, *50 C:\AutoHotKeyScripts\Pictures\Chrome\IncognitoDownloadX.png
if ErrorLevel = 0
{
	MouseGetPos, xpos, ypos
	sleep 50
	mouseclick, left, foundx, foundy
	sleep 150
	mousemove, xpos, ypos
	return
}
ImageSearch, foundx,foundy, 1705, 998, A_Screenwidth, A_Screenheight, *50 C:\AutoHotKeyScripts\Pictures\Chrome\DownloadX.png
if ErrorLevel = 0
{
	MouseGetPos, xpos, ypos
	sleep 50
	mouseclick, left, foundx, foundy
	sleep 150
	mousemove, xpos, ypos
	return
}
return
#If



;Launch daily comics based off the day of the week
::SeqOpenComic::
FormatTime, FullDate,, dddd

If FullDate = Monday
{
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --new-window https://betweenfailures.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://www.penny-arcade.com/comic/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	http://www.darklegacycomics.com/newest
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://grrlpowercomic.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	http://modestmedusa.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://www.gunnerkrigg.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	http://dilbert.com//
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://www.lfg.co/latest-comic/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://unsoundedupdates.tumblr.com/
/*	
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://www.neopets.com/prehistoric/battleground/
*/
}

If FullDate = Tuesday
{
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --new-window https://navcomic.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://dilbert.com/
}

If FullDate = Wednesday
{
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --new-window https://betweenfailures.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://www.penny-arcade.com/comic/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	http://modestmedusa.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://www.gunnerkrigg.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://dilbert.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://unsoundedupdates.tumblr.com/
/*	
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://www.neopets.com/prehistoric/battleground/
*/
}

If FullDate = Thursday
{
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --new-window https://grrlpowercomic.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://dilbert.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://www.lfg.co/latest-comic/
}
If FullDate = Friday
{
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --new-window https://betweenfailures.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://www.penny-arcade.com/comic/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	http://modestmedusa.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://www.gunnerkrigg.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://dilbert.com/
	sleep 500
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" 	https://unsoundedupdates.tumblr.com/
}
return


;Automated backup script
::Seqbackup::
FormatTime, Date,, yyyy-MM-dd

FileCreateDir, C:\AutoHotKeyScripts\backups\%Date%

FileCopy, C:\AutoHotKeyScripts\*.*, C:\AutoHotKeyScripts\backups\%Date%\*.*
Msgbox, Backup Completed!
return



/*
;random alarm - Make this customized, pop-up: Sleep for how long?
j::
SoundPlay, C:\Users\Seq\Downloads\icq.mp3
sleep 50
SeqGUIMain("Starting")

;uncomment desired sleep time
sleep 3600000		; 1 hour
;sleep 2700000		; 45 mins
; sleep 1800000		; 30 mins
;sleep 1200000		; 20 mins
;sleep 5400000		; 1.5 hours

Send {volume_up}
loop 50
{
	SoundPlay, C:\Users\Seq\Downloads\icq.mp3
	Sleep 15000
}

Send {volume_up}
loop 50
{
	SoundPlay, C:\Users\Seq\Downloads\icq.mp3
	Sleep 10000
}

Send {volume_up}
loop 50
{
	SoundPlay, C:\Users\Seq\Downloads\icq.mp3
	Sleep 5000
}

Send {volume_up}
loop 50
{
	SoundPlay, C:\Users\Seq\Downloads\icq.mp3
	Sleep 1500
}
return
*/








/* - Test code, use later
j::
DetectHiddenWindows, On

PostMessage, 5000,,,TestReceiveMessage.ahk - AutoHotKey


Sleep 150
SeqGUIMain("Sent")
return
*/



/*
;Script that lets you call loop forever unless you push a button
j::
toggle := !toggle

Loop {
    if (toggle) {
        ;Do whatever until I push the button again.
		tooltip % a_index
        Sleep, 100
    } else {
        break
    }
}
return
*/

/*
j::
PostMessage, 0x10,0,0,, Untitled - Notepad

;SeqGUIMAIN("Activated")
;sleep 1000
;msgbox % ErrorLevel

return
*/






;Every 5 minutes, check if between 7~9pm, if it is, see if remote desktop is open
GetCompTime:
FormatTime, SeqHour,, HH

if ((SeqHour >= 19) AND (SeqHour <= 21))	;If hour between 7~9pm, make sure Remote Desktop is open
{
;IF FIGURE OUT NETWORK FILE, CHECK FILE FOR 'Ready'  with this:   FileReadLine, SeqReset, Z:\SeqShared\SeqDoneReset.txt, 1
	IfWinNotExist, Sequince-PC - Remote Desktop Connection
	{
		Sleep 120000
	
		Run, mstsc /console /v:Sequince-PC
	}
	IfWinExist, Sequince-PC - Remote Desktop Connection
	{
		return
	}
}
return





/*
j::

DIRECTORY := "\\SEQUINCE-PC\SeqShared"
sleep 150
FileReadLine, SeqReset, %DIRECTORY%/SeqDoneReset.txt, 1
sleep 150
Msgbox, %SeqReset%
return
*/



;If in image editor, turns on/off the grid
#IF WinActive("ahk_exe i_view64.exe")
^g::
	Send !e
	sleep 150
	Send {down 7}{enter}
return
#IF




/*
$j::
KeyWait, j, T0.5
If ErrorLevel
	msgbox, hi
Else
	Send {j}
return
*/





;Opens Hangouts in a new window
::openHangouts::
Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --new-window https://hangouts.google.com/
return




/*
NumpadDot::
	mouseclick, left
	sleep 50
	mouseclick, left,,,,,U
	sleep ValueSent(1250, 100)
	Send {Numpad0}
return
*/

/*
;Play / Pause / Stop buttons
f1::
loop 50
{
	SeqNumber++
	SeqGUIMain(seqNumber)
	Sleep 1000
}
return


j::
	GoSub ::SeqCreatePlayButton	
	GoSub ::SeqStopButton
	return


;Creates the Pause Button GUI
::SeqStopButton::
GUI, SeqStop:New
GUI, SeqStop:Margin , 0, 0
GUI, SeqStop:+AlwaysOnTop
GUI, SeqStop:+ToolWindow
GUI, SeqStop:Add, Picture,gSeqStopClick W48 H-1, C:\Icons\Stop.png
GUI, SeqStop:-Caption
GUI, SeqStop:show, NoActivate X1760 Y980 H48 W48
return

;Creates the Pause Button GUI
::SeqCreatePauseButton::
GUI, SeqPlay:destroy
GUI, SeqPause:New
GUI, SeqPause:Margin , 0, 0
GUI, SeqPause:+AlwaysOnTop
GUI, SeqPause:+ToolWindow
GUI, SeqPause:Add, Picture,gSeqPauseClick W48 H-1, C:\Icons\Pause.png
GUI, SeqPause:-Caption
GUI, SeqPause:show, NoActivate X1760 Y80 H48 W48
return

;Creates the Play Button GUI
::SeqCreatePlayButton::
GUI, SeqPause:destroy
GUI, SeqPlay:New
GUI, SeqPlay:New
GUI, SeqPlay:Margin , 0, 0
GUI, SeqPlay:+AlwaysOnTop
GUI, SeqPlay:+ToolWindow
GUI, SeqPlay:Add, Picture,gSeqPlayClick W48 H-1, C:\Icons\Play.png
GUI, SeqPlay:-Caption
GUI, SeqPlay:show, NoActivate X1760 Y80 H48 W48
return

;Pauses script
SeqPauseClick:
{
	GoSub ::SeqCreatePlayButton
	Pause
}
return

;Resumes script
SeqPlayClick:
{
	GoSub ::SeqCreatePauseButton
	Pause
}
return

;Closes script
SeqStopClick:
{
	msgbox, closing script
	;exitApp
}
return
*/



;GUI script that types out text when called.
SeqGUIGreen(SeqText)
{
GUI, SeqShowMainGreen:destroy
GUI, SeqShowMainGUIRed:destroy
GUI, SeqShowMainGreen: Color, Green
GUI, SeqShowMainGreen: Font, s16
GUI, SeqShowMainGreen:Font, cWhite
GUI, SeqShowMainGreen:+AlwaysOnTop
GUI, SeqShowMainGreen:-Caption ;Hide minimize or drag bar
GUI, SeqShowMainGreen:add, text,,%SeqText%
GUI, SeqShowMainGreen:+ToolWindow ;Hide from taskbar/alt tab
GUI, SeqShowMainGreen:show, NoActivate X1315 Y450 ;NoActivate means doesn't steal focus!
}

;GUI script that types out text when called.
SeqGUIRed(SeqText)
{
GUI, SeqShowMainGreen:destroy
GUI, SeqShowMainGUIRed:destroy
GUI, SeqShowMainGUIRed: Color, Red
GUI, SeqShowMainGUIRed: Font, s16
GUI, SeqShowMainGUIRed:Font, cWhite
GUI, SeqShowMainGUIRed:+AlwaysOnTop
GUI, SeqShowMainGUIRed:-Caption ;Hide minimize or drag bar
GUI, SeqShowMainGUIRed:add, text,,%SeqText%
GUI, SeqShowMainGUIRed:+ToolWindow ;Hide from taskbar/alt tab
GUI, SeqShowMainGUIRed:show, NoActivate X1315 Y450 ;NoActivate means doesn't steal focus!
}







/*
;Example of turnary loop
;IF A is less than B, return A, else return B
j::
seqA := 10, seqB := 20, seqC := ""

seqC := (seqA < seqB) ? seqA : seqB

msgbox % seqC
return
*/



;Media volume controls from keyboard shortcuts

+NumpadAdd::
	Send {volume_up}
return

+NumpadSub::
	Send {volume_down}
return

+NumpadDiv up::
	Send {Media_play_pause}
return

+NumpadMult up::
	Send {volume_mute}
return

 ;Modifies number sent
;Accepts 2 numbers, first num 60000 (1 min example) second num 5000 (0.5 seconds)
;Turns first number into 2 numbers, 55000 and 65000
;Random number picked between those two returned
;SeqValueSent()
ValueSent(SeqNumber,SeqModNumber)
{

	Ran1 := (SeqNumber+SeqModNumber)
	Ran2 := (SeqNumber-SeqModNumber)
	Random, RanNumb, Ran1, Ran2
	SeqNewNumber := (RanNumb)
	return SeqNewNumber
}
return













/*
;That's really cool...  Consistantly shows time in hover text.
j::
SetTimer, GetCompTime, 80

GetCompTime:
FormatTime, MyTime,, hh:mm:ss tt
ToolTip % MyTime
return
*/



;Scroll mouse up or down via keyboard instead of mouse
CapsLock & q::
Loop 10
{
MouseClick,WheelUp,,,10,0,D,R
Sleep 50
}
return

CapsLock & a::
Loop 10
{
MouseClick,WheelDown,,,10,0,D,R
Sleep 50
}
return

CapsLock & w::
Loop 3
{
MouseClick,WheelUp,,,2,0,D,R
Sleep 50
}
return

CapsLock & s::
Loop 3
{
MouseClick,WheelDown,,,2,0,D,R
Sleep 50
}
return




;Always turns off Capslock
~Capslock::
SetCapslockState, off
sleep 50
SetCapslockState, off
return







/*
;If in Notepad++, Escape moves the middle bar
#If WinActive("ahk_exe notepad++.exe")  ;If in Notepad++

Escape::
	
	
    ImageSearch, , , 0, 0, 1919, 1079, C:\AutoHotKeyScripts\Pictures\NotepadFind.png
    if (ErrorLevel) {
        ;Find middlebar and move it to the right side
        ImageSearch, foundx, foundy, 0, 0, 1919, 1079, C:\AutoHotKeyScripts\Pictures\NotepadMiddleBar.png
        if (ErrorLevel = 0) {
            MouseGetPos, xpos, ypos
            
            MouseClick, left, foundx - 3, foundy + 55, , , d
            Mousemove, foundx + 1000, foundy + 55
            Mouseclick, left, , , , , u
            
            mousemove, %xpos%, %ypos%
			return
        }

        ;find middlebar and move it to the middle
        ImageSearch, foundx, foundy, 0, 0, 2919, 2079, C:\AutoHotKeyScripts\Pictures\NotepadRightBar.png
        if (ErrorLevel = 0) {
            MouseGetPos, xpos, ypos
            
            MouseClick, left, foundx, foundy + 75, , , d
            Mousemove, foundx - 1000, foundy + 75
            Mouseclick, left, , , , , u
            
            mousemove, %xpos%, %ypos%
			return
        }
    }
    Else
        Send, {Escape}
        
    Return

#If
*/



;Send single click with keyboard key
^`::
Mouseclick, left
return



;Double Click via Keyboard key
`::
/*	;Old code, safe to delete
;If D2 Remastered open do nothing
#IfWinExist, ahk_class OsWindow
{
	Send {alt down}
	sleep 50
	Send {`}
	sleep 150
	;Send {alt up}
	return
}
*/

;If D2 open do nothing
IfWinExist, ahk_class Diablo II
{
	Send {`}	
	return
}
MouseClick, left
MouseClick, left
return


;Google searches via custom UI popup search boxes - quality of life
::SeqGoogleStuff::
InputBox, UserInput, What to find?, Google Search:, , 150, 150
SetCapslockState, off
SeqSearch = %UserInput%
StringReplace, SeqSearch, SeqSearch, %A_SPACE%, +, All

Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "https://www.google.com/search?q=%SeqSearch%"
;Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "https://www.google.ca/?gfe_rd=cr&ei=kPPXVcrfM-OM8QfK2Z_gAw&gws_rd=ssl#q=%SeqSearch%"
;Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "http://summonerswarskyarena.info/%SeqSearch%"
return

/*
F6::
InputBox, UserInput, What to find?, Pokemon Go Search:, , 150, 150
SetCapslockState, off
SeqSearch = %UserInput%
StringReplace, SeqSearch, SeqSearch, %A_SPACE%, -, All
Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "https://www.google.ca/?gfe_rd=cr&ei=kPPXVcrfM-OM8QfK2Z_gAw&gws_rd=ssl#q=%SeqSearch%+Pokemon Go"
;Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "http://summonerswarskyarena.info/%SeqSearch%"
return

F7::
SetCapslockState, off
InputBox, UserInput, What to find?, Overwatch Go Search:, , 150, 150
if ErrorLevel
{}
else
{
SeqSearch = %UserInput%
Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "https://www.google.ca/?gfe_rd=cr&ei=kPPXVcrfM-OM8QfK2Z_gAw&gws_rd=ssl#q=%SeqSearch%+Overwatch"
}
;StringReplace, SeqSearch, SeqSearch, %A_SPACE%, -, All
return
*/




;Shortcut to switch windows Desktops
^!F12::
Send {ctrl down}{LWin down}{right}{LWin up}{ctrl up}
return

^!F11::
Send {ctrl down}{LWin down}{left}{LWin up}{ctrl up}
return







~Capslock & F4::
SetCapslockState, off
return



/*
\::
;Creates the window - old project, may come back to someday?
GUI, J1:New

;Adds the picture, DropDownList and Close Button behind the scenes

GUI, J1:Add, DDL, x10 y30 vCategory gMyCategory, ||Games|Comic|Webpages

;Populates the DropDownLists and close button
GUI, J1:Add, DDL, x135 y30 vOption1 gMyCategory2,  ||Hearthstone|Pokemon|Ogre Battle|Neopets
GUI, J1:Add, DDL, x135 y30 vOption2 gMyCategory2,  ||Penny-Arcade|Ctrl+Alt+Delete|Least I can Do
GUI, J1:Add, DDL, x135 y30 vOption3 gMyCategory2,  ||Facebook|Google Drive|G-mail|Yahoo Mail

GUI, J1:Add, Button, x6 y50 vButtonClose gClose, &Close
;GUI, J1:Add, Button, x0 y0 vButtonClose gClose, &Close

Random, RanNumb, 1, 260
GUI, J1:Add, Picture, x10 y100 w500 h-1, C:\Screensaver\%RanNumb%.jpg

;Hides the second DropDownList
GUIControl, Hide, Option1
GUIControl, Hide, Option2
GUIControl, Hide, Option3

;Displays the window with all the controls
GUI, J1:show, X100 Y100, Select an option:
return



;Populates original DropDown and gives focus
MyCategory:
GUI, submit, NoHide
if category = Games
{
	ResetCategories()
	GUIControl, Show, Option1
	GUIControl, Focus, Option1
}
if category = Comic
{
	ResetCategories()
	GUIControl, Show, Option2
	GUIControl, Focus, Option2
}
if category = Webpages
{
	ResetCategories()
	GUIControl, Show, Option3
	GUIControl, Focus, Option3
}
if category = 
{
	ResetCategories()
}
return

;Sets the DropDownLists to be hidden so they don't overlap each other.  Also Sets the default selection to nothing.
ResetCategories()
{
GUIControl, Hide, Option1
GUIControl, Hide, Option2
GUIControl, Hide, Option3
GUIControl, Choose, Option1, 0
GUIControl, Choose, Option2, 0
GUIControl, Choose, Option3, 0
}
return


MyCategory2:
GUI, submit, NoHide
if Option1 = Hearthstone
{
	;GoSub ::SeqHearthstone - deleted this.
	;Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" http://www.icy-veins.com/hearthstone/arena-card-rankings-spreadsheets
	;GUI, J1:Add, DDL, x15 y237 vOption1 gMyCategory2, Card Rankings
}
if Option1 = Pokemon
{
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" http://pokemondb.net/pokedex/national
}
if Option1 = Ogre Battle
{
	GoSub ::SeqOB
;	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" http://www.geocities.ws/xesmeraude/promochart.html
}
if Option1 = Neopets
{
GoSub ::SeqNeopets
}
if Option2 = Penny-Arcade
{
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" www.penny-arcade.com/comic
}
if Option2 = Ctrl+Alt+Delete
{
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" www.cad-comic.com/cad/
}
if Option2 = Least I can Do
{
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" www.licd.com
}
if Option3 = Facebook
{
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" http://www.facebook.com
}
if Option3 = Google Drive
{
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://drive.google.com/
}
if Option3 = G-mail
{
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://www.gmail.com
}
if Option3 = Yahoo Mail
{
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://mail.yahoo.com
}
return
*/


;Calls the destroy window method
Close:
GUI, Destroy
return























/*
;Test GUI made for work, blockout time in taskbar
LWin & m::
FormatTime, CurrentDateTime,, MMMM dd, yyyy `n`n         h:mm
GUI, 1:Color, Red
GUI, 1:Font, s16
GUI, 1:Font, cWhite
GUI, 1:+AlwaysOnTop
GUI, 1:-Caption
GUI, 1:add, text,,%CurrentDateTime%
GUI, 1:show, X275 Y850 ;W600
sleep, 2000
GUI, 1:destroy
return
*/




;Pops up MY command window - Quality of life addition
Capslock & numpadsub::
SetCapslockState, off
InputBox, UserInput, Command, Please enter a command., , 150, 150
SetCapslockState, off
MyAnswer = %UserInput%
if MyAnswer = edit
{
    GoSub ::seqedit
return
}
if MyAnswer = Gdrive
{
    GoSub ::SeqGoogleDrive
return
}
if MyAnswer = visa
{
	GoSub ::SeqVisa
return
}
if MyAnswer = seq
{
	GoSub ::SeqText
return
}
if (MyAnswer = "movies") or (MyAnswer = "movie")
{
	GoSub ::SeqMovies
return
}
if MyAnswer = music
{
	GoSub ::SeqMusic
return
}
if MyAnswer = Google
{
    GoSub ::SeqGoogle
return
}
if MyAnswer = wowfolder
{
	GoSub ::Seqwowfolder
return
}
if MyAnswer = Emm
{
    GoSub ::SeqEmmText
return
}
if MyAnswer = td
{
    GoSub ::SeqTDBank
return
}
if (MyAnswer = "Neopets") or (MyAnswer = "Neo")
{
    GoSub ::SeqNeopets
return
}
if MyAnswer = Secret
{
    GoSub ::seqHearthstoneSecret
return
}
if MyAnswer = weekly
{
    GoSub ::seqweekly
return
}
if MyAnswer = list
{
	Run, C:\AutoHotKeyScripts\List.ahk
    GoSub Capslock & numpadsub
return
}
if MyAnswer = pets
{
    GoSub ::seqpets
return
}
if (MyAnswer = "face") or (MyAnswer = "facebook")
{
    GoSub ::seqFacebook
return
}
if MyAnswer = snes
{
	GoSub ::SeqSuperNintendo
return
}
if MyAnswer = bank
{
    GoSub ::seqGUIldbank
return
}
if MyAnswer = Test
{
	GoSub ::SeqTestScript
return
}
if (MyAnswer = "TestEdit") or (MyAnswer = "EditTest")
{
	GoSub ::SeqEditTest
return
}
if  MyAnswer = todo
{
	GoSub ::SeqToDoList
return
}
if (MyAnswer = "Backup") OR (MyAnswer = "Back")
{
	GoSub ::Seqbackup
return
}

if MyAnswer = Ws
{
	GoSub ::SeqWs
return
}

if (MyAnswer = "Move") OR (MyAnswer = "Send")
{
	GoSub ::SeqMove
return
}

if (MyAnswer = "Docs") OR (MyAnswer = "Documents") OR (MyAnswer = "Document")
{
	GoSub ::SeqDocs
return
}

if (MyAnswer = "Deleted") OR (MyAnswer = "Delete")
{
	GoSub ::SeqDeleted
return
}

if (MyAnswer = "Sticky") OR (MyAnswer = "Notes") OR (MyAnswer = "Note")
{
	GoSub ::SeqSticky
return
}


if MyAnswer = pn
{
	GoSub ::Seqpn
	return
}
if MyAnswer = OB
{
	GoSub ::SeqOB
	return
}

if MyAnswer = obmap
{
	GoSub ::Seqobmap
	return
}

if MyAnswer = spy
{
	Run, C:\Program Files\AutoHotkey\AU3_Spy.exe
	WinWait, Active Window Info (Shift-Alt-Tab to freeze display)
Sleep 150
IfWinExist,  
CoordMode, Mouse, Screen
Mousemove, 811, 311
Click, down left 
Mousemove, 1500, 311
Click, up left 
	return
}


if (MyAnswer = "Habitarium") OR (MyAnswer = "Hab")
{
	Run, C:\AutoHotKeyScripts\Habitarium.ahk
	return
}

if (MyAnswer = "NeoAdventure") OR (MyAnswer = "Adventure")
{
	Run, C:\AutoHotKeyScripts\NeoAdventure.ahk
	return
}

if (MyAnswer = "D2") OR (MyAnswer = "Diablo")
{
	Run, C:\AutoHotKeyScripts\Diablo2.ahk
	return
}

if (MyAnswer = "FF3")
{
	;Run, C:\AutoHotKeyScripts\FF3.ahk
	Run *RunAs "C:\AutoHotKeyScripts\FF3.ahk"
	return
}

if (MyAnswer = "eq") OR (MyAnswer = "EverQuest")
{
	GoSub ::Seqeq
	return
}

if (MyAnswer = "esearch") OR (MyAnswer = "eqsearch")
{
	GoSub ::SeqEQs
	SetCapslockState, off
	return
}

if (MyAnswer = "summoner") OR (MyAnswer = "sw")
{
	GoSub ::SeqSummonerWars
	return
}

if MyAnswer = timer
{
	GoSub ::SeqTimer
	return
}

if MyAnswer = timer2
{
	GoSub ::SeqTimer2
	return
}

if MyAnswer = noob
{
	GoSub ::SeqNoob
	return
}

if MyAnswer = excel
{
	GoSub ::SeqExcel
	return
}
if (MyAnswer = "google") OR (MyAnswer = "g")
{
	GoSub ::SeqGoogleStuff
	return
}

if (MyAnswer = "mouse") OR (MyAnswer = "mouseclick")
{
	;Gets location and returns a MouseClick code formatted
	InputBox, UserInput, Convert what to MouseClick, Convert what to MouseClick:, , 450, 200
	Clipboard := FillValueSent(UserInput)
	return
}
if (MyAnswer = "sneo") OR (MyAnswer = "startNeo")
{
	Sleep 3000
	;GoSub ::SeqStartNeo
	Run, C:\AutoHotKeyScripts\NeoGhouls.ahk
	return
}
if (MyAnswer = "Overwatch") OR (MyAnswer = "ow")
{
	Run, C:\AutoHotKeyScripts\Overwatch.ahk
	return
}
if MyAnswer = explorer
{
	;Terminate/Restart Explorer.exe
	Process,close,explorer.exe
	return
}
if MyAnswer = edge
{
	;Terminate Edge Browser
	Process,close,ApplicationFrameHost.exe
	return
}
if (MyAnswer = "landl") OR (MyAnswer = "l")
{
	;Call Legends and Letters script
	Run, C:\AutoHotKeyScripts\NeoLandL.ahk
	return
}
if (MyAnswer = "listen") OR (MyAnswer = "channel")
{
	;Call SeqChannel
	Run, C:\AutoHotKeyScripts\SeqChannel.ahk
	return
}
if MyAnswer = ff14
{
	;launch ff14
	msgbox, run ff14?
	GoSub, ::SeqLoadFF14
	return
}
if MyAnswer = h
{
	;launch Hangouts
	GoSub, ::openHangouts
	return
}
if (MyAnswer = "search") OR (MyAnswer = "files")
{
	;Launch 'Grep' file search engine..?
	Run, C:\Program Files (x86)\Grep\grepWin-2.0.4_portable.exe
	return
}
if (MyAnswer = "comic") OR (MyAnswer = "comics")
{
	;launch daily comics
	GoSub, ::SeqOpenComic
	return
}
if (MyAnswer = "cow")
{
	;Get Cow login
	clipboard = cow.moo.1991@gmail.com
	return
}
if (MyAnswer = "lockGUI")
{
	;generate lock GUI for phone
	GoSub, $!j
	return
}

else
MsgBox, "%UserInput%" isn't a valid command...
return
;;;Seq else




;Creates a Mouseclick with values sent in like this - 461, 578
FillValueSent(SeqVal)
{
	SeqFoundComma := InStr(SeqVal, ",")
	if SeqFoundComma = 5
	{
		SeqX := SubStr(SeqVal, 1 , 4)
		SeqY := SubStr(SeqVal, 6)
	}
	if SeqFoundComma = 4
	{
		SeqX := SubStr(SeqVal, 1 , 3)
		SeqY := SubStr(SeqVal, 6)
	}
	SeqReturnValue = MouseClick, Left, ValueSent(%SeqX%,0), ValueSent(%SeqY%,0)
	return SeqReturnValue
}
return






;Launch Excel
::SeqExcel::
Run, C:\AutoHotKeyScripts\Excel.ahk
return

;Calls to do list on alternate desktop.
::SeqToDoList::
Sleep 500
GoSub ^!F12
Sleep 500
Run, C:\Program Files (x86)\Microsoft Office\Office14\EXCEL.EXE "C:\AutoHotKeyScripts\To Do List.xlsx"
Sleep 1111
Send !c

FormatTime, OutputVarSeqDate,, dddd

If OutputVarSeqDate = Monday
{
Mouseclick, Left, 99, 1054
}
Else If OutputVarSeqDate = Tuesday
{
Mouseclick, Left, 160, 1056
}
Else If OutputVarSeqDate = Wednesday
{
Mouseclick, Left, 238, 1055
}
Else If OutputVarSeqDate = Thursday
{
Mouseclick, Left, 312, 1053
}
Else If OutputVarSeqDate = Friday
{
Mouseclick, Left, 379, 1054
}
Else If OutputVarSeqDate = Saturday
{
Mouseclick, Left, 438, 1055
}
Else If OutputVarSeqDate = Sunday
{
Mouseclick, Left, 506, 1056
}
else
{
Msgbox, Incorrect Date!
}

;Run, C:\Windows\Notepad.exe C:\AutoHotKeyScripts\ToDoList."
return


::SeqNoob::
Run, C:\AutoHotKeyScripts\Noob.ahk
return

::SeqTestScript::
Run, C:\AutoHotKeyScripts\Test.ahk
return

::SeqTimer::
Run, C:\AutoHotKeyScripts\Timer.ahk
return

::SeqTimer2::
Run, C:\AutoHotKeyScripts\Timer2.ahk
return

::SeqEditTest::
Run, C:\Windows\Notepad.exe C:\AutoHotKeyScripts\Test.ahk
return



/*
;If Left button is pressed, releases it
j::
If GetKeyState("LButton", "P")
		Click, Left, Down
return
*/

::Seqwowfolder::
Run, explorer.exe C:\WoW
return

::SeqMusic::
Run, explorer.exe C:\Music Vid
return

::SeqMovies::
Run, explorer.exe C:\Movies
Run, explorer.exe E:\Users\Customer\FrostWire\Torrent Data
return

::seqpets::
Run, "C:\Program Files (x86)\Microsoft Office\Office14\EXCEL.EXE" C:\WoW\Pets.xlsx
return

::seqweekly::
Run, "C:\Program Files (x86)\Microsoft Office\Office14\EXCEL.EXE" C:\WoW\Weekly.xlsx
return

::SeqSuperNintendo::
;Run, "E:\My Documents\Super Nintendo\snes9x.exe"
Run, "C:\SNES\Super Nintendo\snes9x.exe"
return

::SeqMove::
Run, C:\Windows\move
return

;Runs Neopets
::SeqNeopets::
;DetectHiddenWindows, On
;SetTitleMatchMode, 2
;IfWinNotExist, NeoPets.ahk
;	Run, C:\AutoHotKeyScripts\Neopets.ahk
Run, C:\AutoHotKeyScripts\NeopetsManual.ahk
;return
;IfWinExist, NeoPets.ahk
	;msgbox, Neopets already open
;return
return

;Toggles AutoHotKey on and off
!^s::Suspend
return

::SeqText::
Run, C:\Windows\Notepad.exe C:\Seq.txt
return

::SeqEmmText::
Run, C:\Windows\Notepad.exe C:\Users\SequinceJ\Desktop\Emm\Emm.txt
return

;Runs this in edit mode
::seqedit::
Run, "C:\Program Files (x86)\Notepad++\notepad++.exe" C:\AutoHotKeyScripts\AutoHotkey.ahk
return

::seqGUIldbank::
Run, C:\Windows\Notepad.exe C:\WoW\GUIld Bank.txt
return

::SeqTDBank::
Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://easyweb.td.com/waw/idp/login.htm
return

::seqFacebook::
Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://www.facebook.com
return

::seqHearthstoneSecret::
Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" http://hearthstone.gamepedia.com/Secret
return

::seqGoogle::
Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://www.Google.com
return

::seqFacebook::
Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://www.facebook.com
return

::SeqVisa::
;Do things here.
return

::SeqGoogleDrive::
Run, explorer.exe C:\Users\SequinceJ\Google Drive
return

::seqpicrename::
::insertnumberhere:
MyNumber = 6617
Send %MyNumber%{enter}
Loop 1401
{
	Sleep 300
	Send {Right}{F2}
	MyNumber := MyNumber+1
	Send %MyNumber%{enter}
}
return



;Reload script
$^Escape::
Reload
Return



::SeqWs::
InputBox, UserInput, Command, Search for what?., , 450, 250
MyAnswer = %UserInput%
If !MyAnswer
{
	return
}
Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "http://www.wowhead.com/search?q=%MyAnswer%"
return

::SeqSummonerWars::
Run, "C:\AutoHotKeyScripts\SummonersWar.ahk"
return

^!+s::
Run, C:\
return

::SeqEQs::
InputBox, UserInput, Command, Search for what?., , 450, 250
Winset, Alwaysontop, , A
MyAnswer = %UserInput%
If !MyAnswer
{
	return
}
Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "http://everquest.allakhazam.com/search.html?q=%MyAnswer%"
return

::SeqDocs::
Run, E:\My Documents
return

::SeqDeleted::
Run, C:\DeletePics
return

::SeqSticky::
Run, StikyNot.exe
return


::Seqpn::
Run, "C:\note.txt"
return

::SeqOB::
	msgbox, Old Ogre Battle script
return





;GUI script that types out text when called.
SeqGUIMain(SeqText)
{
GUI, SeqShowMainGUI:destroy
GUI, SeqShowMainGUI: Color, Red
GUI, SeqShowMainGUI: Font, s16
GUI, SeqShowMainGUI:Font, cWhite
GUI, SeqShowMainGUI:+AlwaysOnTop
GUI, SeqShowMainGUI:-Caption ;Hide minimize or drag bar
GUI, SeqShowMainGUI:add, text,,%SeqText%
GUI, SeqShowMainGUI:+ToolWindow ;Hide from taskbar/alt tab
GUI, SeqShowMainGUI:show, NoActivate X1315 Y450 ;NoActivate means doesn't steal focus!
}

;GUI script that types out text when called.
SeqGUIMain2(SeqText, SeqX, SeqY)
{
GUI, SeqShowMainGUI2:destroy
GUI, SeqShowMainGUI2: Color, Red
GUI, SeqShowMainGUI2: Font, s16
GUI, SeqShowMainGUI2:Font, cWhite
GUI, SeqShowMainGUI2:+AlwaysOnTop
GUI, SeqShowMainGUI2:-Caption ;Hide minimize or drag bar
GUI, SeqShowMainGUI2:add, text,,%SeqText%
GUI, SeqShowMainGUI2:+ToolWindow ;Hide from taskbar/alt tab
GUI, SeqShowMainGUI2:show, NoActivate X%SeqX% Y%SeqY% ;NoActivate means doesn't steal focus!
}

;GUI script that types out text when called.
SeqGUIMain3(SeqText, SeqX, SeqY)
{
GUI, SeqShowMainGUI3:destroy
GUI, SeqShowMainGUI3: Color, Red
GUI, SeqShowMainGUI3: Font, s16
GUI, SeqShowMainGUI3:Font, cWhite
GUI, SeqShowMainGUI3:+AlwaysOnTop
GUI, SeqShowMainGUI3:-Caption ;Hide minimize or drag bar
GUI, SeqShowMainGUI3:add, text,,%SeqText%
GUI, SeqShowMainGUI3:+ToolWindow ;Hide from taskbar/alt tab
GUI, SeqShowMainGUI3:show, NoActivate X%SeqX% Y%SeqY% ;NoActivate means doesn't steal focus!
}

;GUI script that types out text when called.
SeqGUIMain4(SeqText, SeqX, SeqY, seqColour)
{
GUI, SeqShowMainGUI4:destroy
GUI, SeqShowMainGUI4: Color, %seqColour%
GUI, SeqShowMainGUI4: Font, s16
GUI, SeqShowMainGUI4:Font, cWhite
GUI, SeqShowMainGUI4:+AlwaysOnTop
GUI, SeqShowMainGUI4:-Caption ;Hide minimize or drag bar
GUI, SeqShowMainGUI4:add, text,,%SeqText%
GUI, SeqShowMainGUI4:+ToolWindow ;Hide from taskbar/alt tab
GUI, SeqShowMainGUI4:show, NoActivate X%SeqX% Y%SeqY% ;NoActivate means doesn't steal focus!
}


/*
;Get the colour under the cursor.
Pause::
CoordMode, Mouse, Screen
MouseGetPos, xpos, ypos 

PixelGetColor, OutputVar, %xpos%, %ypos%, RGB
msgbox, Colour is %OutputVar%
Clipboard = %OutputVar%
return
*/





;AlwaysOnTop
;Capslock & NumpadMult::  Winset, Alwaysontop, , A
^NumpadMult::  Winset, Alwaysontop, , A
return

::Seqobmap::
Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" http://ogrebattlesaga.wikia.com/wiki/Sharom_District
return

::Seqeq::
Run *RunAs "C:\AutoHotKeyScripts\EverQuest.ahk"
return