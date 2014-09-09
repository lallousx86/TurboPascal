Uses totCMDS,totIO1,totIO2,totIO3,totLINK,totSTR,totFAST,totMSG;
Var

  ID        : IntIOOBJ;
  Name      : StringIOOBJ;
  Editor    : WWLinkIOOBJ;
  EditorStr : StrDLLOBJ;
  Phone     : PictureIOOBJ;

  NameLst  : LinkIOOBJ;
  NameLstStr : StrDLLOBJ;

  Checkers : CheckIOOBJ;
  Radios   : RadioIOOBJ;

  BB1,BB2,BB3 : Strip3DIOOBJ;

  Keys    : ControlKeysIOOBJ;
  AltX    : HotKeyIOOBJ;

  Manager : WinFormOBJ;

Procedure InitVars;
Begin;

  With ID Do
  Begin;
    Init(30,3,10);
    SetLabel('Supplier ID:');
    SetValue(1);
    SetActiveStatus(False);
    SetID(1);
  End;

  With Name Do
  Begin;
    Init(30,5,40);
    SetID(2);
    SetLabel('Supplier ~n~ame:');
    SetCase(Proper);
    SetRules(JumpIfFull);
    SetHotKey(totGkAltN);
    SetMessage(30,24,'here input the full suppliers name (max 40 char.)');
  End;

  With Phone Do
  Begin;
    Init(30,7,'(###) ##-######');
    SetID(3);
    SetLabel('Customer ~P~hone Number:');
    SetHotKey(totGkAltP);
    SetRules(JumpIfFull);
    SetMessage(30,24,'here put customer''s phone number');
  End;

  With Editor Do
  Begin;
    With EditorStr Do
    Begin;
      Init;
      EmptyList;
    End;
    Init(15,9,40,4,'Customer ~I~nfo');
    SetID(4);
    SetHotKey(totGkAltI);
    SetIns(True);
    SetMessage(30,24,'here put customer''s ADDRESS,COMPANY,COMMENTS.');
    AssignList(EditorStr,3);
    WrapFull;
  End;


  With NameLst Do
  Begin;
    With NameLstStr Do
    Begin;
      Init;
      Add('Monitor');
      Add('Keyboard');
      Add('Mouse');
      Add('Light Pen');
      Add('Microphone');
      Add('LCD O/H Panel');
      Add('Modem');
      Add('Printer');
      Add('CD Rom');
      Add('Toolkit');
    End;
    Init(4,14,25,6,'Customers ~l~ist');
    SetID(5);
    AssignList(NameLstStr);
    SetHotKey(totGkAltL);
    SetMessage(30,24,'here''s a listing of all available customers');
  End;

  With Radios Do
  Begin;
    Init(32,14,20,3,'Pa~y~ment:');
    SetID(6);
    SetHotKey(totGkAltY);
    SetMessage(30,24,'here put money trading method (cash,credit card)');

    AddItem('Cash',0,True);
    AddItem('Credit Card',0,False);
  End;

  With Checkers Do
  Begin;
    Init(32,18,15,3,'P~u~rpose:');
    SetID(7);
    SetHotKey(totGkAltU);
    SetMessage(24,30,'here specify how they work (buy or sell)');

    AddItem('Buy ',0,True);
    AddItem('Sell',0,True);
  End;

  BB1.Init(10,22,' <<< pre~v~ious ',Stop1);
  BB1.SetHotKey(totGkAltV);

  BB2.Init(30,22,' *** exi~t~ *** ',Finished);
  BB2.SetHotKey(totGkAltT);

  BB3.Init(50,22,' Ne~x~t >>> ',Stop2);
  BB3.SetHotKey(totGkAltX);

  AltX.Init(totGkAltX,Finished);

  With Keys Do
  Begin;
    Init;
    SetKeys(totGkTab,totGkSTab,totGkF10,27);
  End;

End;

Procedure DoneVars;
Begin;
  Keys.Done;
  ID.Done;
  Name.Done;
  Editor.Done;
  EditorStr.Done;
  Phone.Done;
  NameLst.Done;
  NameLstStr.Done;
  Radios.Done;
  Checkers.Done;
  BB1.Done;
  BB2.Done;
  BB3.Done;
  AltX.Done;
End;

Function MyCharHook(Var K:Word;Var X,Y:Byte;Var ID:Word):tAction;
Var
  Msg : MessageOBJ;
  WX1,WY1,WX2,WY2,WStyle : Byte;
Begin;

  Manager.Win^.GetSize(WX1,WY1,WX2,WY2,WStyle);

  If K = totGkF1 Then
    With Msg Do
    Begin;
      Init(6,'Help!');
      AddLine('');
      AddLine('Press Tab to jump to next field');
      AddLine('Press Shift-Tab to jump to previous field');
      AddLine('Press F-10 to Terminate');
      AddLine('and ESC to Abort');
      AddLine('');
      Show;
      Done;
      K := 0;
    End;
  MyCharHook := None;
End;

Function MyLeaveHook(Var LeaveID : Word):tACtion;
Var
  Msg:MessageOBJ;
Begin;
  If LeaveID = 2 Then
    If Length(Name.GetValue) > 10 Then
      With Msg Do
      Begin;
        Init(1,'Error!');
        AddLine('');
        AddLine('Name To Long');
        AddLine('this will be truncated!');
        AddLine('');
        Show;
        Done;
        With Name Do SetValue(Copy(GetValue,1,10));
        MyLeaveHook := Refresh;
        Exit;
      End;

  If LeaveID = 5 Then
    With NameLst Do
    Begin;
      Name.SetValue(GetString(GetValue));
      MyLeaveHook := Refresh;
      Exit;
    End;
  MyLeaveHook := None;
End;

Begin;

  InitVars;
  With Manager Do
  Begin;
    Init;

    Win^.SetTitle('Customers Manager');
    Win^.SetSize(5,1,70,25,2);
    Win^.GrowDraw;
    Win^.Remove;
    Win^.SetClose(False);

    AddItem(Name);
    AddItem(Phone);
    AddItem(Editor);
    AddItem(NameLst);
    AddItem(Radios);
    AddItem(Checkers);
    AddItem(BB1);
    AddItem(BB2);
    AddItem(BB3);
    AddItem(Keys);
    AddItem(ID);
    AddItem(AltX);

    SetActiveItem(2);
    SetCharHook(MyCharHook);
    SetLeaveHook(MyLeaveHook);
    Draw;
    Go;

    Done;
  End;

  DoneVars;
End.
