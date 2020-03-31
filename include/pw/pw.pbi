;{-------------------------------------------
; AUTHOR    : microdev
; DATE      : 2020-03-28
; MODULE    : PW
; VERSION   : 1.0
; PROCESS   : 
;}-------------------------------------------
XIncludeFile "../../lib/pw/_pw.pbi"
DeclareModule PW
  #SIZE_AUTO = 0
  #EXPAND_YES = -2
  #EXPAND_NO = -3
  #EXPAND_EQUAL = -1
  Enumeration 
    #ALIGN_LEFT 
    #ALIGN_RIGHT
    #ALIGN_TOP
    #ALIGN_BOTTOM
    #ALIGN_CENTER
  EndEnumeration
  ; Abstract class : _child
  ; inherit of     : none
  Interface _child
    
  EndInterface
  ; Abstract class : _box
  ; inherit of     : _child
  Interface _box Extends _child
    getSpacing()
		setSpacing(spacing)
		getExpand()
		setExpand(expand)
		getAlign()
		setAlign(alignement)
    addChild(child)
  EndInterface
  ; Public class : VLayout
  ; inherit of   : layout 
  Interface VBox Extends _box
    
  EndInterface
  ; Public class : VLayout
  ; inherit of   : layout 
  Interface HBox Extends _box
    
  EndInterface
  ; Public class : VLayout
  ; inherit of   : layout 
  Interface GridBox Extends _box
    getColumns()
		setColumns(columns)
		getColSpacing()
		setColSpacing(spacing)
		getRowSpacing()
		setRowSpacing(spacing)
		getColExpand()
		setColExpand(expand)
		getRowExpand()
		setRowExpand(expand)
		spanRows(child,numberRows)
		spanColums(child,numberColumns)
  EndInterface  
  ; Abstract class : _layout
  ; inherit of     : _child
  Interface _gadget Extends _child
    getFlags()
    setFlags(flags)
    getWidth()
		setWidth(width)
		getHeight()
		setHeight(height)
		getData()
		setData(yourdata)
		getId()
		getMinWidth()
		setMinWidth(minWidth)
		getMaxWidth()
		setMaxWidth(maxWidth)
		getMinHeight()
		setMinHeight(minHeight)
		getMaxHeight()
		setMaxHeight(maxHeight)
		getLabel.s()
		setLabel(label.s)

		bind(callback)
	EndInterface
	; Public class : button
  ; inherit of   : _gadget 
	Interface button Extends _gadget
	  getTitle.s()
		setTitle(title.s)
	EndInterface
	; Public class : stringGadget
  ; inherit of   : _gadget 
	Interface stringGadget Extends _gadget
	  
	EndInterface
  ; class       : Window
  ; inherit of  : none 
  Interface Window
    getPosX()
		setPosX(posX)
    getPosY()
    setPosY(posY)
    getWidht()
    setWidht(width)
    getHeight()
    setHeight(height)
    getFlags()
    setFlags(flags)
    getTitle()
    setTitle(title.s)
    getId()
    getMinWidth()
    setMinWidth(minWidth)
    getMinHeight()
    setMinHeight(minHeight)
    getMaxWidht()
    setMaxWidht(maxWidth)
    getMaxHeight()
    setMaxHeight(maxHeight)
    show()
    setLayout(layout)
  EndInterface
  Interface Application
    setInitiation(callback)
    run(window)
  EndInterface
  
  Declare newWindow(x,y,width,height,title.s,flags = 0)
  Declare newVBox()
  Declare newHBox()
  Declare newGridBox(columns)
  Declare newButton(title.s,flags = 0)
  Declare newStringGadget(value.s = "",flags = 0)
  Application.Application
EndDeclareModule
XIncludeFile "../../lib/pw/__pw.pbi"


; IDE Options = PureBasic 5.72 LTS Beta 1 (Windows - x64)
; CursorPosition = 139
; FirstLine = 33
; Folding = iB-
; EnableXP