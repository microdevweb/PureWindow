;{-------------------------------------------
; AUTHOR    : microdev
; DATE      : 2020-03-28
; CLASS     : _child
; VERSION   : 
; PROCESS   : 
;}-------------------------------------------

Module _CHILD
  Procedure _getMethodsSize()
    ProcedureReturn ?E_MET - ?S_MET
  EndProcedure
  Procedure _getMethods()
    ProcedureReturn  ?S_MET
  EndProcedure

	DataSection
		S_MET:

		E_MET:
	EndDataSection
EndModule
; IDE Options = PureBasic 5.72 LTS Beta 1 (Windows - x64)
; CursorPosition = 13
; Folding = -
; EnableXP