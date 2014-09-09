type
    tt1 = array[1..8] of Char;
Var
   c : tt1;
   f : file of tt1;
   o : file of tt1;
Begin;

  Assign(f,'f.fnt');
  Assign(o,'f1.fnt');
  Reset(f);
  Rewrite(o);

  Repeat
  Read(f,c);
  Write(o,c);
  FillChar(c,sizeof(c),#0);
  Write(o,c);
  Until Eof(f);

  Close(f);
  Close(o);

End.