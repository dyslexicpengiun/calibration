#SingleInstance, Force
#InstallKeybdHook
#UseHook On
#InstallMouseHook
#NoEnv
#KeyHistory 0
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
PID := DllCall("GetCurrentProcessId")
Process, Priority, %PID%, Realtime
ListLines, Off
SetBatchLines, -1
SetWinDelay, -1
SetControlDelay, -1
SetDefaultMouseSpeed, 0
SetFormat, Float, 0.1
SetKeyDelay, -1, -1  ; No delay between key strokes
SendMode Input       ; Use the fastest injection method

 
 
; UI
Gui, Show, w550 h370, fhpingu
Gui, Font, cblack
Gui, Color, ff5a77
 
; Characters
Gui, Add, GroupBox, cWhite x10 y10 w180 h145, Characters
Gui, Add, CheckBox, x20 y30 w100 h20 vWarden, Warden
Gui, Add, CheckBox, x20 y50 w100 h20 vBlackprior, Blackprior
Gui, Add, CheckBox, x20 y70 w80 h20 vActive18, Sharman
Gui, Add, CheckBox, x20 y90 w80 h20 vActive19, Orochi
Gui, Add, CheckBox, x20 y110 w80 h20 vActive13, Roll
Gui, Add, CheckBox, x20 y130 w100 h20 vAll_Others, All Others
 
; Auto features
Gui, Add, GroupBox, cWhite x10 y155 w180 h65, Auto features for 1x1/2x2/4x4/
Gui, Add, CheckBox, x20 y175 w160 h20 vActive1, Dodge Bashes/Unblockables
Gui, Add, CheckBox, x20 y195 w80 h20 vActive2, Auto Block
 
; For Button - [F]
Gui, Add, GroupBox, cWhite x10 y220 w180 h145, For Button - [F]
Gui, Add, CheckBox, x20 y240 w80 h20 vActive3, Auto Parry
Gui, Add, CheckBox, x20 y260 w80 h20 vActive4, Auto Flip
Gui, Add, CheckBox, x20 y280 w80 h20 vActive14, War/Musha
Gui, Add, CheckBox, x20 y300 w80 h20 vActive16, Sharman
Gui, Add, CheckBox, x20 y320 w80 h20 vActive17, Orochi
Gui, Add, CheckBox, x20 y340 w80 h20 vActive21, JJ/Nobu
 
; For Button - [E]
Gui, Add, GroupBox, cWhite x200 y250 w170 h85, For Button - [E]
Gui, Add, CheckBox, x210 y270 w80 h20 vActive9, Auto Parry
Gui, Add, CheckBox, x210 y290 w80 h20 vActive11, Auto CC
Gui, Add, CheckBox, x210 y310 w80 h20 vActive12, Auto Deflect
 
; Resolution (ingame)
Gui, Add, GroupBox, cWhite x200 y10 w170 h55, Resolution (ingame)
Gui, Add, Text, x205 y34 w35 h20, X:
Gui, Add, Edit, c390202 x220 y32 w45 h20 Center vres1, 0
Gui, Add, Text, x272 y34 w35 h20, Y:
Gui, Add, Edit, c390202 x287 y32 w45 h20 Center vres2, 0
Gui, Add, Button, x339 y34 w20 h16 gButtonOK, ok
 
; Delays
Gui, Add, GroupBox, cWhite x200 y65 w170 h185, Delays
Gui, Add, Text, x210 y85 w120 h20, Dodge Delay in ms:
Gui, Add, Edit, c390202 x310 y85 w27 h17 vPause, 0
Gui, Add, Text, x210 y105 w120 h20, Feints Check Delay:
Gui, Add, Edit, c390202 x310 y105 w27 h17 vPause1, 0
Gui, Add, Text, x210 y125 w120 h20, Block Delay in ms:
Gui, Add, Edit, c390202 x310 y125 w27 h17 vPause3, 0
Gui, Add, CheckBox, x210 y145 w155 h20 vActive5, RMouse Button after dodge
Gui, Add, CheckBox, x210 y165 w155 h20 vActive6, LMouse Button after dodge
Gui, Add, Text, x210 y185 w130 h20, L/RMouse Delay in ms:
Gui, Add, Edit, c390202 x325 y185 w27 h17 vPause2, 0
Gui, Add, Edit, c390202 x345 y205 w20 h17 vLeft, 0
Gui, Add, Edit, c390202 x345 y225 w20 h17 vRight, 0
Gui, Add, Text, x210 y205 w128 h20, Delay on left deflect in ms:
Gui, Add, Text, x210 y225 w130 h20, Delay on right deflect in ms
 
