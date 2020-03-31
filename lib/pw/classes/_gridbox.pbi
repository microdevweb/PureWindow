;{-------------------------------------------
; AUTHOR    : microdev
; DATE      : 2020-03-31
; CLASS     : _gridbox
; VERSION   : 
; PROCESS   : 
;}-------------------------------------------
Module _GRIDBOX
  ;{ ABSTRACT METHODS
  Procedure.s _build(*this._members)
    Protected xml.s
    With *this
      xml = "<gridbox columns='"+Str(\columns)+"'"
      Select \rowExpand
        Case PW::#EXPAND_YES
          xml + " rowexpand='yes'"
        Case PW::#EXPAND_NO
          xml + " rowexpand='no'"
        Case PW::#EXPAND_EQUAL
          xml + " rowexpand='equal'"
        Default
          xml + " rowexpand='item:"+Str(\rowExpand)+"'"
      EndSelect
      Select \colExpand
        Case PW::#EXPAND_YES
          xml + " colexpand ='yes'"
        Case PW::#EXPAND_NO
          xml + " colexpand ='no'"
        Case PW::#EXPAND_EQUAL
          xml + " colexpand ='equal'"
        Default
          xml + " colexpand ='item:"+Str(\colExpand)+"'"
      EndSelect
      xml +" "
      Select \align
        Case PW::#ALIGN_LEFT
          xml+" align='left'"
        Case PW::#ALIGN_RIGHT
          xml+" align='right'"
        Case PW::#ALIGN_BOTTOM
          xml+" align='bottom'"
        Case PW::#ALIGN_TOP
          xml+" align='top'" 
        Case PW::#ALIGN_CENTER
          xml+" align='center'"   
      EndSelect
      
      xml + ">"
      ; BUILD CHILDREN 
      ForEach \myChildren()
        \myChildren()\order = ""
        If FindMapElement(\rowSpan(),Str(\myChildren()))
          \myChildren()\order + " rowspan='"+Str(\rowSpan())+"'"
        EndIf
        If FindMapElement(\colSpan(),Str(\myChildren()))
          \myChildren()\order + " colspan='"+Str(\colSpan())+"'"
          Debug \myChildren()\order
        EndIf
        If \myChildren()\gadget
          xml + _GADGET::_build(\myChildren())
        Else
          xml + _BOX::_build(\myChildren())
        EndIf
      Next
      xml + "</gridbox>"
      ProcedureReturn xml
    EndWith
  EndProcedure

	;{-------------------------------------------
	; CONSTRUCTOR   : new
	; PARAMETER     : 
	;}-------------------------------------------
	Procedure new(columns)
		Protected *this._members = AllocateStructure(_members)
		With *this
			_BOX::super()
			\columns = columns
			\colSpacing = 5
			\rowSpacing = 5
			\colExpand = PW::#EXPAND_YES
			\rowExpand = PW::#EXPAND_NO
			\_build = @_build()
			ProcedureReturn *this
		EndWith
	EndProcedure
	
	;{ GETTERS AND SETTERS
	Procedure.l getColumns(*this._members)
	  With *this
	    ProcedureReturn \columns
	  EndWith
	EndProcedure
	
	Procedure setColumns(*this._members,columns.l)
	  With *this
	    \columns = columns
	  EndWith
	EndProcedure
	
	Procedure.l getColSpacing(*this._members)
	  With *this
	    ProcedureReturn \colSpacing
	  EndWith
	EndProcedure
	
	Procedure setColSpacing(*this._members,colSpacing.l)
	  With *this
	    \colSpacing = colSpacing
	  EndWith
	EndProcedure

	Procedure.l getRowSpacing(*this._members)
	  With *this
	    ProcedureReturn \rowSpacing
	  EndWith
	EndProcedure
	
	Procedure setRowSpacing(*this._members,rowSpacing.l)
	  With *this
	    \rowSpacing = rowSpacing
	  EndWith
	EndProcedure
	
	Procedure.l getColExpand(*this._members)
	  With *this
	    ProcedureReturn \colExpand
	  EndWith
	EndProcedure
	
	Procedure setColExpand(*this._members,colExpand.l)
	  With *this
	    \colExpand = colExpand
	  EndWith
	EndProcedure

	Procedure.l getRowExpand(*this._members)
	  With *this
	    ProcedureReturn \rowExpand
	  EndWith
	EndProcedure
	
	Procedure setRowExpand(*this._members,rowExpand.l)
	  With *this
	    \rowExpand = rowExpand
	  EndWith
	EndProcedure
	
	Procedure spanRows(*this._members,*child,numberRows)
	  With *this
	    If Not FindMapElement(\rowSpan(),Str(*child))
	      AddMapElement(\rowSpan(),Str(*child))
	      \rowSpan() = numberRows
	    EndIf
	  EndWith
	EndProcedure
	
	Procedure spanColums(*this._members,*child,numberColumns)
	  With *this
	    If Not FindMapElement(\colSpan(),Str(*child))
	      AddMapElement(\colSpan(),Str(*child))
	      \colSpan() = numberColumns
	    EndIf
	  EndWith
	EndProcedure


	;}
	
	DataSection
		S_MET:
		Data.i @getColumns()
		Data.i @setColumns()
		Data.i @getColSpacing()
		Data.i @setColSpacing()
		Data.i @getRowSpacing()
		Data.i @setRowSpacing()
		Data.i @getColExpand()
		Data.i @setColExpand()
		Data.i @getRowExpand()
		Data.i @setRowExpand()
		Data.i @spanRows()
		Data.i @spanColums()
		E_MET:
	EndDataSection
EndModule
; IDE Options = PureBasic 5.72 LTS Beta 1 (Windows - x64)
; CursorPosition = 56
; FirstLine = 35
; Folding = ----
; EnableXP