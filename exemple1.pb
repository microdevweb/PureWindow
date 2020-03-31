; --------------------------------------------------------------
; PURE_WINDOW
; version 1.0
; EXAMPLE 1
; a simple vertical box 
; --------------------------------------------------------------
XIncludeFile "include/pw/pw.pbi"
Define flags = #PB_Window_ScreenCentered|#PB_Window_SystemMenu|#PB_Window_SizeGadget|#PB_Window_MaximizeGadget
Global.PW::button bt1,bt2,bt3,bt4
Global mainForm.PW::Window = PW::newWindow(0,0,800,600,"Exemple 1",flags)
mainForm\setMinHeight(200)
mainForm\setMinWidth(200)
Global mainLayout.PW::VBox = mainForm\setLayout(PW::newVBox())
Global NewList text.s()




Procedure evButton(*bt.PW::button)
  ChangeCurrentElement(text(),*bt\getData())
  Debug text()
EndProcedure

bt1 = mainLayout\addChild(PW::newButton("Button 1"))
AddElement(text()):text()="I'm the button 1"
bt1\setData(@text())
bt1\bind(@evButton())
bt2 = mainLayout\addChild(PW::newButton("Button 2"))
AddElement(text()):text()="I'm the button 2"
bt2\setData(@text())
bt2\bind(@evButton())
bt3 = mainLayout\addChild(PW::newButton("Button 3"))
AddElement(text()):text()="I'm the button 3"
bt3\setData(@text())
bt3\bind(@evButton())
bt4 = mainLayout\addChild(PW::newButton("Button 4"))
AddElement(text()):text()="I'm the button 4"
bt4\setData(@text())
bt4\bind(@evButton())


PW::Application\run(mainForm)
; IDE Options = PureBasic 5.72 LTS Beta 1 (Windows - x64)
; CursorPosition = 19
; FirstLine = 6
; Folding = -
; EnableXP