; Hotkeys
Gui, Add, GroupBox, cWhite x380 y10 w160 h135, Hotkeys
Gui, Add, Text, x390 y25 w150 h20, [Dodges On/Off]  - F2
Gui, Add, Text, x390 y45 w150 h20, [Parry Orange Off/On]  -  F5
Gui, Add, Text, x390 y65 w150 h20, [Pause/Resume]  -  Z
Gui, Add, Text, x390 y85 w150 h20, [Parry/Button 1]  -  C
Gui, Add, Text, x390 y105 w150 h20, [Parry/Button 2]  -  E
Gui, Add, Text, x390 y125 w150 h60, [Flip/Button]  -  W
 
; Help and Settings
Gui, Add, GroupBox, cWhite x380 y145 w160 h112, Help and Settings
Gui, Add, Button, x390 y163 w140 h19 gButtonH1, How to use
Gui, Add, Button, x390 y185 w140 h19 gButtonH2, Load Settings
Gui, Add, Button, x390 y207 w140 h19 gButtonH3, Save Settings
Gui, Add, Button, x390 y229 w140 h19 gButtonH4, Apply Settings
 
; Controls
Gui, Add, GroupBox, cWhite x380 y260 w160 h80, Controls
Gui, Add, Button, x390 y283 w140 h20 gButtonH7, Reload
Gui, Add, Button, x390 y306 w140 h20 gButtonH5, Start
 
; Credits
Gui, Add, GroupBox, cWhite x200 y335 w340 h30, Credits
Gui, Add, Text, cBlack x205 y350 w340 h50, "Rules exist to be understood, not obeyed" Lao Tzu | PINGU 
 
SetWorkingDir %A_ScriptDir%
return
 
; Button Handlers
ButtonH5:
    SoundBeep
    GuiControlGet, Warden
    GuiControlGet, Blackprior
    GuiControlGet, All_Others
    GuiControlGet, Active1
    GuiControlGet, Active2
    GuiControlGet, Active3
    GuiControlGet, Active4
    GuiControlGet, Active5
    GuiControlGet, Active6
    GuiControlGet, Active7
    GuiControlGet, Active9
    GuiControlGet, Active11
    GuiControlGet, Active12
    GuiControlGet, Active13
    GuiControlGet, Active14
    GuiControlGet, Active16
    GuiControlGet, Active17
    GuiControlGet, Active18
    GuiControlGet, Active19
    GuiControlGet, Active20
    GuiControlGet, Active21
    GuiControlGet, Active22
    GuiControlGet, Active23
    GuiControlGet, Pause
    GuiControlGet, Pause1
    GuiControlGet, Pause2
    GuiControlGet, Pause3
    GuiControlGet, Left
    GuiControlGet, Right
    GuiControlGet, res1
    GuiControlGet, res2
    x8 := (res1 / 1920) * 860
    y8 := (res2 / 1080) * 80
    x9 := (res1 / 1920) * 1075
    y9 := (res2 / 1080) * 425
    x18 := (res1 / 1920) * 670
    y18 := (res2 / 1080) * 300
    x19 := (res1 / 1920) * 820
    y19 := (res2 / 1080) * 510
    B55 := res1 / 1920
    Y55 := res2 / 1080
    GoSub Start
return
 
ButtonH7:
    Reload
return

ButtonH1:
MsgBox, 64, How to Use, 
(
1. Set your in-game Resolution (X and Y).
2. Press 'Apply Settings' or 'Start'.
3. Use Hotkeys: 
   F2 - Toggle Dodges
   F5 - Toggle Parry
   Z  - Pause/Resume
)
return
 
