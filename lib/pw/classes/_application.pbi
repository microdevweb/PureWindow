;{-------------------------------------------
; AUTHOR    : microdev
; DATE      : 2020-03-28
; CLASS     : _application
; VERSION   : 
; PROCESS   : 
;}-------------------------------------------
Module _APPLICATION
	;{-------------------------------------------
	; CONSTRUCTOR   : new
	; PARAMETER     : 
	;}-------------------------------------------
	Procedure new()
		Protected *this._members = AllocateStructure(_members)
		With *this
		  \methods = ?S_MET 
			ProcedureReturn *this
		EndWith
	EndProcedure
	
	;{-------------------------------------------
  ; METHOD     : run
  ; PARAMETERS : 
  ; RETURN     : 
  ; PROCESS    : 
  ;}-------------------------------------------
	Procedure run(*this._members,*window)
		With *this
		  \window = *window
		  \window\show()
		  If \initiation
		    \initiation()
		  EndIf
		  While IsWindow(\window\getId())
		    WaitWindowEvent()
		  Wend
		  End
		EndWith
	EndProcedure
	
	Procedure setInitiation(*this._members,*callback)
	  With *this
	    \initiation = *callback
	  EndWith
	EndProcedure
	
	
	
	
	DataSection
	  S_MET:
	  Data.i @setInitiation()
		Data.i @run()
		E_MET:
	EndDataSection
EndModule
; IDE Options = PureBasic 5.72 LTS Beta 1 (Windows - x64)
; CursorPosition = 42
; FirstLine = 20
; Folding = --
; EnableXP