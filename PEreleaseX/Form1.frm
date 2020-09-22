VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Begin Simulation!!"
      Height          =   495
      Left            =   1440
      TabIndex        =   0
      Top             =   1800
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
  Private Declare Function InitPeaceEngine Lib "PeaceEngine.dll" () As Long
    Private Declare Function peBeginScene Lib "PeaceEngine.dll" () As Long
    Private Declare Function peRender Lib "PeaceEngine.dll" () As Long
    Private Declare Function peShutdown Lib "PeaceEngine.dll" () As Long

    Private Declare Function peInitPhysics Lib "PeaceEngine.dll" () As Long
    Private Declare Function peCreateObj Lib "PeaceEngine.dll" (ByVal objType As Long, ByVal posx As Single, ByVal posy As Single, ByVal posz As Single, ByVal rotx As Single, ByVal roty As Single, ByVal rotz As Single, ByVal angle As Single, ByVal sidex As Single, ByVal sidey As Single, ByVal sidez As Single) As Long
    'Private Declare Function peCreateObj Lib "PeaceEngine.dll" (ByVal objType As Long, ByVal posx As Double, ByVal posy As Double, ByVal posz As Double, ByVal rotx As Double, ByVal roty As Double, ByVal rotz As Double, ByVal angle As Double, ByVal sidex As Double, ByVal sidey As Double, ByVal sidez As Double) As Long
    'Private Declare Function peSetObjPos Lib "PeaceEngine.dll" (posx As Double, posy As Double, posz As Double) As Long
    Private Declare Function peSetObjPos Lib "PeaceEngine.dll" (ByVal posx As Single, ByVal posy As Single, ByVal posz As Single) As Long
    Private Declare Function peSetObjRot Lib "PeaceEngine.dll" (ByVal rotx As Single, ByVal roty As Single, ByVal rotz As Single, ByVal angle As Single) As Long
    Private Declare Function peSetObjSize Lib "PeaceEngine.dll" (ByVal Sizex As Single, ByVal Sizey As Single, ByVal Sizez As Single) As Long
    Private Declare Function peSetObjPosx Lib "PeaceEngine.dll" (ByVal posx As Single) As Long
    Private Declare Function peCreateObjEx Lib "PeaceEngine.dll" (ByVal objType As Integer) As Long

    Private Declare Function peDrawObjs Lib "PeaceEngine.dll" () As Long
    Private Declare Function peDrawGround Lib "PeaceEngine.dll" () As Long
    Private Declare Function peCreateGround Lib "PeaceEngine.dll" () As Long
    
    Private Declare Function peSimulationStep Lib "PeaceEngine.dll" (ByVal Pause As Long) As Long

    Private Declare Function peIsShutdown Lib "PeaceEngine.dll" () As Boolean

    Dim counter As Long
    Dim objcount As Long

Private Sub drop_object()
'peCreateObj CLng(2), CDbl(0), 0, 10.1, Rnd, Rnd, Rnd, Rnd * 360, Rnd * 1, 0.2, 0.2  '# objType = box  , posx , posy , posz , rotx , roty ,  rotz , angle , sidex , sidey , sidez
'Me.Caption = peCreateObj(CLng(2), CDbl(0), CDbl(0), CDbl(10.1), CDbl(Rnd), CDbl(Rnd), CDbl(Rnd), CDbl(Rnd * 360), CDbl(Rnd * 1), CDbl(0.2), CDbl(0.2))    '# objType = box  , posx , posy , posz , rotx , roty ,  rotz , angle , sidex , sidey , sidez
On Error Resume Next

'Me.Caption = peSetObjPos(0.1, 0.2, 0.3)
'Me.Caption = peSetObjPos(0.1, 0.2, 0.3)
Dim x As Integer
    x = peSetObjPos(0.1, 0.1, 10.25)
       x = peSetObjRot(Rnd, Rnd, Rnd, Rnd * 360)
        x = peSetObjSize(Rnd * 1, 0.2, 0.2)
        peCreateObjEx (0)


    counter = 0
    objcount = objcount + 1
End Sub

Private Sub stepSim(n As Integer)
Dim i As Integer
For i = 0 To n - 1
peSimulationStep (0)
Next i
End Sub


Private Sub MainLoop():


    counter = counter + 1
    If counter = 55 Then
    drop_object
    End If
    
    If objcount = 2000 Then
    peShutdown
    End If
        
End Sub

Private Sub Command1_Click()
 On Error Resume Next

        InitPeaceEngine
        peInitPhysics
    peCreateGround
    
   '     peSetObjPosx (1100.1)
        drop_object

        Do While peIsShutdown() = 0
            peBeginScene
            peDrawGround
            
            MainLoop
            peDrawObjs

            peRender
            stepSim 2
        Loop

        peShutdown




End Sub