ButtonH2:
    IniRead, Left, %A_WorkingDir%\Config.ini, Options, Left
    GuiControl,, Left, %Left%
    IniRead, Right, %A_WorkingDir%\Config.ini, Options, Right
    GuiControl,, Right, %Right%
    IniRead, Pause, %A_WorkingDir%\Config.ini, Options, Pause
    GuiControl,, Pause, %Pause%
    IniRead, Pause1, %A_WorkingDir%\Config.ini, Options, Pause1
    GuiControl,, Pause1, %Pause1%
    IniRead, Pause2, %A_WorkingDir%\Config.ini, Options, Pause2
    GuiControl,, Pause2, %Pause2%
    IniRead, Pause3, %A_WorkingDir%\Config.ini, Options, Pause3
    GuiControl,, Pause3, %Pause3%
    IniRead, res1, %A_WorkingDir%\Config.ini, Options, res1
    GuiControl,, res1, %res1%
    IniRead, res2, %A_WorkingDir%\Config.ini, Options, res2
    GuiControl,, res2, %res2%
    IniRead, Active1, %A_WorkingDir%\Config.ini, Options, Active1
    GuiControl,, Active1, %Active1%
    IniRead, Active2, %A_WorkingDir%\Config.ini, Options, Active2
    GuiControl,, Active2, %Active2%
    IniRead, Active3, %A_WorkingDir%\Config.ini, Options, Active3
    GuiControl,, Active3, %Active3%
    IniRead, Active4, %A_WorkingDir%\Config.ini, Options, Active4
    GuiControl,, Active4, %Active4%
    IniRead, Active5, %A_WorkingDir%\Config.ini, Options, Active5
    GuiControl,, Active5, %Active5%
    IniRead, Active6, %A_WorkingDir%\Config.ini, Options, Active6
    GuiControl,, Active6, %Active6%
    IniRead, Active7, %A_WorkingDir%\Config.ini, Options, Active7
    GuiControl,, Active7, %Active7%
    IniRead, Active9, %A_WorkingDir%\Config.ini, Options, Active9
    GuiControl,, Active9, %Active9%
    IniRead, Active11, %A_WorkingDir%\Config.ini, Options, Active11
    GuiControl,, Active11, %Active11%
    IniRead, Active12, %A_WorkingDir%\Config.ini, Options, Active12
    GuiControl,, Active12, %Active12%
    IniRead, Active13, %A_WorkingDir%\Config.ini, Options, Active13
    GuiControl,, Active13, %Active13%
    IniRead, Active14, %A_WorkingDir%\Config.ini, Options, Active14
    GuiControl,, Active14, %Active14%
    IniRead, Active16, %A_WorkingDir%\Config.ini, Options, Active16
    GuiControl,, Active16, %Active16%
    IniRead, Active17, %A_WorkingDir%\Config.ini, Options, Active17
    GuiControl,, Active17, %Active17%
    IniRead, Active18, %A_WorkingDir%\Config.ini, Options, Active18
    GuiControl,, Active18, %Active18%
    IniRead, Active19, %A_WorkingDir%\Config.ini, Options, Active19
    GuiControl,, Active19, %Active19%
    IniRead, Active20, %A_WorkingDir%\Config.ini, Options, Active20
    GuiControl,, Active20, %Active20%
    IniRead, Active21, %A_WorkingDir%\Config.ini, Options, Active21
    GuiControl,, Active21, %Active21%
    IniRead, Active22, %A_WorkingDir%\Config.ini, Options, Active22
    GuiControl,, Active22, %Active22%
    IniRead, Active23, %A_WorkingDir%\Config.ini, Options, Active23
    GuiControl,, Active23, %Active23%
    IniRead, Warden, %A_WorkingDir%\Config.ini, Options, Warden
    GuiControl,, Warden, %Warden%
    IniRead, Blackprior, %A_WorkingDir%\Config.ini, Options, Blackprior
    GuiControl,, Blackprior, %Blackprior%
    IniRead, All_Others, %A_WorkingDir%\Config.ini, Options, All_Others
    GuiControl,, All_Others, %All_Others%
    MsgBox, 0, Successfully, Settings successfully loaded!
return
 
