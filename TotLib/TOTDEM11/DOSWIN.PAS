{$M $2000,$100,$50000}

Uses totWIN,totCMDS,totFAST,totINPUT,easSTR,totIO1,totMSG,totIO2,totIO3,Dos,Crt;

Const
  DWinVer = 'Dos Window v1.0';

Var
  DWin : StretchWINOBJ;

  Cmd : LateralIOOBJ;
  Keys : ControlKeysIOOBJ;
  DownK : HotKeyIOOBJ;

  Manager : WinFormOBJ;

  CurDir,PrevC:String;
  Screen1 : ScreenOBJ;
  WX1,WY1,WX2,WY2,WStyle: Byte;
  K:Word;
  X,Y:Byte;
  Msg:MessageOBJ;

Procedure RefreshProc;Forward;

Procedure DoAbout;
Begin;
  With Msg Do
  Begin;
    Init(2,' About! ');
    AddLine('');
    AddLine('    '+DWinVer+'    ');
    AddLine('          By       ');
    AddLine('    '+PrStr(easEB));
    AddLine('');
    SetOption(' l~ike it huh!',Ord('L'));
    Show;
    Done;
  End;
End;

Procedure CommandPrompt;
Label 1;
Var
  Result : tAction;
Begin;
  CMD.Init(1,1,40,250);
  CMD.SetValue(PrevC);
  CMD.SetID(1);
  CMD.SetIns(True);
  DownK.Init(totGkDown,Stop1);
  Keys.Init;

  Keys.SetKeys(0,0,13,27);

  With Manager Do
  Begin;
    Init;

    Win^.SetSize(20,10,60,12,2);
    Win^.SetTitle('< Enter your command');
    AddItem(Keys);
    AddItem(Cmd);
    SetActiveItem(1);

    Draw;
    Result := Go;
    Win^.Remove;
    DWin.Remove;
    Screen1.Display;
    Screen.CursOn;
    If Result = Escaped Then Goto 1;

    Exec(GetEnv('COMSPEC'),'/C '+Cmd.GetValue);
    1:
    Screen.CursOff;
    Screen1.Save;
    Screen.Clear(7,'°');

    Done;
  End;
  Cmd.Done;
  Keys.Done;
  DownK.Done;
End;

Procedure RefreshProc;
Begin;
  Screen1.SetWinIgnore(True);
  DWin.GetSize(WX1,WY1,WX2,WY2,WStyle);
  Screen1.PartDisplay(WX1,WY1,WX2-2,WY2-2,WX1+1,WY1+1);
  Screen1.SetWinIgnore(False);
End;


Begin;

  Screen1.Init;
  Screen1.Save;
  Screen.CursOff;

  Screen.Clear(7,'°');

  With DWin Do
  Begin;
    Init;

    GetDir(0,CurDir);
    SetTitle('< '+DWinVer+' - ('+Curdir+')');
    SetSize(1,1,80,25,2);
    SetColors(9,7,12,14);

    Draw;
    RefreshProc;
    Repeat
      WinGetKey(K,X,Y);
      If (K = totWGkResize) Or (K = totWGkMove) Then
      Begin;
        RefreshProc;
        Continue;
      End;

      If K = totGkF1 Then
      Begin;
        DoAbout;
        Continue;
      End;

      If K = totWGkRightC Then
      Begin;
        K := 0;
        DWin.GetSize(WX1,WY1,WX2,WY2,WStyle);
        If Not (X In [WX1..WX2]) Or Not (Y In [WY1..WY2]) Then
          Continue;
        Screen.SetWinIgnore(True);
        PrevC := Screen.ReadStr(X,X+(WX2-WX1-X),Y);
        Screen.SetWinIgnore(False);
        If Pos('.',PrevC) > 0 Then PrevC := Copy(PrevC,1,Pos('.',PrevC)-1) Else
          If Pos(' ',PrevC) > 0 Then PrevC := Copy(PrevC,1,Pos(' ',PrevC)-1);
        K := 100;
      End;

      If K In [33..123] Then
      Begin;
        If PrevC ='' Then PrevC := Chr(K);
        Mouse.Hide;
        CommandPrompt;
        GetDir(0,CurDir);
        SetTitle('< '+DWinVer+' By '+PrStr(easEB)+' - ('+Curdir+')');
        Draw;
        RefreshProc;

        Mouse.Reset;
        Mouse.Show;
        PrevC := '';
      End;

    Until (K = 27) Or (K = totWGkClose);

    Done;
  End;
  Screen1.Done;

  Mouse.Hide;
  Screen.Clear(7,' ');
  WriteLn('Thanks For Using ',DWinVer);
  Screen.CursOn;
End.