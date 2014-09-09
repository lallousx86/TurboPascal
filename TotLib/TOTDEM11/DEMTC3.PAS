Uses totCMDS,totIO1,totIO2,totIO3,totLINK,Dos,Crt;

Var
  LIOStr : StrDLLOBJ;
  LIO    : LinkIOOBJ;
  LineEdit : LateralIOOBJ;
  Sr     : SearchRec;
  Editor : WWLinkIOOBJ;
  EditorStr:StrDLLOBJ;
  Keys : ControlKeysIOOBJ;
  OKB,CancelB,NextB,PrevB,HaltB : Strip3DIOOBJ;
  Result : tAction;
  Manager : FormOBJ;
  I       : LongInt;

Procedure InitVars;
Begin;

  Keys.Init;

  With LIO Do
  Begin;

    With LIOStr Do
    Begin;
      Init;
      FindFirst('*.*',AnyFile,Sr);
      While DosError = 0 Do
      Begin;
        Add(Sr.Name);
        FindNext(Sr);
      End;
    End;

    Init(9,6,20,8,'~F~iles list');
    AssignList(LIOStr);
    SetHotKey(totGkAltF);
  End;

  With Editor Do
  Begin;
    With EditorStr Do
    Begin;
      Init;
      Add('X is any variable, or a procedure or function ');
      Add('identifier. The result is a pointer that ');
      Add('points to X. Like nil, the result of Addr is ');
      Add('assignment compatible with all pointer types. ');
    End;
    Init(40,6,40,9,'~R~emarks');
    AssignList(EditorStr,5);
    SetHotKey(totGkAltR);
    SetAllowEdit(True);
    SetIns(True);
    SetEndKey(totGkF10);
    WrapFull;
  End;

  With LineEdit Do
  Begin;
    Init(15,3,20,100);
    SetLabel('~L~ine Editor:');
    SetHotKey(totGkAltL);
    SetDispChar('*');
    SetPadChar('_');
  End;
  OkB.Init(15,19,' ~O~k ',tAction(Finished));
  OkB.SetHotKey(totGkAltO);

  HaltB.Init(25,19,' ~H~alt ',tAction(Stop3));
  HaltB.SetHotKey(totGkAltH);

  CancelB.Init(40,19,' ~A~bort ',tAction(Escaped));
  CancelB.SetHotKey(totGkAltA);

  NextB.Init(50,19,' ~N~ext ',tAction(Stop1));
  NextB.SetHotKey(totGkAltN);

  PrevB.Init(70,19,' ~P~revious ',tAction(Stop2));
  PrevB.SetHotKey(totGkAltP);

End;

Procedure DoneVars;
Begin;
  LIO.Done;
  LIOStr.Done;
  Keys.Done;
  Editor.Done;
  EditorStr.Done;
  LineEdit.Done;
  OkB.Done;
  CancelB.Done;
  NextB.Done;
  PrevB.Done;
  HaltB.Done;
End;

Begin;

  TextAttr := 7; ClrScr;

  InitVars;
  With Manager Do
  Begin;
    Init;

    AddItem(Keys);
    AddItem(LIO);
    AddItem(Editor);
    AddItem(LineEdit);
    AddItem(OkB);
    AddItem(HaltB);
    AddItem(CancelB);
    AddItem(NextB);
    AddItem(PrevB);

    Result := Go;
    Done;
  End;

  ClrScr;
  If Not (Result = Escaped) Then
  Begin;
    For I := 1 To 5 Do
      With EditorStr Do
        WriteLn('Line #',I,'=  ',GetStr(NodePtr(I),0,0));
    WriteLn;
    WriteLn('LineEdit = ',LineEdit.GetValue);
    WriteLn;
    With LIO Do WriteLn('LinkIOOBJ = ',GetString(GetValue));
  End;

  DoneVars;
End.