ButtonH3:
    IniWrite, %Left%, %A_WorkingDir%\Config.ini, Options, Left
    IniWrite, %Right%, %A_WorkingDir%\Config.ini, Options, Right
    IniWrite, %Pause%, %A_WorkingDir%\Config.ini, Options, Pause
    IniWrite, %Pause1%, %A_WorkingDir%\Config.ini, Options, Pause1
    IniWrite, %Pause2%, %A_WorkingDir%\Config.ini, Options, Pause2
    IniWrite, %Pause3%, %A_WorkingDir%\Config.ini, Options, Pause3
    IniWrite, %res1%, %A_WorkingDir%\Config.ini, Options, res1
    IniWrite, %res2%, %A_WorkingDir%\Config.ini, Options, res2
    IniWrite, %Active1%, %A_WorkingDir%\Config.ini, Options, Active1
    IniWrite, %Active2%, %A_WorkingDir%\Config.ini, Options, Active2
    IniWrite, %Active3%, %A_WorkingDir%\Config.ini, Options, Active3
    IniWrite, %Active4%, %A_WorkingDir%\Config.ini, Options, Active4
    IniWrite, %Active5%, %A_WorkingDir%\Config.ini, Options, Active5
    IniWrite, %Active6%, %A_WorkingDir%\Config.ini, Options, Active6
    IniWrite, %Active7%, %A_WorkingDir%\Config.ini, Options, Active7
    IniWrite, %Active9%, %A_WorkingDir%\Config.ini, Options, Active9
    IniWrite, %Active11%, %A_WorkingDir%\Config.ini, Options, Active11
    IniWrite, %Active12%, %A_WorkingDir%\Config.ini, Options, Active12
    IniWrite, %Active13%, %A_WorkingDir%\Config.ini, Options, Active13
    IniWrite, %Active14%, %A_WorkingDir%\Config.ini, Options, Active14
    IniWrite, %Active16%, %A_WorkingDir%\Config.ini, Options, Active16
    IniWrite, %Active17%, %A_WorkingDir%\Config.ini, Options, Active17
    IniWrite, %Active18%, %A_WorkingDir%\Config.ini, Options, Active18
    IniWrite, %Active19%, %A_WorkingDir%\Config.ini, Options, Active19
    IniWrite, %Active20%, %A_WorkingDir%\Config.ini, Options, Active20
    IniWrite, %Active21%, %A_WorkingDir%\Config.ini, Options, Active21
    IniWrite, %Active22%, %A_WorkingDir%\Config.ini, Options, Active22
    IniWrite, %Active23%, %A_WorkingDir%\Config.ini, Options, Active23
    IniWrite, %Warden%, %A_WorkingDir%\Config.ini, Options, Warden
    IniWrite, %Blackprior%, %A_WorkingDir%\Config.ini, Options, Blackprior
    IniWrite, %All_Others%, %A_WorkingDir%\Config.ini, Options, All_Others
    MsgBox, 0, Successfully, Settings successfully saved!
return
 
ButtonH4:
    GuiControlGet, Warden
    GuiControlGet, Blackprior
    GuiControlGet, All_Others
    GuiControlGet, Active1
    GuiControlGet, Active2
    GuiControlGet, Active3
    GuiControlGet, Active4
    GuiControlGet, Active5
    GuiControlGet, Active6
    GuiControlGet, Active7
    GuiControlGet, Active8
    GuiControlGet, Active9
    GuiControlGet, Active10
    GuiControlGet, Active11
    GuiControlGet, Active12
    GuiControlGet, Active13
    GuiControlGet, Active14
    GuiControlGet, Active16
    GuiControlGet, Active17
    GuiControlGet, Active18
    GuiControlGet, Active19
    GuiControlGet, Active20
    GuiControlGet, Active21
    GuiControlGet, Active22
    GuiControlGet, Active23
    GuiControlGet, Pause
    GuiControlGet, Pause1
    GuiControlGet, Pause2
    GuiControlGet, Pause3
    GuiControlGet, res1
    GuiControlGet, res2
    GuiControlGet, Left
    GuiControlGet, Right
    MsgBox, 0, Successfully, Settings successfully updated!
return
 
ButtonOK:
    GuiControlGet, res1
    GuiControlGet, res2
    x8 := (res1 / 1920) * 860
    y8 := (res2 / 1080) * 80
    x9 := (res1 / 1920) * 1075
    y9 := (res2 / 1080) * 425
    x18 := (res1 / 1920) * 670
    y18 := (res2 / 1080) * 300
    x19 := (res1 / 1920) * 820
    y19 := (res2 / 1080) * 510
    if (res1 = 0 || res2 = 0) {
        MsgBox, Resolution cant be %res1% x %res2%
        Reload
    }
    if (res1 < res2) {
        MsgBox, Resolution cant be %res1% x %res2%
        Reload
    }
    if (res1 > res2) {
        MsgBox, Resolution updated, new resolution %res1% x %res2%
    }
return
 
GuiClose:
    ExitApp
return
 
Start:
    Loop {
        GoSub Calculate
        GoSub SearchBot
        GoSub AutoBlock
    }
return
 
