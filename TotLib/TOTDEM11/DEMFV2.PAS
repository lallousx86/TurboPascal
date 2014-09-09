Program DemFV2;

Uses totLIST,totLINK,totFAST;

Const
  I : LongInt = 0;
  Max = 5000;
Var
  StrDll : StrDLLOBJ;
  BLWin  : BrowseLinkOBJ;
  Tx     : Text;
  S      : String[80];

Begin;

  StrDll.Init;

  Assign(Tx,ParamStr(1));
  Reset(Tx);

  While (Not EoF(Tx)) Do
  Begin;
    Inc(I);
    ReadLn(Tx,S);
    StrDll.Add(S);
    If I = Max Then Break;
  End;
  Close(Tx);

  With BLWin Do
  Begin;
    Init;
    AssignList(StrDll);

    Win^.SetTitle('Text File Viewer #2');
    Win^.SetColors(9,7,14,12);
    Win^.SetSize(2,2,79,24,2);
    Win^.SetMinSize(50,15);

    Win^.GrowDraw;
    Win^.Done;

    Go;
    Done;
  End;
  Screen.CursOn;
End.