Unit totQCK;

Interface

Function      totStrInputBox(ATitle,ALabel,AInitVal:String;ALen:Byte):String;

Procedure     DSound(S,D:Word);
Procedure     totMSGBOX1(Tit,Opt,Line1,Line2:String);

Implementation


Uses  totIO1,totIO2,totMSG,totFAST,Crt;

Var
  QForm     : WinFormOBJ;
  QInp      : LateralIOOBJ;
  QKeys     : ControlKeysIOOBJ;
  QEnterKey : HotKeyIOOBJ;
  QI        : LongInt;

Procedure totMSGBOX1;
Var
  Msg:MessageOBJ;
Begin;
  With Msg Do
  Begin;
    Init(1,Tit);
    AddLine('');
    AddLine(Line1);
    AddLine(Line2);
    AddLine('');
    If Opt <> '' Then SetOption(Opt,0);
    Show;
    Done;
  End;
End;

Function  totStrInputBox(ATitle,ALabel,AInitVal:String;ALen:Byte):String;
Begin;
  QI := Byte(ALabel[0])+5;
  With QInp Do
  Begin;
    Init(Byte(QI),3,30,ALen);
    SetLabel(ALabel);
    SetValue(AInitVal);
  End;
  QKeys.Init;
  QEnterKey.Init(13,Finished);

  With QForm Do
  Begin;
    Init;
    Win^.SetSize(20,10,65,15,2);
    Win^.SetTitle(ATitle);
    Win^.SetClose(False);

    AddItem(QInp);
    AddItem(QKeys);
    AddItem(QEnterKey);

    Draw;
    If Go = Finished Then
      totStrInputBox := QInp.GetValue
    Else
      totStrInputBox := '-1';

    Done;
  End;
  QInp.Done;
  QKeys.Done;
  QEnterKey.Done;
End;

Procedure DSound(S,D:Word);
Begin;
  Sound(S);
  Delay(D);
  NoSound;
End;

End.