Calculate:
    PixelSearch, Bx, By, x18, y18, x19, y19, 0x058341, 0, Fast|RGB
    if (ErrorLevel = 0)
        box := 1
    if (ErrorLevel = 1)
        box := 2
    PixelSearch, Ax, Ay, x8, y8, x9, y9, 0x058341, 0, Fast|RGB
    if (ErrorLevel = 0 && box = 2) {
        x2 := Ax - 200 * B55
        y2 := Ay + 20 * Y55
        x3 := Ax + 160 * B55
        y3 := Ay + 170 * Y55
        x4 := Ax + 5 * B55
        y4 := Ay + 195 * Y55
        x5 := Ax + 160 * B55
        y5 := Ay + 430 * Y55
        x6 := Ax - 200 * B55
        y6 := Ay + 195 * Y55
        x7 := Ax - 30 * B55
        y7 := Ay + 430 * Y55
        x16 := Ax - 200 * B55
        y16 := Ay + 20 * Y55
        x17 := Ax + 160 * B55
        y17 := Ay + 430 * Y55
    }
    if (ErrorLevel = 0 && box = 1) {
        x2 := Ax - 100 * B55
        y2 := Ay + 10 * B55
        x3 := Ax + 80 * Y55
        y3 := Ay + 85 * Y55
        x4 := Ax + 2.5 * B55
        y4 := Ay + 97.5 * Y55
        x5 := Ax + 80 * B55
        y5 := Ay + 227.7 * Y55
        x6 := Ax - 100 * B55
        y6 := Ay + 97.5 * Y55
        x7 := Ax - 15 * B55
        y7 := Ay + 227.7 * Y55
        x16 := Ax - 117.6 * B55
        y16 := Ay + 10 * Y55
        x17 := Ax + 94.11 * B55
        y17 := Ay + 227.7 * Y55
    }
    if (ErrorLevel = 1) {
        PixelSearch, Ax, Ay, x8, y8, x9, y9, 0xFFFF0A, 0, Fast|RGB
        if (ErrorLevel = 0 && box = 2) {
            x2 := Ax - 175 * B55
            y2 := Ay + 65 * Y55
            x3 := Ax + 185 * B55
            y3 := Ay + 185 * Y55
            x4 := Ax + 30 * B55
            y4 := Ay + 215 * Y55
            x5 := Ax + 185 * B55
            y5 := Ay + 430 * Y55
            x6 := Ax - 175 * B55
            y6 := Ay + 215 * Y55
            x7 := Ax - 5 * B55
            y7 := Ay + 430 * Y55
            x16 := Ax - 175 * B55
            y16 := Ay + 65 * Y55
            x17 := Ax + 185 * B55
            y17 := Ay + 430 * Y55
        }
        if (ErrorLevel = 0 && box = 1) {
            x2 := Ax - 87.5 * B55
            y2 := Ay + 35 * B55
            x3 := Ax + 92.5 * Y55
            y3 := Ay + 92.5 * Y55
            x4 := Ax + 15 * B55
            y4 := Ay + 107.5 * Y55
            x5 := Ax + 92.5 * B55
            y5 := Ay + 215 * Y55
            x6 := Ax - 87.5 * B55
            y6 := Ay + 107.5 * Y55
            x7 := Ax - 2.5 * B55
            y7 := Ay + 215 * Y55
            x16 := Ax - 87.5 * B55
            y16 := Ay + 35 * Y55
            x17 := Ax + 92.5 * B55
            y17 := Ay + 215 * Y55
        }
    }
return
 
SearchBot:
    PixelSearch, vx, vy, x16, y16, x17, y17, 0xF66208, 0, Fast|RGB
    if (ErrorLevel = 0) {
        PixelSearch, px, py, x16, y16, x17, y17, 0xFF221C, 3, Fast|RGB
        if (ErrorLevel = 0) {
            ubp := 1
            SetTimer, Release, -1000
            GoSub ubparry
            return
        }
        if (ErrorLevel = 1 && Blackprior = 1) {
            GoSub Dodge1
        }
        if (ErrorLevel = 1 && Blackprior = 0) {
            GoSub Dodge2
        }
    }
return
 

AutoBlock:
; --- SECTION 1: ATTACK DETECTION (Existing) ---
PixelSearch, zx, zy, x16, y16, x17, y17, 0xFF3129, 20, Fast RGB
if (ErrorLevel = 0) {
    if (zx > x4 && zy > y4)
        TargetKey := "Numpad6"
    else if (zx < x7 && zy > y4)
        TargetKey := "Numpad4"
    else
        TargetKey := "Numpad8"

    SendInput, {%TargetKey% Down}
    Sleep, 25 
    SendInput, {%TargetKey% Up}
    GoSub HandleCounterAction
    return 
}

HandleCounterAction:
if (GetKeyState("C", "P") || GetKeyState("W", "P")) {
    ; We poll for 500ms (30 frames at 60Hz)
    Loop, 30 {
        ; Increased tolerance (20) for 60Hz motion blur
        PixelSearch, px, py, x16, y16, x17, y17, 0xFF9A8D, 20, Fast RGB
        if (ErrorLevel = 0) {
            ; REGISTER THE PARRY
            if (Active3) { 
                SendInput, {RButton Down}
                DllCall("Sleep", "UInt", 20) ; Guaranteed 60Hz frame coverage
                SendInput, {RButton Up}
            }
            break 
        }
        DllCall("Sleep", "UInt", 15) ; Syncs closer to 60Hz frame timing
    }
}
return
 

