;{-------------------------------------------
; AUTHOR    : microdev
; DATE      : 2020-03-29
; CLASS     : _button
; VERSION   : 
; PROCESS   : 
;}-------------------------------------------
Module _BUTTON
  Procedure.s _makeFlags(*this._members) 
    With *this
      Protected flags.s
      If \flags & #PB_Button_Right = #PB_Button_Right
        flags + "#PB_Button_Right"
      EndIf
      If \flags & #PB_Button_Left = #PB_Button_Left
        If Len(flags):flags+"|":EndIf
        flags + "#PB_Button_Left"
      EndIf
      If \flags & #PB_Button_Default = #PB_Button_Default
        If Len(flags):flags+"|":EndIf
        flags + "#PB_Button_Default"
      EndIf
      If \flags & #PB_Button_MultiLine = #PB_Button_MultiLine
        If Len(flags):flags+"|":EndIf
        flags + "#PB_Button_MultiLine"
      EndIf
      If \flags & #PB_Button_Toggle = #PB_Button_Toggle
        If Len(flags):flags+"|":EndIf
        flags + "#PB_Button_Toggle"
      EndIf
      If Len(flags)
        ProcedureReturn "flags='"+flags+"' "
      EndIf
      ProcedureReturn ""
    EndWith
  EndProcedure
  ;{ ABSTRACT METHODS
  Procedure.s _build(*this._members)
    With *this
      Protected xml.s = "<button name = '"+Str(*this)+"'"
      xml + _GADGET::_setSize(*this)
      xml + " text='"+\title+"' "
      xml + _makeFlags(*this)
      xml + \order
      Debug \order
      xml +"/>"
      ProcedureReturn xml
    EndWith
  EndProcedure
  ;}
	;{-------------------------------------------
	; CONSTRUCTOR   : new
	; PARAMETER     : 
	;}-------------------------------------------
	Procedure new(label.s,flags = 0)
		Protected *this._members = AllocateStructure(_members)
		With *this
		  _GADGET::super()
		  \flags = flags
		  \title = label
		  \gadget = #True
		  \width = 0
		  \height = 0
		  \_build = @_build()
			ProcedureReturn *this
		EndWith
	EndProcedure
	
	Procedure.s getTitle(*this._members)
	  With *this
	    ProcedureReturn \title
	  EndWith
	EndProcedure
	
	Procedure setTitle(*this._members,title.s)
	  With *this
	    \title = title
	  EndWith
	EndProcedure


	
	DataSection
		S_MET:
		Data.i @getTitle()
		Data.i @setTitle()
		E_MET:
	EndDataSection
EndModule
; IDE Options = PureBasic 5.72 LTS Beta 1 (Windows - x64)
; CursorPosition = 37
; FirstLine = 22
; Folding = --
; EnableXP