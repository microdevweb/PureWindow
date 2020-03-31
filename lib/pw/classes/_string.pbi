;{-------------------------------------------
; AUTHOR    : microdev
; DATE      : 2020-03-30
; CLASS     : _string
; VERSION   : 
; PROCESS   : 
;}-------------------------------------------

Module _STRING
  Procedure.s _makeFlags(*this._members) 
    With *this
      Protected flags.s
      If \flags & #PB_String_Numeric = #PB_String_Numeric
        flags + "#PB_String_Numeric"
      EndIf
      If \flags & #PB_String_Password = #PB_String_Password
        If Len(flags):flags+"|":EndIf
        flags + "#PB_String_Password"
      EndIf
      If \flags & #PB_String_ReadOnly = #PB_String_ReadOnly
        If Len(flags):flags+"|":EndIf
        flags + "#PB_String_ReadOnly"
      EndIf
      If \flags & #PB_String_LowerCase = #PB_String_LowerCase
        If Len(flags):flags+"|":EndIf
        flags + "#PB_String_LowerCase"
      EndIf
      If \flags & #PB_String_UpperCase = #PB_String_UpperCase
        If Len(flags):flags+"|":EndIf
        flags + "#PB_String_UpperCase"
      EndIf
      If \flags & #PB_String_BorderLess = #PB_String_BorderLess
        If Len(flags):flags+"|":EndIf
        flags + "#PB_String_BorderLess"
      EndIf
      If Len(flags)
        ProcedureReturn "flags='"+flags+"' "
      EndIf
      ProcedureReturn ""
    EndWith
  EndProcedure
  ;{ ABSTRACT METHODS
  Procedure.s _build(*this._members,*parent,x,y,w,h)
    With *this
      Protected xml.s 
      If Len(\label):xml + "<frame text='"+\label+"'>":EndIf 
      xml + "<string name = '"+Str(*this)+"'"
      xml + _GADGET::_setSize(*this)
      xml + " text='"+\value+"' "
      xml + _makeFlags(*this)
      xml + \order
      xml +"/>"
      If Len(\label):xml + "</frame>":EndIf
      ProcedureReturn xml
    EndWith
  EndProcedure
  ;}
	; super constructor
	Procedure _super(*this._members,*s_daughter,*E_daughter)
		With *this
			; allocate memory
			Protected motherLen = ?E_MET - ?S_MET,
				daughterLen = *E_daughter - *s_daughter
			\methods = AllocateMemory(motherLen + daughterLen)
			; empilate methods address
			MoveMemory(?S_MET,\methods,motherLen)
			MoveMemory(*s_daughter,\methods + motherLen,daughterLen)
		EndWith
	EndProcedure

	;{-------------------------------------------
	; CONSTRUCTOR   : new
	; PARAMETER     : 
	;}-------------------------------------------
	Procedure new(value.s = "",flags = 0)
		Protected *this._members = AllocateStructure(_members)
		With *this
		  _GADGET::super()
		  \value = value
		  \flags = flags
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
; CursorPosition = 50
; FirstLine = 35
; Folding = --
; EnableXP