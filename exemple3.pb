; --------------------------------------------------------------
; PURE_WINDOW
; version 1.0
; EXAMPLE 3 
; a fic customer 
; --------------------------------------------------------------
XIncludeFile "include/pw/pw.pbi"
Define flags = #PB_Window_ScreenCentered|#PB_Window_SystemMenu|#PB_Window_SizeGadget|#PB_Window_MaximizeGadget
Global.PW::button btValide,btCancel
Global.PW::HBox btLayout
Global.PW::VBox fielLayout,mainLayout
Global.PW::stringGadget stFName,stSName,stAddress
Global mainForm.PW::Window = PW::newWindow(0,0,320,20,"Exemple 3",flags)
LoadFont(0,"Arial",11,#PB_Font_HighQuality)

Procedure init()
  SetActiveGadget(stFName\getId())
EndProcedure

SetGadgetFont(#PB_Default,FontID(0))
mainLayout = mainForm\setLayout(PW::newVBox())
mainLayout\setExpand(1) ; expand field layout
fielLayout = mainLayout\addChild(PW::newVBox())
btLayout = mainLayout\addChild(PW::newHBox())
btLayout\setExpand(PW::#EXPAND_NO)
btLayout\setAlign(PW::#ALIGN_RIGHT)
stFName = fielLayout\addChild(PW::newStringGadget())
stFName\setHeight(30)
stFName\setLabel("First name")
stSName = fielLayout\addChild(PW::newStringGadget())
stSName\setHeight(30)
stSName\setLabel("Last name")

stAddress = fielLayout\addChild(PW::newStringGadget())
stAddress\setHeight(30)
stAddress\setLabel("Address")
btValide = btLayout\addChild(PW::newButton("Validate"))
btValide\setWidth(90)
btValide\setHeight(25)
btCancel = btLayout\addChild(PW::newButton("Cancel"))
btCancel\setWidth(90)
btCancel\setHeight(25)

PW::Application\setInitiation(@init())
PW::Application\run(mainForm)
; IDE Options = PureBasic 5.72 LTS Beta 1 (Windows - x64)
; CursorPosition = 13
; FirstLine = 9
; Folding = -
; EnableXP