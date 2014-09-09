program DemoDirFour;
{demls4 - a user sortable directory listing}

Uses DOS, CRT,
     totFAST, totLIST;

Var
   ListWin:  ListDirSortObj;

begin
   Screen.Clear(white,'°'); {paint the screen}
   Screen.WriteCenter(25,white,' Press S or Right Mouse Button for Sort Options ');
   with ListWin do
   begin
      Init;
      ReadFiles('*.*',AnyFile);
      Go;
      Done;
   end;
end.
