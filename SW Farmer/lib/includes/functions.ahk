;###############################################
;				Functions
;###############################################

FormatCT(ms)  ;  Formats milliseconds into 00:00:00:000 (last three digits are milliseconds)
{
	;ms := round(ms)
	ms := ms // 1000
	hrs := ms // 3600
	min := (ms - hrs * 3600) // 60
	sec := ms - hrs * 3600 - min * 60

	return , hrs . ":" . min . ":" . sec
}

CalcTimes()
{
	runtime := FormatCT(A_TickCount - startTime)
	
	if startBattleTime > 0
		battleTime := FormatCT(A_TickCount - startBattleTime)
	else
		battleTime := FormatCT(A_TickCount - startTime)
	
	avgTime := FormatCT((A_TickCount - startTime) // runs)
}

UpdateUi()
{
		GuiControl,, txtStatus, Status: %status%
	GuiControl,, txtMap, Map: %map%
	GuiControl,, txtRuns, Runs: %runs%
	GuiControl,, txtFodder, 1* fodder mode: %foddermode%
	GuiControl,, txtDefeated, Defeated: %defeated%
	GuiControl,, txtActive, Active: %aktiv%
	GuiControl,, txtRuntime,Runtime: %runTime%
	GuiControl,, txtCurrBatTime, Current battletime: %currBatTime%
	GuiControl,, txtAvgTime, Avg time/run: %avgTime%
	if (refill = "on")
		GuiControl,, txtRefill, Refill: %usedRefills% / %maxRefills%
	else
		GuiControl,, txtRefill, Refill: %refill%
	
}


; Func CheckLocation()

; EndFunc

; Func checkForImage()

; EndFunc

; Func UpdateUi()
	; $runtime = _DateDiff("s", $iStartTime, _NowCalc())
	; GUICtrlSetData($lblPaused,"Paused:  " & $Paused)
	; GUICtrlSetData($lblRefill,"Refill: " & $refill)
	; GUICtrlSetData($butRefill,"{F3} " & not $refill)
	; GUICtrlSetData($butPause,"{F4} " & not $Paused)
	; GUICtrlSetData($lblStatusData,$status)
	; GUICtrlSetData($lblRunTimeData,Sec2Time($runtime))

	; If $iStartBatTime <> 0 Then
		; GUICtrlSetData($lblAvgTimeData,Sec2Time(_DateDiff("s", $iStartBatTime, _NowCalc())))
	; EndIf
	; If $runs <> 0 Then
		; GUICtrlSetData($lblAvgTimeData,Sec2Time($runtime/$runs))
	; EndIf
	; If $runs <> 0 Then
		; GUICtrlSetData($lblAvgWinTimeData,Sec2Time($runtime/$wins))
	; EndIf
; EndFunc   ;==>UpdateUi

; Func ToggleRefill()
		; $refill = Not $refill
; EndFunc

; Func TogglePause()
	; $Paused = Not $Paused
	; While $Paused
		; $status = "Paused"
		; UpdateUi()
		; Sleep(100)
	; WEnd
; EndFunc

; Func Sec2Time($nr_sec)
   ; $sec2time_hour = Int($nr_sec / 3600)
   ; $sec2time_min = Int(($nr_sec - $sec2time_hour * 3600) / 60)
   ; $sec2time_sec = $nr_sec - $sec2time_hour * 3600 - $sec2time_min * 60
   ; Return StringFormat('%02d:%02d:%02d', $sec2time_hour, $sec2time_min, $sec2time_sec)
; EndFunc   ;==>Sec2Time