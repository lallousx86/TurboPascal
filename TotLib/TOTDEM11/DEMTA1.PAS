Uses totFAST,totINPUT,totWIN,totLOOK,Crt,totCMDS;

Var
  K: Word;
  X,Y : Byte;
  W : StretchWinOBJ;

 {$F+}
Procedure RefreshProc;
Var
   WX1,WY1,WX2,WY2,WStyle : Byte;
   T : Byte;
Begin;
    W.GetSize(WX1,WY1,WX2,WY2,WStyle);
    T := W.GetBodyAttr;
    T := W.GetBorderAttr;
    T := W.GetTitleAttr;

    GotoXy(1,1);
    Screen.WriteLn('Inserts the specified text into the module');
    Screen.WriteLn('description entry in the header of an EXE file');
    Screen.WriteLn('or DLL.');
    Screen.WriteLn('Because of speed and code size, only');
    Screen.WriteLn('operations on variables of type real are');
    Screen.WriteLn('allowed in this state.');
    Screen.WriteLn('');
    Screen.WriteLn('Attempt to compile statements that operate on');
    Screen.WriteLn('Single, Double, Extended, and Comp types');
    Screen.WriteLn('generate an error.');
End;
 {$F-}

Begin;


  LookTOT^.SetWindow(10,7,14,12);
  ScrollTOT^.SetScrollChars('','','',#26,'','²');

  With W Do
  Begin;
    Init;


    SetAllowMove(True);
    SetAllowStretch(True);
    SetClose(True);
    SetRemove(true);

    SetScrollAble(True,True);
    SetBoundary(1,2,80,25);
    SetSize(15,7,70,22,2);
    SetTitle('Window Demo 1');
    GrowDraw;
    DrawHorizBar(51,100);
    DrawVertBar(71,100);

    RefreshProc;

    Repeat
      WinGetKey(K,X,Y);

      If K = totGkUp then GotoXy(WhereX,WhereY-1);
      If K = totGkDown then GotoXy(WhereX,WhereY+1);
      If K = totGkRight then GotoXy(WhereX+1,WhereY);
      If K = totGkLeft then GotoXy(WhereX-1,WhereY);
      If K = totGkAup Then GotoXy(GetX,GetY);
      If K = totWGkResize Then RefreshProc;

    Until (K = totWGkClose) Or (K = totGkEsc);

    Done;

  End;

End.
