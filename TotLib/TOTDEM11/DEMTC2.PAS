Uses totFAST,totCMDS,totIO1,totIO2,totINPUT;

Var
  Bool : RadioIOOBJ;
  Screen1 : ScreenOBJ;
  Result : tAction;
  I : Byte;
Begin;

  Screen1.Init;
  Screen1.Save;

  Screen.Clear(112,'±');
  With Bool Do
  Begin;
    Init(18,6,30,5,'Choose one!');
    For I := 1 To ParamCount Do AddItem(ParamStr(I),0,false);

    SetValue(1);

    Mouse.Show;

    Activate;

    Done;
  End;
  Screen1.SlideDisplay(Vert);
  Screen1.Done;
  Halt(Bool.GetValue);
End.