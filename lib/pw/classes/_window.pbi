;{-------------------------------------------
; AUTHOR    : microdev
; DATE      : 2020-03-28
; CLASS     : _window
; VERSION   : 
; PROCESS   : 
;}-------------------------------------------
Module _WINDOW
	;{-------------------------------------------
	; CONSTRUCTOR   : new
  ; PARAMETER     : x,y,w,h -> positions and size off window
  ;                 title.s -> title of window
  ;                 flags   -> flags of window (see purebasic documentation)
	;}-------------------------------------------
	Procedure new(x,y,w,h,title.s,flags)
		Protected *this._members = AllocateStructure(_members)
		With *this
		  \methods = ?S_MET 
		  \posX = x
		  \posY = y
		  \widht = w
		  \height = h
		  \title = title
		  \flags = flags
		  \minWidth = PW::#SIZE_AUTO
		  \minHeight = PW::#SIZE_AUTO
		  \maxWidht = PW::#SIZE_AUTO
		  \maxHeight = PW::#SIZE_AUTO
			ProcedureReturn *this
		EndWith
	EndProcedure
	;{ GETTERS AND SETTERS
	Procedure.l getPosX(*this._members)
	  With *this
	    If IsWindow(\id)
	      ProcedureReturn WindowX(\id)
	    EndIf
	    ProcedureReturn \posX
	  EndWith
	EndProcedure
	
	Procedure setPosX(*this._members,posX.l)
	  With *this
	    If IsWindow(\id)
	      ResizeWindow(\id,posX,#PB_Ignore,#PB_Ignore,#PB_Ignore)
	    Else
	      \posX = posX
	    EndIf
	  EndWith
	EndProcedure
	
	Procedure.l getPosY(*this._members)
	  With *this
	    If IsWindow(\id)
	      ProcedureReturn WindowY(\id)
	    EndIf
	    ProcedureReturn \posY
	  EndWith
	EndProcedure
	
	Procedure setPosY(*this._members,posY.l)
	  With *this
	    If IsWindow(\id)
	      ResizeWindow(\id,#PB_Ignore,posY,#PB_Ignore,#PB_Ignore)
	    Else
	      \posY = posY
	    EndIf
	  EndWith
	EndProcedure
	
	Procedure.l getWidht(*this._members)
	  With *this
	    If IsWindow(\id)
	      ProcedureReturn WindowWidth(\id)
	    EndIf
	    ProcedureReturn \widht
	  EndWith
	EndProcedure
	
	Procedure setWidht(*this._members,widht.l)
	  With *this
	    If IsWindow(\id)
	      ResizeWindow(\id,#PB_Ignore,#PB_Ignore,widht,#PB_Ignore)
	    Else
	     \widht = widht 
	    EndIf
	  EndWith
	EndProcedure

	Procedure.l getHeight(*this._members)
	  With *this
	    If IsWindow(\id)
	      ProcedureReturn WindowHeight(\id)
	    EndIf
	    ProcedureReturn \height
	  EndWith
	EndProcedure
	
	Procedure setHeight(*this._members,height.l)
	  With *this
	    If IsWindow(\id)
	      ResizeWindow(\id,#PB_Ignore,#PB_Ignore,#PB_Ignore,height)
	    Else
	      \height = height
	    EndIf
	  EndWith
	EndProcedure

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

	Procedure.s getTitle(*this._members)
	  With *this
	    If IsWindow(\id)
	      ProcedureReturn GetWindowTitle(\id)
	    EndIf
	    ProcedureReturn \title
	  EndWith
	EndProcedure
	
	Procedure setTitle(*this._members,title.s)
	  With *this
	    If IsWindow(\id)
	      SetWindowTitle(\id,title)
	    Else
	      \title = title
	    EndIf
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
	
	Procedure.l getMaxWidht(*this._members)
	  With *this
	    ProcedureReturn \maxWidht
	  EndWith
	EndProcedure
	
	Procedure setMaxWidht(*this._members,maxWidht.l)
	  With *this
	    \maxWidht = maxWidht
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



	;}
	
	;{ PRIVATE METHODS
	;{-------------------------------------------
	; METHOD     : _close
	; PARAMETERS : 
	; RETURN     : 
	; PROCESS    : 
	;}-------------------------------------------
	Procedure _close()
	  Protected *this._members = GetWindowData(EventWindow())
		With *this
		  CloseWindow(\id)
		  FreeXML(\xml)
		  FreeDialog(\dialog)
		EndWith
	EndProcedure
	
	Procedure _resize()
	  Protected *this._members = GetWindowData(EventWindow())
	  With *this
	    
	  EndWith   
	EndProcedure
	
	Procedure.s makeFlags(*this._members)
	  With *this
	    Protected flags.s
	    If Not \flags
	      ProcedureReturn ""
	    EndIf
	    If \flags & #PB_Window_BorderLess = #PB_Window_BorderLess
	      flags + "#PB_Window_BorderLess"
	    EndIf
	    If \flags & #PB_Window_Invisible = #PB_Window_Invisible
	      If Len(flags):flags+"|":EndIf
	      flags + "#PB_Window_Invisible"
	    EndIf 
	    If \flags & #PB_Window_Maximize = #PB_Window_Maximize
	      If Len(flags):flags+"|":EndIf
	      flags + "#PB_Window_Maximize"
	    EndIf 
	    If \flags & #PB_Window_Minimize = #PB_Window_Minimize
	      If Len(flags):flags+"|":EndIf
	      flags + "#PB_Window_Minimize"
	    EndIf
	    If \flags & #PB_Window_MaximizeGadget = #PB_Window_MaximizeGadget
	      If Len(flags):flags+"|":EndIf
	      flags + "#PB_Window_MaximizeGadget"
	    EndIf
	    If \flags & #PB_Window_MinimizeGadget = #PB_Window_MinimizeGadget
	      If Len(flags):flags+"|":EndIf
	      flags + "#PB_Window_MinimizeGadget"
	    EndIf
	    If \flags & #PB_Window_SizeGadget = #PB_Window_SizeGadget
	      If Len(flags):flags+"|":EndIf
	      flags + "#PB_Window_SizeGadget"
	    EndIf
	    If \flags & #PB_Window_ScreenCentered = #PB_Window_ScreenCentered
	      If Len(flags):flags+"|":EndIf
	      flags + "#PB_Window_ScreenCentered"
	    EndIf
	    If \flags & #PB_Window_WindowCentered = #PB_Window_WindowCentered
	      If Len(flags):flags+"|":EndIf
	      flags + "#PB_Window_WindowCentered"
	    EndIf
	    If \flags & #PB_Window_NoActivate = #PB_Window_NoActivate
	      If Len(flags):flags+"|":EndIf
	      flags + "#PB_Window_NoActivate"
	    EndIf
	    If \flags & #PB_Window_NoGadgets = #PB_Window_NoGadgets
	      If Len(flags):flags+"|":EndIf
	      flags + "#PB_Window_NoGadgets"
	    EndIf
	    If \flags & #PB_Window_TitleBar = #PB_Window_TitleBar
	      If Len(flags):flags+"|":EndIf
	      flags + "#PB_Window_TitleBar"
	    EndIf
	    If \flags & #PB_Window_SystemMenu = #PB_Window_SystemMenu
	      If Len(flags):flags+"|":EndIf
	      flags + "#PB_Window_SystemMenu"
	    EndIf
	    If \flags & #PB_Window_Tool = #PB_Window_Tool
	      If Len(flags):flags+"|":EndIf
	      flags + "#PB_Window_Tool"
	    EndIf
	    ProcedureReturn flags
	  EndWith
	EndProcedure
	
	;}
	
	;{ PUBLIC METHODS
  ;{-------------------------------------------
  ; METHOD     : show
  ; PARAMETERS : 
  ; RETURN     : 
  ; PROCESS    : 
  ;}-------------------------------------------
	Procedure show(*this._members,*mother.PW::Window)
	  With *this
	    Protected xml.s = "<window id = '#PB_Any' name = '"+Str(*this)+"' "
	    If \minWidth = PW::#SIZE_AUTO
	      xml + "minwidth = 'auto' "
	    Else
	      xml + "minwidth = '"+Str(\minWidth)+"' " 
	    EndIf
	    If \maxWidht <> PW::#SIZE_AUTO
	      xml + "maxwidth = '"+Str(\maxWidht)+"' " 
	    EndIf
	    If \minHeight = PW::#SIZE_AUTO
	      xml + "minheight = 'auto' "
	    Else
	      xml + "minheight = '"+Str(\minHeight)+"' " 
	    EndIf
	    If \maxHeight <> PW::#SIZE_AUTO
	      xml + "maxheight = '"+Str(\maxHeight)+"' " 
	    EndIf
	    If Not \flags
	      \flags = #PB_Window_SystemMenu
	    EndIf
	    xml + " text = '"+\title+"' "
	    xml + " flags = '"+makeFlags(*this)+"' >"
	    ; build layout
	    If \layout
	      xml + _BOX::_build(\layout)
	    EndIf
	    xml + "</window>"
	    ;Debug xml
	    \xml = ParseXML(#PB_Any,xml)
	    If Not \xml Or XMLStatus(\xml) <> #PB_XML_Success
	      MessageRequester("PureWindow ERROR","cannot build xml"+Chr(10)+"ERROR : "+XMLError(\xml)+Chr(10)+"LIGNE : "+XMLErrorLine(\xml),#PB_MessageRequester_Error)
	      ProcedureReturn #False
	    EndIf
	    \dialog = CreateDialog(#PB_Any)
	    If Not \dialog
	      MessageRequester("PureWindow ERROR","cannot create dialog",#PB_MessageRequester_Error)
	      ProcedureReturn #False
	    EndIf
		  If Not *mother
		    OpenXMLDialog(\dialog,\xml,Str(*this),\posX,\posY,\widht,\height)
		  Else
		    OpenXMLDialog(\dialog,\xml,Str(*this),\posX,\posY,\widht,\height,WindowID(*mother\getId()))
		  EndIf
		  \id = DialogWindow(\dialog)
		  SetWindowData(\id,*this)
		  ; found all gadgets id
		  If \layout
		    _BOX::_foundID(\layout,*this)
		  EndIf
		  BindEvent(#PB_Event_CloseWindow,@_close(),\id)
		  BindEvent(#PB_Event_SizeWindow,@_resize(),\id)
		EndWith
	EndProcedure
	
	;{-------------------------------------------
	; METHOD     : setLayout
	; PARAMETERS : *layout
	; RETURN     : *layout
	; PROCESS    : set window layout
	;}-------------------------------------------
	Procedure setLayout(*this._members,*layout)
		With *this
		  \layout = *layout
		  ProcedureReturn *layout
		EndWith
	EndProcedure



	;}
  
	DataSection
		S_MET:
		;{ GETTERS AND SETTERS
		Data.i @getPosX()
		Data.i @setPosX()
    Data.i @getPosY()
    Data.i @setPosY()
    Data.i @getWidht()
    Data.i @setWidht()
    Data.i @getHeight()
    Data.i @setHeight()
    Data.i @getFlags()
    Data.i @setFlags()
    Data.i @getTitle()
    Data.i @setTitle()
    Data.i @getId()
    Data.i @getMinWidth()
    Data.i @setMinWidth()
    Data.i @getMinHeight()
    Data.i @setMinHeight()
    Data.i @getMaxWidht()
    Data.i @setMaxWidht()
    Data.i @getMaxHeight()
    Data.i @setMaxHeight()

    ;}
    Data.i @show()
    Data.i @setLayout()
		E_MET:
	EndDataSection
EndModule
; IDE Options = PureBasic 5.72 LTS Beta 1 (Windows - x64)
; CursorPosition = 323
; FirstLine = 302
; Folding = -------
; EnableXP