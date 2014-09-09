Uses totFAST,totWIN,totLINK,totLIST,totLOOK,Dos;

Var
  StrDLL : StrDLLOBJ;
  LLO    : ListLinkOBJ;
  SR     : SearchRec;
  I      : LongInt;

Function StatusHook(ThePick : LongInt):String;Far;
 Var
   S,A: String;
 Begin;

   GetDir(0,A);
   If A[Length(A)] = '\' Then Dec(A[0]);
   With StrDLL Do S := GetStr(NodePtr(ThePick),0,0);

   S := A + '\' + S;

   If LLO.GetStatus(ThePick,1) Then A := 'Current Directory: ' Else
     A := 'Current File: ';
   StatusHook := A + S;

End;

Begin;

  StrDLL.Init;

  FindFirst('*.*',AnyFile - VolumeID,Sr);
  While DosError = 0 Do
  Begin;
    StrDll.Add(Sr.Name);
    FindNext(Sr);
  End;

  With LLO Do
  Begin;
    Init;
    AssignList(StrDLL);
    SetTagging(True);
    SetColors(CAttr(7,1),7,13);
    SetDualColors(True);
    SetMsgHook(StatusHook);
    SetMsgState(True);
    SetColWidth(20);

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
