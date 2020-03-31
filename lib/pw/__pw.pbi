;{-------------------------------------------
; AUTHOR    : microdev
; DATE      : 2020-03-28
; MODULE    : __pw
; VERSION   : 
; PROCESS   : constructors
;}-------------------------------------------
DeclareModule _WINDOW
	Structure _members
	  *methods
	  id.l
	  xml.l
	  dialog.l
	  posX.l
	  posY.l
	  widht.l
	  height.l
	  minWidth.l
	  maxWidht.l
	  minHeight.l
	  maxHeight.l
	  flags.l
	  title.s
	  *layout
	EndStructure
	
	Declare new(x,y,w,h,title.s,flags)
EndDeclareModule

DeclareModule _CHILD
	Structure _members
	  *methods
	  gadget.b
	  order.s
	EndStructure
	
	Declare _getMethodsSize()
	Declare _getMethods()
EndDeclareModule

DeclareModule _BOX
  Prototype.s build(*this)
  Structure _members Extends _CHILD::_members
    id.l
	  List *myChildren._CHILD::_members()
	  *_build.build
	  spacing.l
	  expand.l
	  align.l
	EndStructure
	Declare _super(*this._members,*s_daughter,*E_daughter)
	Macro super()
		_BOX::_super(*this,?S_MET,?E_MET)
	EndMacro
	Declare new()
	Declare.s _build(*this._members)
	Declare _foundID(*this._members,*win._WINDOW::_members)
EndDeclareModule

DeclareModule _VBOX
	Structure _members Extends _BOX::_members
		
	EndStructure
	Declare new()
EndDeclareModule

DeclareModule _HBOX
	Structure _members Extends _BOX::_members
		
	EndStructure
	Declare new()
EndDeclareModule

DeclareModule _GRIDBOX
	Structure _members Extends _BOX::_members
	  columns.l
	  colSpacing.l
	  rowSpacing.l
	  colExpand.l
	  rowExpand.l
	  Map colSpan.l()
	  Map rowSpan.l()
	EndStructure
	Declare new(columns)
EndDeclareModule

DeclareModule _GADGET
  Prototype.s build(*this)
  Prototype callback(*this)
	Structure _members Extends _CHILD::_members
	  id.l
	  *data
	  flags.l
	  *_build.build
	  width.l
	  height.l
	  minWidth.l
	  maxWidth.l
	  minHeight.l
	  maxHeight.l
	  *callback.callback
	  label.s
	EndStructure
	Declare _super(*this._members,*s_daughter,*E_daughter)
	Macro super()
		_GADGET::_super(*this,?S_MET,?E_MET)
	EndMacro
	Declare.s _build(*this._members)
	Declare _foundID(*this._members,*win._WINDOW::_members)
	Declare.s _setSize(*this._members)
EndDeclareModule

DeclareModule _BUTTON
	Structure _members Extends _GADGET::_members
		title.s
	EndStructure
	Declare new(title.s,flags = 0)
EndDeclareModule

DeclareModule _STRING 
	Structure _members Extends _GADGET::_members
    value.s
	EndStructure
	Declare _super(*this._members,*s_daughter,*E_daughter)
	Macro super()
		_STRING::_super(*this,?S_MET,?E_MET)
	EndMacro
	Declare new(value.s = "",flags = 0)
EndDeclareModule

DeclareModule _APPLICATION
  Prototype initiation()
	Structure _members
	  *methods
	  *window.PW::Window
	  *initiation.initiation
	EndStructure
	Declare new()
EndDeclareModule

Module PW
  PW::Application = _APPLICATION::new()
  Procedure newWindow(x,y,width,height,title.s,flags = 0)
    ProcedureReturn _WINDOW::new(x,y,width,height,title.s,flags)
  EndProcedure
  Procedure newVBox()
    ProcedureReturn _VBOX::new()
  EndProcedure
  Procedure newHBox()
    ProcedureReturn _HBOX::new()
  EndProcedure
  Procedure newGridBox(columns)
    ProcedureReturn _GRIDBOX::new(columns)
  EndProcedure
  Procedure newButton(label.s,flags = 0)
    ProcedureReturn _BUTTON::new(label,flags)
  EndProcedure
  Procedure newStringGadget(value.s = "",flags = 0)
    ProcedureReturn _STRING::new(value,flags)
  EndProcedure
EndModule

XIncludeFile "classes/_window.pbi"
XIncludeFile "classes/_child.pbi"
XIncludeFile "classes/_box.pbi"
XIncludeFile "classes/_application.pbi"
XIncludeFile "classes/_vbox.pbi"
XIncludeFile "classes/_hbox.pbi"
XIncludeFile "classes/_gadget.pbi"
XIncludeFile "classes/_button.pbi"
XIncludeFile "classes/_string.pbi"
XIncludeFile "classes/_gridbox.pbi"

; IDE Options = PureBasic 5.72 LTS Beta 1 (Windows - x64)
; CursorPosition = 81
; FirstLine = 38
; Folding = 9-----
; EnableXP