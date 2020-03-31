;{-------------------------------------------
; AUTHOR    : microdev
; DATE      : 2020-03-29
; CLASS     : _gadget
; VERSION   : 
; PROCESS   : 
;}-------------------------------------------
Module _GADGET
	; super constructor
	Procedure _super(*this._members,*s_daughter,*E_daughter)
		With *this
			; allocate memory
			Protected motherLen = ?E_MET - ?S_MET + _CHILD::_getMethodsSize(),
				daughterLen = *E_daughter - *s_daughter
			\methods = AllocateMemory(motherLen + daughterLen)
			; empilate methods address
			MoveMemory(_CHILD::_getMethods(),\methods,_CHILD::_getMethodsSize())
			MoveMemory(?S_MET,\methods + _CHILD::_getMethodsSize(),motherLen)
			MoveMemory(*s_daughter,\methods + motherLen,daughterLen)
			\gadget = #True
			\width = PW::#SIZE_AUTO
			\height = PW::#SIZE_AUTO
			\maxHeight = PW::#SIZE_AUTO
			\maxWidth = PW::#SIZE_AUTO
			\minHeight = PW::#SIZE_AUTO
			\minWidth = PW::#SIZE_AUTO
		EndWith
	EndProcedure
	;{ PRIVATE METHODS
	Procedure myEvent()
	  Protected *this._members = GetGadgetData(EventGadget())
	  With *this
	    If \callback
	      \callback(*this)
	    EndIf
	  EndWith
	EndProcedure
	;}
	;{ GETTERS AND SETTERS
	Procedure.l getFlags(*this._members)
	  With *this
	    ProcedureReturn \flags
	  EndWith
	EndProcedure
	
	Procedure setFlags(*this._members,flags.l)
	  With *this
	    \flags = flags
	  EndWith
	EndProcedure
	
	Procedure.l getWidth(*this._members)
	  With *this
	    ProcedureReturn \width
	  EndWith
	EndProcedure
	
	Procedure setWidth(*this._members,width.l)
	  With *this
	    \width = width
	  EndWith
	EndProcedure
	
	Procedure.l getHeight(*this._members)
	  With *this
	    ProcedureReturn \height
	  EndWith
	EndProcedure
	
	Procedure setHeight(*this._members,height.l)
	  With *this
	    \height = height
	  EndWith
	EndProcedure
	
	Procedure getData(*this._members)
	  With *this
	    ProcedureReturn \data
	  EndWith
	EndProcedure
	
	Procedure setData(*this._members,*data)
	  With *this
	    \data = *data
	  EndWith
	EndProcedure
	
	Procedure.l getId(*this._members)
	  With *this
	    ProcedureReturn \id
	  EndWith
	EndProcedure
	
	Procedure.l getMinWidth(*this._members)
	  With *this
	    ProcedureReturn \minWidth
	  EndWith
	EndProcedure
	
	Procedure setMinWidth(*this._members,minWidth.l)
	  With *this
	    \minWidth = minWidth
	  EndWith
	EndProcedure
	
	Procedure.l getMaxWidth(*this._members)
	  With *this
	    ProcedureReturn \maxWidth
	  EndWith
	EndProcedure
	
	Procedure setMaxWidth(*this._members,maxWidth.l)
	  With *this
	    \maxWidth = maxWidth
	  EndWith
	EndProcedure

	Procedure.l getMinHeight(*this._members)
	  With *this
	    ProcedureReturn \minHeight
	  EndWith
	EndProcedure
	
	Procedure setMinHeight(*this._members,minHeight.l)
	  With *this
	    \minHeight = minHeight
	  EndWith
	EndProcedure

	Procedure.l getMaxHeight(*this._members)
	  With *this
	    ProcedureReturn \maxHeight
	  EndWith
	EndProcedure
	
	Procedure setMaxHeight(*this._members,maxHeight.l)
	  With *this
	    \maxHeight = maxHeight
	  EndWith
	EndProcedure
	
	Procedure.s getLabel(*this._members)
	  With *this
	    ProcedureReturn \label
	  EndWith
	EndProcedure
	
	Procedure setLabel(*this._members,label.s)
	  With *this
	    \label = label
	  EndWith
	EndProcedure




	;}
  ;{ PUBLIC METHODS
	Procedure bind(*this._members,*callback)
	  With *this
	    \callback = *callback
	    If \id And \callback
	      BindGadgetEvent(\id,@myEvent())
	    EndIf
	  EndWith
	EndProcedure
	;}
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
	    \id = DialogGadget(*win\dialog,Str(*this))
	    SetGadgetData(\id,*this)
	    If \callback
	      BindGadgetEvent(\id,@myEvent())
	    EndIf
	  EndWith
	EndProcedure
	;}
  ;{ PROTECTED METHODS
	Procedure.s _setSize(*this._members)
	  With *this
	    Protected xml.s
	    If \width
        xml + " widht = '"+Str(\width)+"'"
      EndIf
      If \height
        xml + " height = '"+Str(\height)+"'"
      EndIf
      If \maxHeight
        xml + " maxheight = '"+Str(\maxHeight)+"'"
      EndIf
      If \maxWidth
        xml + " maxwidth = '"+Str(\maxWidth)+"'"
      EndIf
      If \minHeight
        xml + " minheight = '"+Str(\minHeight)+"'"
      EndIf
      If \minWidth
        xml + " minwidth = '"+Str(\minWidth)+"'"
      EndIf
      ProcedureReturn xml
	  EndWith
	EndProcedure
	;}
	
	DataSection
		S_MET:
		Data.i @getFlags()
		Data.i @setFlags()
		Data.i @getWidth()
		Data.i @setWidth()
		Data.i @getHeight()
		Data.i @setHeight()
		Data.i @getData()
		Data.i @setData()
		Data.i @getId()
		Data.i @getMinWidth()
		Data.i @setMinWidth()
		Data.i @getMaxWidth()
		Data.i @setMaxWidth()
		Data.i @getMinHeight()
		Data.i @setMinHeight()
		Data.i @getMaxHeight()
		Data.i @setMaxHeight()
		Data.i @getLabel()
		Data.i @setLabel()


    Data.i @bind()
		E_MET:
	EndDataSection
EndModule
; IDE Options = PureBasic 5.72 LTS Beta 1 (Windows - x64)
; CursorPosition = 211
; FirstLine = 194
; Folding = ------
; EnableXP