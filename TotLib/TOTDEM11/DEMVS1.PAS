Program DemoVirtualOne;

Uses CRT, totFast;

Var
  Screen1,
  Screen2,
  Screen3 : ScreenObj;   {screen objects}
  HeadCol,
  MsgCol,
  NormCol : Byte;

Procedure Pause;
 Var
   CH : Char;
 Begin
   CH := ReadKey;
 End; {of proc pause}

 Procedure Initialize;
  Begin
    Screen1.Init;
    Screen2.Init;
    Screen3.Init;
    HeadCol := CAttr(Yellow,Blue);
    MsgCol  := CAttr(Yellow,Red);
    NormCol := CAttr(White,Blue);
  End; {proc Initialize}


 Procedure IntroScreen;
  Const
    Tab = 8;
  Begin
    HeadCol := CAttr(Yellow,Blue);
    MsgCol  := CAttr(Yellow,Red);
    NormCol := CAttr(White,Blue);
    With Screen Do {manipulate the visible screen}
    Begin
      Clear(NormCol,' ');
      WriteCenter(1,HeadCol,'TechnoJock''s Object Toolkit');
      WritePlain(Tab,18,'the display.');
      WriteRight(80,25,MsgCol,'Press any key To Continue ....');
    End;
  End; {of proc IntroScreen}

 Procedure BuildScreen2;
  Const
    Tab = 8; Tab1 = 10;
  Begin
    HeadCol := CAttr(Yellow,Red);
    MsgCol  := CAttr(Yellow,Red);
    NormCol := CAttr(White,Red);
    With Screen2 Do
    Begin
      Create(80,25,NormCol);
      WriteCenter(1,HeadCol,'Screen Writing');
      WritePlain(Tab,6,'methods, including the following:');
      GotoXY(57,23);
    End;
  End; {of proc BuildScreen2}

  Procedure BuildScreen3;

  Const
    Tab = 8;
  Begin
    HeadCol := CAttr(Yellow,Blue);
    MsgCol  := CAttr(Yellow,Red);
    NormCol := CAttr(White,Blue);
    With Screen3 Do
    Begin

      Create(80,25,NormCol);
      TitledBox(1,1,80,25,NormCol,HeadCol,NormCol,4,'|Box drawing');
      CursOff;
    End;
  End; {of proc BuildScreen3}

  Begin
    Initialize;
    IntroScreen;
    BuildScreen2;
    BuildScreen3;
    Pause;
    Screen1.Save;
    Screen2.SlideDisplay(Horiz);
    Pause;
    Screen3.SlideDisplay(Vert);
    Pause;
    With Screen Do
    Begin
      SmartHorizLine(1,80,14,White,1);
      SmartVertLine(35,8,19,White,2);
      SmartVertLine(64,10,19,White,2);
      WriteCenter(25,Cattr(Black,White),'That''s all Folks!');
    End;
    Pause;
    Screen1.Done;
    Screen2.Done;
    Screen3.Done;
    ClrScr;
    Screen.CursOn;
  End.
