Uses totFAST,totCMDS,totIO1,totIO2,totINPUT;

Var
  Checkers : Array[1..4] Of CheckIOOBJ;
  Condition : LateralIOOBJ;

  Keys : ControlKeysIOOBJ;
  Manager : FormOBJ;

Procedure InitVars;
Begin;

  Keys.Init;
  With Checkers[1] Do
  Begin;
    Init(7,5,30,5,'~C~ode Generation');
    SetHotKey(totGkAltC);

    AddItem('~F~orce Far Calls',totGkAltF,True);
    AddItem('~O~verlays Allowed',totGkAltO,False);
    AddItem('~W~ord align data',totGkAltA,False);
  End;

  With Checkers[2] Do
  Begin;
    Init(37,6,30,5,'');

    AddItem('~2~86 instruction',0,True);
    AddItem('Sma~r~t call Back',0,False);
    AddItem('~W~indow Stack frame',0,False);
  End;

  With Checkers[3] Do
  Begin;
    Init(7,11,30,5,'Runt~i~me errors');
    SetHotKey(totGkAltI);

    AddItem('Range Checking',0,True);
    AddItem('Stack Checking',0,True);
    AddItem('I/~O~ Checking',0,False);
    AddItem('OverFlow Checking',0,True);
  End;

  With Checkers[4] Do
  Begin;
    Init(42,11,25,4,'Debu~g~ging options');
    SetHotKey(totGkAltG);

    AddItem('~D~ebug information',0,True);
    AddItem('~L~ocal symboles',0,True);
    AddItem('S~y~mbole information',0,True);
  End;

  With Condition Do
  Begin;
    Init(27,19,40,70);
    SetLabel('Co~n~ditional defines:');
    SetHotKey(totGkAltN);
  End;
End;

Procedure DisposeVars;
Begin;
  Keys.Done;
  Checkers[1].Done;
  Checkers[2].Done;
  Checkers[3].Done;
  Checkers[4].Done;
  Condition.Done;
End;

Var
  Screen1 : ScreenOBJ;
Begin;

  Screen1.Init;
  Screen1.Save;

  Key.SetFAST;
  Screen.Clear(7,' ');
  Screen.TitledBox(4,3,70,20,9,12,14,2,'Compiler Options');
  InitVars;

  With Manager Do
  Begin;

    Init;

    AddItem(Checkers[1]);
    AddItem(Checkers[2]);
    AddItem(Checkers[3]);
    AddItem(Checkers[4]);
    AddItem(Condition);
    AddItem(Keys);

    Go;
    Done;

  End;

  Screen1.SlideDisplay(Horiz);
  Screen1.Done;

  Screen.Clear(7,' ');

  WriteLn('Force Far Calls = ',Checkers[1].GetValue(1) );
  WriteLn('Overlays Allowed =',Checkers[1].GetValue(2) );
  WriteLn('Word align data =',Checkers[1].GetValue(3) );

  WriteLn('286 instruction =',Checkers[2].GetValue(1));
  WriteLn('Smart call Back =',Checkers[2].GetValue(2));
  WriteLn('Window Stack frame =',Checkers[2].GetValue(3));

  WriteLn('Range Checking',Checkers[3].GetValue(1));
  WriteLn('Stack Checking',Checkers[3].GetValue(2));
  WriteLn('I/O Checking',Checkers[3].GetValue(3));
  WriteLn('OverFlow Checking',Checkers[3].GetValue(4));

  WriteLn('Debug information',Checkers[4].GetValue(1));
  WriteLn('Local symboles',Checkers[4].GetValue(2));
  WriteLn('Symbole information',Checkers[4].GetValue(3));


  WriteLn('Conditional defines:',Condition.GetValue);

  DisposeVars;

End.