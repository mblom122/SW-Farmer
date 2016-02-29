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

ReadFodderCSV()
{
	Loop, read, lib\data\fodders.csv
	{
		If (A_Index > 1)
		{
			import := A_LoopReadLine
			StringReplace, import, import,;,_, All
			arrFodders.Insert(import)
			; FileAppend, , lib\images\maps\%import%.PNG ;Just to make images for fodders
		}
	}
}

CalcTimes()
{
	timeTotal := FormatCT(A_TickCount - timeStart)
	
	if (timeStartBattle > 0)
		timeBattle := FormatCT(A_TickCount - timeStartBattle)
	else
		timeBattle := "::"
	
	timeAvg := FormatCT((A_TickCount - timeStart) // sRuns)
	timeAvgWins := FormatCT((A_TickCount - timeStart) // sWins)
}

UpdateUi()
{
	countUpdateUi++
	if (countUpdateUi > timeUpdate/timeLoop)
	{
		countUpdateUi := 0
		
		if (paused = False)
			GuiControl,, txtPausedData, False
		else
			GuiControl,, txtPausedData, True
		if (refill = False)
			GuiControl,, txtRefillData, False
		else
			GuiControl,, txtRefillData, True
		
		GuiControl,, txtStatusData, %infoStatus%
		GuiControl,, txtCurrentLocData, %infoLocation%

		GuiControl,, txtRunTimeData, %timeTotal%
		GuiControl,, txtBattleTimeData, %timeBattle%
		GuiControl,, txtLastRunData, %timeLastBattle%
		GuiControl,, txtAvgTimeData, %timeAvg%
		GuiControl,, txtAvgWinTimeData, %timeAvgWins%
		
		GuiControl,, txtRunsData, %sRuns%
		GuiControl,, txtWinsData, %sWins%
		GuiControl,, txtDefeatsData, %sDefeats%
	}
}