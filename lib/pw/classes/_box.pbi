;{-------------------------------------------
; AUTHOR    : microdev
; DATE      : 2020-03-28
; CLASS     : _box
; VERSION   : 
; PROCESS   : 
;}-------------------------------------------
Module _BOX
	; super constructor
	Procedure _super(*this._members,*s_daughter,*E_daughter)
		With *this
			; allocate memory
			Protected motherLen = (?E_MET - ?S_MET) + _CHILD::_getMethodsSize(),
				daughterLen = *E_daughter - *s_daughter
			\methods = AllocateMemory(motherLen + daughterLen)
			; empilate methods address
			MoveMemory(_CHILD::_getMethods(),\methods,_CHILD::_getMethodsSize())
			MoveMemory(?S_MET,\methods +_CHILD::_getMethodsSize(),motherLen)
			MoveMemory(*s_daughter,\methods + motherLen,daughterLen)
			\spacing = 5
			\expand = PW::#EXPAND_YES
			\align = PW::#ALIGN_RIGHT
			\gadget = #False
		EndWith
	EndProcedure

	;{-------------------------------------------
	; CONSTRUCTOR   : new
	; PARAMETER     : 
	;}-------------------------------------------
	Procedure new()
		Protected *this._members = AllocateStructure(_members)
		With *this
			\methods = ?S_MET ; remove it if class extends of other class
			;place your code here
			ProcedureReturn *this
		EndWith
	EndProcedure
	
	;{ ABSTRACT METHODS
	Procedure.s _build(*this._members)
	  With *this
	    If \_build
	      ProcedureReturn \_build(*this)
	    EndIf
	    ProcedureReturn ""
	  EndWith
	EndProcedure
	
	Procedure _foundID(*this._members,*win._WINDOW::_members)
	  With *this
	    ForEach \myChildren()
	      If \myChildren()\gadget
	        _GADGET::_foundID(\myChildren(),*win)
	      Else
	        _BOX::_foundID(\myChildren(),*win)
	      EndIf
	    Next
	  EndWith
	EndProcedure
	
	;}
  ;{ GETTERS AND SETTERS
	Procedure.l getSpacing(*this._members)
	  With *this
	    ProcedureReturn \spacing
	  EndWith
	EndProcedure
	
	Procedure setSpacing(*this._members,spacing.l)
	  With *this
	    If spacing<0:spacing=0:EndIf
	    \spacing = spacing
	  EndWith
	EndProcedure
	
	Procedure.l getExpand(*this._members)
	  With *this
	    ProcedureReturn \expand
	  EndWith
	EndProcedure
	
	Procedure setExpand(*this._members,expand.l)
	  With *this
	    If expand<-3:expand=-2:EndIf
	    \expand = expand
	  EndWith
	EndProcedure
	
	Procedure.l getAlign(*this._members)
	  With *this
	    ProcedureReturn \align
	  EndWith
	EndProcedure
	
	Procedure setAlign(*this._members,align.l)
	  With *this
	    If align < PW::#ALIGN_LEFT Or align > PW::#ALIGN_CENTER
	      align = PW::#ALIGN_LEFT
	    EndIf
	    \align = align
	  EndWith
	EndProcedure



	;}
  ;{ PUBLIC METHODS
  ;{-------------------------------------------
  ; METHOD     : addChild
  ; PARAMETERS : 
  ; RETURN     : 
  ; PROCESS    : 
  ;}-------------------------------------------
	Procedure addChild(*this._members,*child)
	  With *this
	    AddElement(\myChildren())
	    \myChildren() = *child
	    ProcedureReturn *child
	  EndWith
	EndProcedure


	;}
	DataSection
		S_MET:
		Data.i @getSpacing()
		Data.i @setSpacing()
		Data.i @getExpand()
		Data.i @setExpand()
		Data.i @getAlign()
		Data.i @setAlign()

		Data.i @addChild()
		E_MET:
	EndDataSection
EndModule
; IDE Options = PureBasic 5.72 LTS Beta 1 (Windows - x64)
; CursorPosition = 98
; FirstLine = 85
; Folding = --X-
; EnableXP