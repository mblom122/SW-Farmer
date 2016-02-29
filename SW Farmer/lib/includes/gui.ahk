; ###############################################
; 					Include
; ###############################################

#Include lib\includes\Class_ImageButton.ahk

;###############################################
;	Main window
;###############################################

Gui, +LastFound
; WinSet, Transparent, 180
Gui, Color, 0x2E282A
Gui, Margin, 0, 0
Gui, Font, s10 cFFFFFF
Gui, Add, Progress, % "x-1 y-1 w600 h31 Background404040 Disabled hwndHPROG"


;###############################################
;	GUI: Control
;###############################################

Gui, Add, Text, % "x0 y0 w" 260 " h20 BackgroundTrans Center 0x200 gGuiMove vguiCaption", SW Farmer
Gui, Font, s12
Gui, Add, GroupBox,x8 y30 w284 h145, Control
Gui, Font, s10
gui, add, Text,x20 y50 w47 h20 left vtxtPaused, Paused:
Gui, font,bold cF72C25
gui, add, Text,x71 y50 w45 h18 left vtxtPausedData,  
Gui, font,norm cFFFFFF
gui, add, Text,x115 y50 w45 h20 left vtxtRefill, Refill:
Gui, font,bold cF72C25
gui, add, Text,x151 y50 w45 h18 left vtxtRefillData,
Gui, font,norm cFFFFFF
Gui, Font, underline
Gui, Add, Button,x20 y69 w72 h30 vbutPause gTogglePause hwndHBT2,  {F4} Pause
	Opt1 := [1, 0x17BEBB, 0x17BEBB, "Black"]             ; normal background & text colors
	Opt2 := {2: 0x17BEBB, 3: 0x17BEBB, 4: "White"}              ; hot background & text colors (object syntax)
	Opt3 := {4: "Red"}                                          ; pressed text color (object syntax)
	If !ImageButton.Create(HBT2, Opt1, Opt2, Opt3)
	   MsgBox, 0, ImageButton Error Btn2, % ImageButton.LastError
Gui, Add, Button,x115 y69 w72 h30 Default vbutRefill gToggleRefill hwndHBT2, {F3} Refill
	Opt1 := [1, 0x17BEBB, 0x17BEBB, "Black"]             ; normal background & text colors
	Opt2 := {2: 0x17BEBB, 3: 0x17BEBB, 4: "White"}              ; hot background & text colors (object syntax)
	Opt3 := {4: "Red"}                                          ; pressed text color (object syntax)
	If !ImageButton.Create(HBT2, Opt1, Opt2, Opt3)
	   MsgBox, 0, ImageButton Error Btn2, % ImageButton.LastError
Gui, Add, Button,x208 y69 w72 h30 Default vbutQuit gQuit hwndHBT2, {F5} Quit
	Opt1 := [1, 0xCD5334, 0xCD5334, "Black"]             ; normal background & text colors
	Opt2 := {2: 0xCD5334, 3: 0xCD5334, 4: "White"}              ; hot background & text colors (object syntax)
	Opt3 := {4: "Red"}                                          ; pressed text color (object syntax)
	If !ImageButton.Create(HBT2, Opt1, Opt2, Opt3)
	   MsgBox, 0, ImageButton Error Btn2, % ImageButton.LastError
Gui, Font, norm	   
gui, add, Text,x15 y115 w120 h20 right vtxtSelectedMap, Select farming map:
Gui, Add, DropDownList,x145 y114 w140 h20 Choose1 R10 vddlSelectedMap gSelectMap, %listMaps%
gui, add, Text,x15 y146 w120 h20 right vtxtSelectedDiff, Select difficulty:
Gui, Add, DropDownList,x145 y144 w140 h20 R5 vddlSelectedDiff, |B1|B2|B3|B4|B5|B6|B7|B8|B9|B10||


;###############################################
;	GUI: Stats
;###############################################
Gui, Font, s12
Gui, Add, GroupBox,x8 y176 w284 h225, Stats
Gui, Font, s10
gui, add, Text,x15 y195 w120 h20 right vtxtCurrentLoc, Current location: 
gui, add, Text,x145 y195 w137 h20 left vtxtCurrentLocData, 0
gui, add, Text,x15 y215 w120 h20 right vtxtStatus, Status: 
gui, add, Text,x145 y215 w137 h20 left vtxtStatusData, 0
gui, add, Text,x15 y235 w120 h20 right vtxtRunTime, Total runtime:  
gui, add, Text,x145 y235 w137 h20 left vtxtRunTimeData, 0
gui, add, Text,x15 y255 w120 h20 right vtxtBattleTime, Current battle time:  
gui, add, Text,x145 y255 w137 h20 left vtxtBattleTimeData, 0
gui, add, Text,x15 y275 w120 h20 right vtxtLastRun, LastRun: 
gui, add, Text,x145 y275 w137 h20 left vtxtLastRunData, 0
gui, add, Text,x15 y295 w120 h20 right vtxtAvgTime, Avg Time/Battle: 
gui, add, Text,x145 y295 w137 h20 left vtxtAvgTimeData, 0
gui, add, Text,x15 y315 w120 h20 right vtxtAvgWinTime, Avg Time/Wins: 
gui, add, Text,x145 y315 w137 h20 left vtxtAvgWinTimeData, 0
gui, add, Text,x15 y335 w120 h20 right vtxtRuns, Runs: 
gui, add, Text,x145 y335 w137 h20 left vtxtRunsData, 0
gui, add, Text,x15 y355 w120 h20 right vtxtWins, Victories:  
gui, add, Text,x145 y355 w137 h20 left vtxtWinsData, 0
gui, add, Text,x15 y375 w120 h20 right vtxtDefeats, Defeats: 
gui, add, Text,x145 y375 w137 h20 left vtxtDefeatsData, 0

; gui, add, Text,w150 right vtxtInfo2, F3: Refill on/off, F4: Pause
; gui, add, Text,w150 right vtxtActive, Active: 
; gui, add, Text,w150 right vtxtRefill, Refill: 
; gui, add, Text,w150 right vtxtFodder, Fodder mode: 
; gui, add, Text,w150 right vtxtStatus, Status:
; gui, add, Text,w150 right vtxtMap, Map:
; gui, add, Text,w150 right vtxtRuns, Runs:
; gui, add, Text,w150 right vtxtDefeated, Defeated:
; gui, add, Text,w150 right vtxtRuntime, Runtime:
; gui, add, Text,w150 right vtxtCurrBatTime, Current battletime:
; gui, add, Text,w150 right vtxtLastBat, Last battletime:
; gui, add, Text,w250 right vtxtAvgTime, Avg time/run:

Gui, -Caption
Gui, Show, % "w 300 h 410 x 0 y 150"
; GuiControl,, butPause, Test

