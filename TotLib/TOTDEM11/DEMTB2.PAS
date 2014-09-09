Uses totFAST,totLINK,totLIST,totLOOK,totCMDS,totMSG,Dos;

 Type MyListLInkOBJ = Object(ListLinkOBJ)

   Constructor  Init;

   Function     MessageTask(ThePick:LongInt):String;Virtual;
   Function     CharTask(Var K:Word;Var X,Y:Byte;ThePick:LongInt):tListAction;Virtual;

   Destructor   Done;Virtual;
 End;

 Var
   MyLLO : MyListLinkOBJ;
   StrDLL: StrDLLOBJ;
   SR     : SearchRec;
   I      : LongInt;


 Constructor MyListLinkOBJ.Init;
Begin;
  ListLinkOBJ.Init;
End;

Function MyListLinkOBJ.MessageTask;
Var
  S,A: String;
Begin;
  GetDir(0,A);
  If A[Length(A)] = '\' Then Dec(A[0]);
  With StrDLL Do S := GetStr(NodePtr(ThePick),0,0);

  S := A + '\' + S;

  If MyLLO.GetStatus(ThePick,1) Then A := 'Current Directory: ' Else
    A := 'Current File: ';

  MessageTask := A + S;
End;

Function  MyListLinkOBJ.CharTask;
Var
  M : ButtonMessageOBJ;

Begin;

  CharTask := tListAction(None);


  If K = totGkF1 Then
    With M Do
    Begin;
      Init(1,'Help!');
      AddLine('');
      AddLine('Sorry No Help Available!');
      AddLine('');
      Show;
      Done;
    End;
  If K = totGkAltD Then
    With StrDll Do
    Begin;
      DelNode(NodePtr(ThePick));
      MyLLO.AssignList(StrDLL);
      CharTask := Refresh;
    End;

  If K = totGkAltA Then
  Begin;
    MyListLinkOBJ.Win^.SetAllowStretch(True);
    With StrDLL Do For I :=1 To TotalNodes Do SetStatus(I,0,Not GetStatus(I,0));
    CharTask := Refresh;
  End;

End;

Destructor MyListLinkOBJ.Done;
Begin;
  ListLinkOBJ.Done;
End;

Begin;

  StrDLL.Init;

  FindFirst('*.*',AnyFile - VolumeID,Sr);
  While DosError = 0 Do
  Begin;
    StrDll.Add(Sr.Name);
    FindNext(Sr);
  End;

  With MyLLO Do
  Begin;
    Init;
    AssignList(StrDLL);
    SetTagging(True);
    SetColors(CAttr(7,1),7,13);
    SetDualColors(True);
    SetColWidth(20);
    SetMsgState(True);

    Win^.SetTitle('Directory Search #1');
    Win^.SetSize(5,5,60,20,2);
    Win^.SetColors(9,7,12,14);
    Win^.SetAllowStretch(False);

    With ScrollTOT^ Do SetScrollChars('','','',#26,'þ','±');
    With LookTOT^   Do SetListChars('','','*',' ');

    I := 0;
    FindFirst('*.*',AnyFile - VolumeID,Sr);
    While DosError = 0 Do
    Begin;
      Inc(I);
      If ((Sr.Attr And Directory)=Directory) Then SetStatus(I,1,True);
      FindNext(Sr);
    End;

    Win^.GrowDraw;
    Win^.Remove;

    Go;
    Remove;

    With StrDLL Do
      For I := 1 To TotalNodes Do
        If GetStatus(I,0) Then WriteLn('selected:',GetStr(NodePtr(I),0,0));
    Done;
  End;
  StrDLL.Done;
  Screen.CursOn;

End.
