program DemoWindowFour;
{DEMWI4 - a StretchWinOBJ template}
{$I totflags.inc}
{$I totcmds.inc}
Uses DOS,CRT,
     totFAST, totINPUT, totWIN,totLOOK;

var
  MyWindow: StretchWinOBJ;
  K: word;
  X,Y: byte;

procedure ScreenRefreshProc;
{This procedure would refresh the screen contents}
begin
   Screen.WritePlain(1,1,'Fresh Screen');
   {...}
   MyWindow.DrawHorizBar(1,100); {the parameters should reflect}
   MyWindow.DrawVertBar(1,100);  {the data position of the window}
end;

procedure ScrollUpProc;
begin
end;

procedure ScrollDownProc;
begin
Screen.WritePlain(2,2,'Scroll''n Down!');
end;

procedure ScrollLeftProc;
begin
end;

procedure ScrollRightProc;
begin
end;

procedure ScrollJumpVertProc(X,Y:byte);
begin
end;

procedure ScrollJumpHorizProc(X,Y:byte);
begin
end;

begin
   Screen.Clear(white,'°'); {paint the screen}
   LookTOT^.SetWindow(9,7,14,5);
   with MyWindow do
   begin
      Init;
      SetTitle(' Template ');
      SetBoundary(1,1,80,25);
      SetScrollable(true,true);
      Draw;
      ScreenRefreshProc;
      Repeat
         WinGetKey(K,X,Y);
         case K of
         602: ScreenRefreshProc;
         610: ScrollUpProc;
         611: ScrollDownProc;
         612: ScrollLeftProc;
         613: ScrollRightProc;
         614: ScrollJumpVertProc(X,Y);
         615: ScrollJumpHorizProc(X,Y);
         else Screen.WritePlain(2,2,'                    ');
         end;
      until (K=27) or (K=600);
      Done;
   end;
end.
