;###############################################
;				Variables
;###############################################

global paused := False, refill = False
global countUpdateUi := 0
global infoStatus := "::", infoLocation := "::"
global sRefillsUsed := 0
global sRuns := 0, sWins := 0, sDefeats := 0
global timeAvg, timeAvgWins, timeTotal, timeBattle, timeLastBattle := "::", timeStartBattle, timeStart := A_TickCount
global selectedMap


;###############################################
;				Constants
;		Edit theese as u see fit
;###############################################

global timeLoop := 20 ; Wait time for main loop
global timeUpdate := 500 ; Update rate for gui
global sRefillsMax := 30 ; How many times to refill

;###############################################
;				Arrays
;###############################################
global arrFodders := Object()
global arrMaps := Array("Dragons","Giants","Necro","Chiruka","Faimon","Vrofagus","Hydeni","Tamor","SD","ToA","HoMagic","HoHeroes","HoDark","HoFire","HoLight","HoWater","HoWind")


;###############################################
;				Lists
;###############################################
global listMaps
For each, item in arrMaps
	listMaps .=	(!listMaps ? "" : "|") item