; --- TOGGLE HOTKEY ---
~C::
    ubp_toggle := !ubp_toggle ; Flips between 0 and 1
    if (ubp_toggle) {
        SoundBeep, 750, 100 ; High beep for ON
        ToolTip, AutoParry: ON, 10, 10
    } else {
        SoundBeep, 500, 100 ; Low beep for OFF
        ToolTip, AutoParry: OFF, 10, 10
    }
    SetTimer, RemoveToolTip, -1000
return

RemoveToolTip:
ToolTip
return

; --- OPTIMIZED UB-PARRY (60Hz SAFE) ---
ubparry:
; We only run this if the toggle is ON and ubp is active
While (ubp = 1 && ubp_toggle = 1) {
    ; Search for Red Flash (Parry Window)
    ; Increased tolerance to 20 to account for 60Hz motion blur
    PixelSearch, px, py, x16, y16, x17, y17, 0xFF221C, 20, Fast RGB
    
    if (ErrorLevel = 1) {
        ; Use Pause1 delay from your GUI
        DllCall("Sleep", "UInt", Pause1) 
        
        ; Search for Orange (Unblockable Indicator)
        PixelSearch, px, py, x16, y16, x17, y17, 0xF66208, 15, Fast RGB
        
        if (ErrorLevel = 0 && Active1 = 1) {
            ; Check for movement (W) to decide parry type
            if (GetKeyState("W", "P")) {
                if (Blackprior = 1) {
                    SendInput, {Numpad9 Down}
                    DllCall("Sleep", "UInt", 25) ; Guaranteed 60Hz frame coverage
                    SendInput, {Numpad9 Up}
                    Sleep, 2300 
                } else {
                    BlockInput, On
                    SendInput, {Down down}{Space down}
                    DllCall("Sleep", "UInt", 25)
                    SendInput, {Space up}{Down up}
                    BlockInput, Off
                    Sleep, 700 
                }
            } else {
                ; Standard Neutral Parry
                TargetKey := (pbp = 1 ? "{Space}" : "{RButton}")
                SendInput, {%TargetKey% Down}
                DllCall("Sleep", "UInt", 25)
                SendInput, {%TargetKey% Up}
                Sleep, 700
            }
            return ; Exit after parrying one attack
        }
    }
    ; 10ms Sleep is the "Sweet Spot" for 60Hz monitors
    DllCall("Sleep", "UInt", 10) 
}
return
 
Dodge1:
    if (Active1 = 1) {
        Sleep, Pause
        while (GetKeyState("W")) {
            Send, {Numpad9 Down}{Numpad9 Up}
            Sleep, 2000
            return
        }
        Send, {Space Down}{Space Up}
        Sleep, 700
    }
return
 
Dodge2:
    if (Active1 = 1) {
        Sleep, Pause
        while (GetKeyState("W")) {
            SetKeyDelay, 1
            BlockInput, On
            Send, {Down down}{Space Down}{Space Up}{Down Up}
            BlockInput, Off
            SetKeyDelay, 30
            Sleep, 700
            return
        }
        Send, {Space Down}{Space Up}
        if (Active6 = 1) {
            Sleep, Pause2
            Send, {Space Down}{Space Up}{LButton}
        }
        if (Active5 = 1) {
            Sleep, Pause2
            Send, {Space Down}{Space Up}{RButton}
        }
        if (Active18 = 1) {
            Sleep, Pause2
            Send, {Space Down}{Space Up}{Numpad5 Down}{Numpad5 Up}
        }
        if (Active19 = 1) {
            Sleep, Pause2
            Send, {LButton}
        }
        if (Active15 = 1) {
            Sleep, Pause2
            Send, {LButton}
        }
        if (Active13 = 1) {
            Sleep, Pause2
            Send, {Space Down}{Space Up}{Space Down}{Space Up}
        }
        Sleep, 700
        return
    }
return
 
Release:
    ubp := 0
return
 
