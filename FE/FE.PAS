uses easKey,easScr,easStr,easAsm,easInput,Crt;

const
  EasFeVer      = 'v1.1';
  EasFeDate     = '7/2/97';

  FDrawChar     : Char    = #254;
  BDrawChar     : Char    = #32 ;

  Sx1:Byte      = 6;
  Sy1:Byte      = 51;

  {$I Fe.Inc}

Type
  Tfont = Array[0..$FF,0..$F] Of Byte;


Var
  X1,Y1,
  X,Y:Byte;
  Wk:Word;
  CH:Char;
  CL:Byte;
  Fnt : Tfont;
  F:File;
  Sf:Array[$0..$F] Of Byte;

Procedure DrawAscTbl;
  Begin;
    Mwindowbox(3,1,5,50,20,70);
    For X := 0 To 255 Do If X In [13,10,7,0] Then W09H(Chr(X),WTextAttr) Else Write(Chr(X));
    Writexysa(5,55,Tcoc(7,1),'Ascii Table ');

    Writexyca(19,59,09,'S');
    Writexyca(19,60,10,'Q');
    Writexyca(19,61,11,'L');
    Writexyca(19,63,14,'O');
    Writexyca(19,64,15,'A');
    Writexyca(19,65,08,'H');
    {$IFDEF EnCopy}
    Writexyca(19,58,12,'C');
    Writexyca(19,62,13,'P');
    {$ENDIF EnCopy}


  End;

 Procedure DrawEditbox;
 Begin;
   Mwindowbox(4,1,5,30,22,39);
   Writexysa(5,30,Tcoc(7,1),' Font Edit');
   WritexyCa(22,31,13,'Z');
   WritexySa(22,32,11,'C'#26);
   WritexySa(22,34,11,#27);
   WritexySa(22,35,10,'I');

 End;

 Procedure Drawintro;
 Begin;
   Writexysa(1,1,Tcoc(7,4),'     FONT EDITOR '+Easfever+'              Created At '+EasFeDate+' By '+
     FillString('Elias bachaalany'{UpStr(EasEb)},24));
   Writexysa(25,1,Tcoc(7,4),Dupchr(' ',80));
 End;

 Procedure Drawstatusbox;
  Begin;
    Mwindowbox(1,1,5,2,10,25);
    Writexysa(5,8,Tcoc(7,1),'Status Box');
  End;

 Procedure Redrawall;
 Begin;
   DrawIntro;
   DrawEditBox;
   DrawAscTbl;
   DrawStatusBox;
 End;

 Function Str2Draw(S1:String):String;
 Begin;
   While Pos('1',S1) > 0 Do S1 [ Pos('1',S1) ] := FDrawChar;
   While Pos('0',S1) > 0 Do S1 [ Pos('0',S1) ] := BDrawChar;
   Str2Draw := S1;
 End;

Procedure Choosefromasctbl(Ca:Char);
 Begin;

   Drawasctbl;
   Crt_Gotoxy(Sx1,Sy1);
   Repeat
     Wk := Wereadkey;

     If Wk = Kbwupkey Then
     Begin;
       Lxy(Locx-1,Locy);
     End;

     If Wk = Kbwdownkey Then
     Begin;
       Lxy(Locx+1,Locy);
     End;

     If Wk = Kbwleftkey Then
     Begin;
       Lxy(Locx,Locy-1);
     End;

     If Wk = Kbwrightkey Then
     Begin;
       Lxy(Locx,Locy+1);
     End;

     If Wk = Ord(^A) Then
     Begin;
       CH := 'A';
       CL := 15;
       Exit;
     End;
     If Wk = Ord(^H) Then
     Begin;
       CH := 'H';
       CL := 08;
       Exit;
     End;

     If Wk = Ord(^O) Then
     Begin;
       CH := 'O';
       CL := 14;
       Exit;
     End;

     If Wk = Ord(^L) Then
     Begin;
       CH := 'L';
       CL := 11;
       Exit;
     End;

     If Wk = Ord(^Q) Then
     Begin;
       CH := 'Q';
       CL := 10;
       Exit;
     End;

     If Wk = Ord(^S) Then
     Begin;
       CH := 'S';
       CL := 09;
       Exit;
     End;

     Flchar := ' ';
     Getchara(Crt_Wherex,Crt_Wherey,CH,CL);

     Writexys(6,4,'Char :'+CH+' d:'+Fillnumber(Ord(CH),4)+'h:'+
       Fillstring(Num2Hex(Ord(CH)),5));

     If ( CH = 'S' ) And ( CL = 9 ) Then Writexys(6,4,'Save Font Table'+Dupchr(' ',6));
     If ( CH = 'Q' ) And ( CL = 10) Then Writexys(6,4,'Quit Font Editor'+Dupchr(' ',5));
     If ( CH = 'L' ) And ( CL = 11) Then Writexys(6,4,'Load Font Table '+Dupchr(' ',5));
     If ( CH = 'A' ) And ( CL = 15) Then Writexys(6,4,'nAme Font File       ');
     If ( CH = 'O' ) And ( CL = 14) Then Writexys(6,4,'Load Font To Mem     ');
     If ( CH = 'H' ) And ( CL = 08) Then Writexys(6,4,'Change drawing Char. ');
     {$IFDEF EnCopy}
     If ( CH = 'C' ) And ( CL = 12) Then Writexys(6,4,'Copy Font Char To Mem');
     If ( CH = 'P' ) And ( CL = 13) Then Writexys(6,4,'Paste Font From Mem  ');
     {$ENDIF EnCopy}

   Until (Wk = Kbwesc) Or (Wk = Kbwcr) Or (Wk = Kbwtab);

   Sx1 := Crt_WhereX;
   Sy1 := Crt_WhereY;

   Ca := CH;
 End;

  Procedure DrawFontChar(CH:Char);
  Var
    X:Byte;
  Begin;
    DrawEditBox;
    For X := $0 To $F Do WriteXyS(6+X,31, Str2Draw(Num2Bin(Fnt[Ord(CH),X],1)) );

  End;

  Procedure EditFontChar(Ca:Char);
  Var
    S:String;
  Begin;
    Drawfontchar(Ca);
    Repeat
      Wk := Wereadkey;

      If Wk = Kbwupkey Then Lxy(Locx-1,Locy);

      If Wk = KbwDownKey Then Lxy(Locx+1,Locy);


      If Wk = KbwLeftKey Then Lxy(Locx,Locy-1);

      If Wk = KbwrightKey Then Lxy(Locx,Locy+1);

      If Wk = KbwPgUpKey Then Lxy(1,1);

      If Wk = KbwPgDnKey Then Crt_GotoXy(21,38);

      If Wk = KbwSpace Then
      Begin;
        GetChara(Crt_Wherex,Crt_Wherey,CH,CL);
        If CH = FdrawChar Then CH := BDrawChar Else CH :=FDrawChar;
        WriteXyC(Crt_Wherex,Crt_Wherey,CH);
      End;

      {If ( CH = 'Z' ) And ( CL = 13) Then Writexys(6,4,'Undo The Drawing Char');}

      If Wk  = 3 Then ClsC;

      If Wk  = KbwHomeKey Then Lxy(Locx,1);

      If Wk = KbwEndKey   Then Lxy(Locx,8);

      If Wk = KbwDelKey   Then DelLine;

      If Wk = KbwInsKey   Then InsLine;

      If Wk = Ord(^Z)  Then DrawFontChar(Ca);

      If Wk  = Ord(^I) Then { Invert }
      Begin;
        For X1 := 6 To 21 Do
          For Y1 := 31 To 38 Do
          Begin;
            GetChara(X1,Y1,CH,CL);
            If CH = FDrawChar Then CH := BDrawChar Else CH := FDrawChar;
            WriteXyC(X1,Y1,CH);
          End;
      End;

      If Wk = KbwCRightKey Then  {Shift-Left}
      Begin;
        S := Hilite(Crt_WhereX,Crt_WhereY,Crt_WhereY+(8 - Locy) ,-1);
        Dec(S[0]);
        S := BDrawChar + S;
        WriteXyS(Crt_WhereX,Crt_WhereY,S);
      End;

      If Wk = KbwCLeftKey Then   {Shift-Right}
      Begin;
        S := Hilite(Crt_WhereX,Crt_WhereY,Crt_WhereY+(8 - Locy) ,-1);
        S := Copy ( S,2, Length(S) );
        S := S + BDrawChar;
        WriteXyS(Crt_WhereX,Crt_WhereY,S);
      End;

    Until (Wk = KbwCr ) Or (Wk = KbwEsc);

    S := '';
    Tmb := 0;
    For X1 := 6 To 21 Do
    Begin;
      For Y1 :=31 To 38 Do
      Begin;
        Getchara(X1,Y1,CH,CL);
        If CH = BDrawChar Then S := S +'0';
        If CH = FDrawChar Then S := S +'1';
      End;
      Fnt[Ord(Ca),Tmb] := Bin2Num(S,1);
      Inc(Tmb);
      S := '';
    End;
  End;

 Procedure LoadFontToMem;Assembler;

   Asm
     Push        BP
     Mov         AX,1100H
     Mov         BX,1000H
     Mov         CX,100H
     XOr         DX,DX
     Mov         BP,Offset Fnt
     Int         10H
     Pop         BP
   End;

 Procedure Savefont(Ft:String);
 Begin;
   Assign(F,Ft);
   {$I-} Rewrite(F,1); {$I+}

   If IOResult <> 0 Then
   Begin;
     Writexys(8,5,'Invalid File!');
     ReadKey;
     Writexys(8,5,'             ');
     Exit;
   End;
   BlockWrite(F,Fnt,$1000);
   Close(F);
 End;

 Procedure Loadfont(Ft:String;Var B:Tfont);
 Begin;
   Assign(F,Ft);
   {$I-} Reset(F,1); {$I+}
   If IOResult <> 0 Then Begin;
     Writexys(8,5,'Invalid File!');
     ReadKey;
     Writexys(8,5,'             ');
     Move( Biosfont , B , $1000);
     Exit;
   End;
   If FileSize(F) <> $1000 Then Begin;
     WriteXyS(9,5,'Not Font File Format');
     ReadKey;
     WriteXyS(9,5,'                    ');
     Move ( BiosFont , Fnt , $1000);
     Close(F);
     Exit;
   End;
   BlockRead(F,B,$1000);
   Close(F);
 End;

 Var
   A,S:String;

 Begin;

   CheckBreak := False;

   WTextAttr := 7;
   ClsC;

   TextMode(CO80);

   A := ParamStr(1);

   If (A = '') Then
   Begin;
     A := 'noname.fnt';
     Move ( Biosfont , Fnt , $1000);
   End

   Else Loadfont(ParamStr(1),Fnt);

   Loadfonttomem;

   Redrawall;

   Writexysa(25,1,Tcoc(7,4),'File:'+A);

   Repeat
     Choosefromasctbl(CH);

     If (CH = 'Q') And (CL = 10) Then Break;
     If (CH = 'S') And (CL = 09) Then
     Begin;
       Savefont(A);
       Continue;
     End;

     If (CH = 'O') And (CL = 14) Then
     Begin;
       Move ( Fnt , Fnt , $1000);
       Loadfonttomem;
       Continue;
     End;

     If (CH = 'L') And (CL = 11) Then
     Begin;
       Loadfont(A,Fnt);
       Continue;
     End;

     If (CH = 'H') And (CL = 08) Then
     Begin;
       WriteXySa(7,3,7,'Enter Draw Char:');
       FDrawChar := ReadKey;
       WriteXySa(7,3,7,'Enter Erase Char:');
       BDrawChar := ReadKey;
       WriteXySa(7,3,7,'                  ');
       Continue;
     End;

     If (CH = 'A') And (CL = 15) Then
     Begin;
       A := InputXy(25,6,Tcoc(7,4),60,#0,Nallchar);
       Continue;
     End;


     EditFontChar(CH);

     { Load Font To Mem}
     Move ( Fnt , Fnt , $1000);
     LoadFontTomem;
     { }

     Writexysa(25,1,Tcoc(7,4),'File:'+A);

   Until False;

   TextMode(Co80);
   WriteLn('Thanks For Using Hacker''s Fingers FONT EDITOR (c) Elias Bachaalany.');


end.