;{-------------------------------------------
; AUTHOR    : microdev
; DATE      : 2020-03-29
; CLASS     : _hbox
; VERSION   : 
; PROCESS   : 
;}-------------------------------------------
Module _HBOX
  
  ;{ ABSTRACT METHODS
  Procedure.s _build(*this._members)
    Protected xml.s
    With *this
      xml = "<hbox "
      Select \expand
        Case PW::#EXPAND_YES
          xml + "expand='yes'"
        Case PW::#EXPAND_NO
          xml + "expand='no'"
        Case PW::#EXPAND_EQUAL
          xml + "expand='equal'"
        Default
          xml + "expand='item:"+Str(\expand)+"'"
      EndSelect
      xml +" "
      Select \align
        Case PW::#ALIGN_LEFT
          xml+"align='left'"
        Case PW::#ALIGN_RIGHT
          xml+"align='right'"
        Case PW::#ALIGN_BOTTOM
          xml+"align='bottom'"
        Case PW::#ALIGN_TOP
          xml+"align='top'" 
        Case PW::#ALIGN_CENTER
          xml+"align='center'"   
      EndSelect
      xml + \order
      xml + ">"
      ; BUILD CHILDREN 
      ForEach \myChildren()
        If \myChildren()\gadget
          xml + _GADGET::_build(\myChildren())
        EndIf
      Next
      xml + "</hbox>"
      ProcedureReturn xml
    EndWith
  EndProcedure

  ;}
  
	;{-------------------------------------------
	; CONSTRUCTOR   : new
	; PARAMETER     : 
	;}-------------------------------------------
	Procedure new()
		Protected *this._members = AllocateStructure(_members)
		With *this
		  _BOX::super()
		  \_build = @_build()
			ProcedureReturn *this
		EndWith
	EndProcedure
	

	
	DataSection
		S_MET:

		E_MET:
	EndDataSection
EndModule
; IDE Options = PureBasic 5.72 LTS Beta 1 (Windows - x64)
; CursorPosition = 37
; FirstLine = 16
; Folding = --
; EnableXP