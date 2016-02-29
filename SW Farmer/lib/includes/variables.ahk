;###############################################
;				Variables
;###############################################

global Paused := False, refill = False
global infoStatus
global sRefillsUsed, sRefillsMax
global sRuns := 0, sWins := 0, sDefeat := 0
global timeTotal, timeBattle, timeStartBattle, timeStart := A_TickCount
global selectedMap

;###############################################
;				Arrays
;###############################################

global arrMaps := Array("Dragons","Giants","Necro","Chiruka","Faimon","Vrofagus","Hydeni","Tamor","SD","ToA","HoMagic","HoHeroes","HoDark","HoFire","HoLight","HoWater","HoWind")


;###############################################
;				Lists
;###############################################
global listMaps
For each, item in arrMaps
	listMaps .=	(!listMaps ? "" : "|") item