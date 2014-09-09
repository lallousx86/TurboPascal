Program DemFV1;

Uses totLIST,totFAST,easStr;

Const
  MaxLines = 650;
  I : Integer = 0;

Var

  S : Array[1..MaxLines] Of String[80];
  BAWin : BrowseArrayOBJ;
  Tx    : Text;

Begin;
  Assign(Tx,ParamStr(1));
  Reset(Tx);
  While (Not EoF(Tx)) Do
  Begin;
    Inc(I);
    ReadLn(Tx,S[I]);
    If I = MaxLines Then  Break;
  End;
  Close(Tx);

  With BAWin Do
  Begin;
    Init;
    Win^.SetTitle('Text File Viewer #1');
    Win^.SetColors(9,7,14,12);
    Win^.SetSize(2,2,79,24,2);
    Win^.SetMinSize(50,15);

    With Screen Do ScrollTOT^.SetScrollChars('','','',#26,'','²');

    AssignList(S,MaxLines,80);
    Win^.GrowDraw;
    Win^.Done;
    Go;
    Done;
  End;
  Screen.CursOn;
End.