; --------------------------------------------------------------
; PURE_WINDOW
; version 1.0
; EXAMPLE 4 
; a fic customer 
; --------------------------------------------------------------
XIncludeFile "include/pw/pw.pbi"
Define flags = #PB_Window_ScreenCentered|#PB_Window_SystemMenu|#PB_Window_SizeGadget|#PB_Window_MaximizeGadget
Global Dim bt.PW::button(12)
Global.PW::GridBox grid
Global mainForm.PW::Window = PW::newWindow(0,0,320,20,"Exemple 4",flags)
grid = mainForm\setLayout(PW::newGridBox(6))
For i = 0 To 11
  bt(i) = grid\addChild(PW::newButton("Button "+Str(i+1)))
  If i = 2
    grid\spanColums(bt(i),3)
  EndIf
  If i = 4
    grid\spanRows(bt(i),2)
  EndIf
Next
PW::Application\run(mainForm)
; IDE Options = PureBasic 5.72 LTS Beta 1 (Windows - x64)
; CursorPosition = 18
; EnableXP