TOP:
    Sleep, Pause3
    Send, {Numpad8 Down}{Numpad8 Up}
    While (GetKeyState("F")) {
        PixelSearch, px, py, x16, y16, x17, y17, 0xFF2922, 0, Fast|RGB
        if (ErrorLevel = 1) {
            PixelSearch, px, py, x16, y16, x17, y17, 0xFF9A8D, 0, Fast|RGB
            if (ErrorLevel = 0) {
                if (Active3 = 1 && Warden = 0) {
                    Send, {RButton}
                    Sleep, 850
                    return
                }
                if (Active3 = 1 && Warden = 1) {
                    Send, {LButton}
                    Sleep, 500
                    Send, {LButton}
                    Sleep, 850
                    return
                }
                if (Active4 = 1) {
                    Send, {Numpad9 down}{Numpad9 Up}
                    Sleep, 2000
                    return
                }
                if (Active14 = 1) {
                    Send, {C down}{C Up}{LButton}
                    Sleep, 250
                    return
                }
                if (Active16 = 1) {
                    Send, {Space Down}{Space Up}{Numpad5 Down}{Numpad5 Up}
                    Sleep, 250
                    return
                }
                if (Active17 = 1) {
                    Send, {Space Down}{Space Up}{Numpad9 Down}{Numpad9 Up}
                    Sleep, 500
                    return
                }
                if (Active21 = 1) {
                    Send, {C down}{C Up}
                    Sleep, 250
                    return
                }
            }
        }
    }
    While (GetKeyState("E")) {
        PixelSearch, px, py, x16, y16, x17, y17, 0xFF2922, 0, Fast|RGB
        if (ErrorLevel = 1) {
            PixelSearch, px, py, x16, y16, x17, y17, 0xFF9A8D, 0, Fast|RGB
            if (ErrorLevel = 0) {
                if (Active9 = 1) {
                    Send, {RButton}
                    Sleep, 850
                    return
                }
                if (Active11 = 1) {
                    Send, {LButton}
                    Sleep, 1200
                    return
                }
                if (Active12 = 1) {
                    SetKeyDelay, 1
                    BlockInput, On
                    Send, {W Up}{S Up}{A Up}{D Up}
                    Send, {Up Down}{Space Down}{Space Up}{Up Up}
                    BlockInput, Off
                    SetKeyDelay, 30
                    Sleep, 1200
                    return
                }
            }
        }
    }
return
 
LFT:
    Sleep, Pause3
    Send, {Numpad4 Down}{Numpad4 Up}
    While (GetKeyState("F")) {
        PixelSearch, px, py, x16, y16, x17, y17, 0xFF2922, 0, Fast|RGB
        if (ErrorLevel = 1) {
            PixelSearch, px, py, x16, y16, x17, y17, 0xFF9A8D, 0, Fast|RGB
            if (ErrorLevel = 0) {
                if (Active3 = 1) {
                    Send, {RButton}
                    Sleep, 850
                    return
                }
                if (Active4 = 1) {
                    Send, {Numpad9 down}{Numpad9 Up}
                    Sleep, 2000
                    return
                }
                if (Active14 = 1) {
                    Send, {C down}{C Up}{LButton}
                    Sleep, 250
                    return
                }
                if (Active16 = 1) {
                    Send, {Space Down}{Space Up}{Numpad5 Down}{Numpad5 Up}
                    Sleep, 250
                    return
                }
                if (Active17 = 1) {
                    Send, {Space Down}{Space Up}{Numpad9 Down}{Numpad9 Up}
                    Sleep, 500
                    return
                }
                if (Active21 = 1) {
                    Send, {C down}{C Up}
                    Sleep, 250
                    return
                }
            }
        }
    }
    While (GetKeyState("E")) {
        PixelSearch, px, py, x16, y16, x17, y17, 0xFF2922, 0, Fast|RGB
        if (ErrorLevel = 1) {
            PixelSearch, px, py, x16, y16, x17, y17, 0xFF9A8D, 0, Fast|RGB
            if (ErrorLevel = 0) {
                if (Active9 = 1) {
                    Send, {RButton}
                    Sleep, 850
                    return
                }
                if (Active11 = 1) {
                    Send, {LButton}
                    Sleep, 1200
                    return
                }
                if (Active12 = 1) {
                    SetKeyDelay, 1
                    BlockInput, On
                    Send, {W Up}{S Up}{A Up}{D Up}
                    Sleep, Left
                    Send, {Left Down}{Space Down}{Space Up}{Left Up}
                    BlockInput, Off
                    SetKeyDelay, 30
                    Sleep, 1200
                    return
                }
            }
        }
    }
return
 
RGT:
    Sleep, Pause3
    Send, {Numpad6 Down}{Numpad6 Up}
    While (GetKeyState("F")) {
        PixelSearch, px, py, x16, y16, x17, y17, 0xFF2922, 0, Fast|RGB
        if (ErrorLevel = 1) {
            PixelSearch, px, py, x16, y16, x17, y17, 0xFF9A8D, 0, Fast|RGB
            if (ErrorLevel = 0) {
                if (Active3 = 1) {
                    Send, {RButton}
                    Sleep, 850
                    return
                }
                if (Active4 = 1) {
                    Send, {Numpad9 down}{Numpad9 Up}
                    Sleep, 2000
                    return
                }
                if (Active14 = 1) {
                    Send, {C down}{C Up}{LButton}
                    Sleep, 250
                    return
                }
                if (Active16 = 1) {
                    Send, {Space Down}{Space Up}{Numpad5 Down}{Numpad5 Up}
                    Sleep, 250
                    return
                }
                if (Active17 = 1) {
                    Send, {Space Down}{Space Up}{Numpad9 Down}{Numpad9 Up}
                    Sleep, 500
                    return
                }
                if (Active21 = 1) {
                    Send, {C down}{C Up}
                    Sleep, 250
                    return
                }
            }
        }
    }
    While (GetKeyState("E")) {
        PixelSearch, px, py, x16, y16, x17, y17, 0xFF2922, 0, Fast|RGB
        if (ErrorLevel = 1) {
            PixelSearch, px, py, x16, y16, x17, y17, 0xFF9A8D, 0, Fast|RGB
            if (ErrorLevel = 0) {
                if (Active9 = 1) {
                    Send, {RButton}
                    Sleep, 850
                    return
                }
                if (Active11 = 1) {
                    Send, {LButton}
                    Sleep, 1200
                    return
                }
                if (Active12 = 1) {
                    SetKeyDelay, 1
                    BlockInput, On
                    Send, {W Up}{S Up}{A Up}{D Up}
                    Sleep, Right
                    Send, {Right Down}{Space Down}{Space Up}{Right Up}
                    BlockInput, Off
                    SetKeyDelay, 30
                    Sleep, 1200
                    return
                }
            }
        }
    }
return
 
~LShift::
    if (Active12 = 1) {
        OutVar := GetKeyState("LShift")
        if (OutVar = 1) {
            Send, {Numpad3 Down}{Numpad3 Up}
        }
    }
return
 
~F5::
    if (pbp = 1) {
        pbp := 0
        SoundBeep, 750, 100
        return
    }
    if (pbp = 0) {
        pbp := 1
        SoundBeep, 750, 100
        return
    }
return
 
~R::
    Active1 := 0
    SetTimer, Rele, -9000
return
 
Rele:
    Active1 := 1
return
 
~F1::
    if (Pause = 0) {
        Pause := 80
        SoundBeep, 750, 100
        return
    }
    if (Pause = 80) {
        Pause := 0
        SoundBeep, 750, 100
        return
    }
return
 
~F3::
    if (Active3 = 1) {
        Active3 := 0
        Active4 := 1
        GuiControl,, Active3, 0
        GuiControl,, Active4, 1
        SoundBeep, 750, 100
        return
    }
    if (Active4 = 1) {
        Active3 := 1
        Active4 := 0
        GuiControl,, Active3, 1
        GuiControl,, Active4, 0
        SoundBeep, 750, 100
        return
    }
return
 
~F2::
    if (Active1 = 1) {
        Active1 := 0
        GuiControl,, Active1, 0
        SoundBeep, 750, 100
        return
    }
    if (Active1 = 0) {
        Active1 := 1
        GuiControl,, Active1, 1
        SoundBeep, 750, 100
        return
    }
return
 
~Z::
    Pause
    SoundBeep, 750, 100
return
 
~F4::
    nMode++
    if (nMode = 1) {
        Active9 := 1
        Active11 := 0
        Active12 := 0
        GuiControl,, Active9, 1
        GuiControl,, Active11, 0
        GuiControl,, Active12, 0
        SoundPlay, "%A_WorkingDir%\buttonclick.wav"
    }
    if (nMode = 2) {
        Active9 := 0
        Active11 := 1
        Active12 := 0
        GuiControl,, Active9, 0
        GuiControl,, Active11, 1
        GuiControl,, Active12, 0
        SoundPlay, "%A_WorkingDir%\buttonclick.wav"
    }
    if (nMode = 3) {
        Active9 := 0
        Active11 := 0
        Active12 := 1
        GuiControl,, Active9, 0
        GuiControl,, Active11, 0
        GuiControl,, Active12, 1
        SoundPlay, "%A_WorkingDir%\buttonclick.wav"
        nMode := 0
    }
return