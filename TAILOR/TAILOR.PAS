{$M $2500,45218,94240}
Uses easScr, easStr ,
     easKey , easMisc ,
     Crt , easMouse ,
     easWChar , easInput;
 {}

 Type Turns =(on,off);
 Procedure TailorHlpScr;external;{$l tailor.obj}
 Procedure ChooseColor(var f,b:byte;t:byte);forward;  {chsclr}
 Procedure SaveScrf1(f:string);forward;               {ssf1}
 Procedure LoadScrf1(f:string);forward;               {lsf1}
 Procedure ChooseChr(var cc:char;t:byte);forward;     {chscc}
 Procedure PaintScr(fc,bc:byte);forward;              {paintscr}
 Procedure SaveScrf(f:string;t:byte);forward;         {ssf}
 Procedure LoadScrf(f:string;t:byte);forward;         {lsf}

 {}
 Const
       w1x1 = 2 ; w2x1 = 30;
       w1y1 = 2 ; w2y1 = 2 ;
       w1x2 = 26; w2x2 = 49;
       w1y2 = 79; w2y2 = 79;
       {}
       b1x1 = 1 ; b2x1 = 29; b3x1 = 33;
       b1y1 = 1 ; b2y1 = 1 ; b3y1 = 30;
       b1x2 = 27; b2x2 = 50; b3x2 = 47;
       b1y2 = 80; b2y2 = 80; b3y2 = 52;
       {}
 mbt:array[0..3] of string[6]=('none','left','right','both');
 fntname:array[1..3] of string[7]=('classic','line','large');
 Var
     x,y,bt,
     nx,ny,
     clr,
     fclr,bclr,
     i:Byte;
     wk:word;
     kh:char;
     tpwx,tpwy:shortint;
     och:char;
     oclr,fnt:byte;
     fns:string;
     Sp:array[1..3] of pointer;
 {}
 Procedure PaintScr;  {PaintScr!}

 Begin;

  ChangeMcur(#6,7,1);
  Repeat
  GetMouse(x,y,bt);
  if keypressed then wk:=wereadkey;
  if wk=KbwUpKey then begin;
                 Mlxy(x-1,y);
                 wk:=0;
                 end;
  if wk=KbwDownKey then begin;
                 Mlxy(x+1,y);
                 wk:=0;
                 end;
  if wk=KbwLeftKey then begin;
                 Mlxy(x,y-1);
                 wk:=0;
                 end;
  if wk=KbwRightKey then begin;
                 Mlxy(x,y+1);
                 wk:=0;
                 end;

  GetChara(x,y,och,oclr);
  WriteXyCA(x,y,Tcoc(fc,bc),och);
  Until wk=13;
  tpwy:=1;
  ChangeMcur(#26,14,0);
 End;

 Procedure LoadScrf;  {lsf!}
 var
      fl:file;
 begin;
 hidemouse;
 assign(fl,f);
 reset(fl,1);
 Blockread(fl,Vsegp^,scrbufsize*t);
 close(fl);
 showmouse;
 end;

 Procedure SaveScrf;  {ssf!}
 var
      fl:file;
 begin;
 hidemouse;
 assign(fl,f);
 rewrite(fl,1);
 BlockWrite(fl,Vsegp^,scrbufsize*t);
 close(fl);
 showmouse;
 end;
 Procedure SaveScrf1; {ssf1!}
 Var
      t:text;
 begin;
 HideMouse;
 assign(t,f);
 rewrite(t);
 for x:=w1x1 to w1x2 do
  for y:=w1y1-1 to w1y2+1 do
      begin;
      GetChara(x,y,Och,Oclr);
      Write(t,Och,Chr(Oclr));
      end;
 Close(t);
 Sound(1200);
 Delay(100);
 NoSound;
 ShowMouse;
 End;
 Procedure LoadScrf1; {lsf1!}
 Var
      t:text;
 begin;
 assign(t,f);
 reset(t);
 for x:=w1x1 to w1x2 do
  for y:=w1y1-1 to w1y2+1 do
      begin;
      Read(t,Och,kh);
      WriteXyCa(x,y,ord(kh),Och);
      end;
 Close(t);
 Sound(1300);
 Delay(100);
 NoSound;
 End;
Procedure Blocksm(C1,C2,C3,C4,C5,C6:Char);
Var Z1,Z2,Z3,Z4,Al,Al1:Turns;
    W:Word;
Begin
Z1:=Off;
Z2:=Off;
Z3:=Off;
Z4:=Off;
Al:=Off;
Al1:=Off;
Repeat
W:=Wereadkey;

If W=Kbwrightkey Then  Begin
              Z1:=On;
              Z4:=On;
 If Al=On  Then Begin
                 Al:=Off;
                 Z3:=On;
                 End Else
 If Z2=On Then Begin
          Z2:=Off;
          Lxy(Locx-1,Locy-1);
          Write(C1);
          End Else
              If Z3=On Then Begin
                       Z3:=Off;
                       Write(#8,C3);
                       End Else
              Write(C6);
              End;
If W=Kbwleftkey Then  Begin
              Z2:=On;
              Z3:=On;
              If Z4=On Then Begin
                       Z4:=Off;
                       Write(#8,C4);
                       End;
              If Z1=On Then Begin
                       Z1:=Off;
                       Write(#8,C2);
                       End;

              Write(#8,#8,C6);
              End;
If W=Kbwdownkey Then Begin
              Z3:=On;
              Z4:=On;
              Al:=On;
              If Z2=On Then Begin
                            Write(#8,C1,^J);
                            Z2:=Off
                            End Else
              If Z1=On Then Begin
                            Write(C2,^J);
                            Z1:=Off
                            End Else

             Write(#8,C5,^J);
             End;
If W=Kbwupkey  Then Begin
            If Z4=On Then Begin
                     Z4:=Off;
                     Write(C4);
                     End;
            If Z3=On Then Begin
                     Z3:=Off;
                     Write(#8,C3);
                     End;
            Al:=Off;
            Z2:=On;
            Z1:=On;
            Lxy(Locx-1,Locy-1);
            Write(C5);
            End;
            Until W=Ord(#13);
            End;

 Procedure ChooseChr; {chscc!}
  Label 1;
  Begin;
  i:=WtextAttr;
  Wtextattr:=12;
  Mbox(1,0,b3x1,b3y1,b3x2,b3y2);
  WriteXySa(b3x1,b3y1+6,13,'ascii table');
  Wtextattr:=i;
  i:=0;
  for nx:=b3x1+1 to b3x2-1 do
   for ny:=b3y1+1 to b3y2-1 do Begin;
                    Inc(i);
                    WriteXyCa(nx,ny,7,Chr(i));
                    if i=255 then break;
                    End;
 if t=1 then goto 1;
 ShowMouse;
 SetMouseWindow(b3x1+1,b3y1+1,b3x2-1,b3y2-1);
 ChangeMCur(#0,7,1);
 Repeat
 GetMouse(x,y,bt);
 if keypressed then wk:=wereadkey;
 if wk=KbwUpKey then begin;
                Mlxy(x-1,y);
                wk:=0;
                end;
 if wk=KbwDownKey then begin;
                Mlxy(x+1,y);
                wk:=0;
                end;
 if wk=KbwLeftKey then begin;
                Mlxy(x,y-1);
                wk:=0;
                end;
 if wk=KbwRightKey then begin;
                Mlxy(x,y+1);
                wk:=0;
                end;
 if wk=KbwRightKey then begin;
                Mlxy(x,y+1);
                wk:=0;
                end;
 if wk=KbwCr    then begin;
                break;
                wk:=0;
                end;

 GetChara(x,y,OCh,Oclr);
 WriteXySa(b3x2-1,b3y1+5,4,Concat(
 'Char:',Och,' a:',Fillnumber(Ord(och),4),
 'h:',Num2Hex(Ord(och))));
 Until 8=9;
 cc:=Och;
 1:
 write;
 ChangeMCur(#6,7,1);
 End;
 Procedure ChooseColor; {chsclr!}
 label 1;
 begin;
 i:=Wtextattr;
 Wtextattr:=12;
 Mbox(3,0,33,10,37,27);
 Wtextattr:=i;
 WriteXysa(mbx1+2,mby1+1,12,dupchr('Í',mby2-mby1-1));
  for  x:=1 to 3 do
   for y:=0 to 15 do if not (x in[2]) then Writexyca(mbx1+x,mby1+y+1,y,#219);
 Writexyc(mbx1+1,mby1,'F');
 Writexyc(mbx1+3,mby1,'B');
 ShowMouse;
 SetMouseWindow(mbx1,mby1+1,mbx1,mby2-1);
 ChangeMCur(#31,7,0);
 i:=1;
 if t=1 then goto 1;
 repeat
 GetMouse(x,y,bt);
 WriteXySa(mbx1+2,mby1+2,tcoc(f,b),'color palette.');
 If i = 1 then Begin;
               GetChara(x+1,y,kh,f);
               WriteXyca(mbx1+1,mby1,f,'F');
               end;
 If i = 2 then Begin;
               GetChara(x-1,y,kh,b);
               WriteXyca(mbx1+3,mby1,b,'B');
               end;
 if (keypressed) then wk:=wereadkey;
 if UpCase(Chr(wk))='F' then  Begin;
                 i:=1;
                 SetMouseWindow(mbx1,mby1+1,mbx1,mby2-1);
                 ChangeMCur(#31,7,0);
                 wk:=0;
                 end;
 if UpCase(Chr(wk))='B' then  begin;
                 i:=2;
                 SetMouseWindow(mbx2,mby1+1,mbx2,mby2-1);
                 ChangeMCur(#30,7,0);
                 wk:=0;
                 end;
 if wk=KbwLeftKey then begin;
                Mlxy(x,y-1);
                wk:=0;
                End;
 if wk=KbwRightkey then begin;
                Mlxy(x,y+1);
                wk:=0;
                End;

 if bt=2 then goto 1;
 until wk=13;

 1:
 bt:=5;
 End;

Procedure TailorProc;
 var
     tk:char;
Begin;          {begin!}
 If not IsmouseInst then Begin;
    write('This program requires Micorsoft ');
    delay(1000);
    writeln('mouse not Windows!');
    Exit;
    End;

 GetMem(Sp[2],ScrBufSize);
 GetMem(Sp[3],ScrBufSize);
 Move(Sp[3]^,Sp[2]^,ScrBufSize);

 CheckBreak:=False;
 SaveXy(1);
 clr:=9;
 tpwy:=1;
 Move(Vsegp^,Sp[3]^,ScrBufSize);
 ClsC;
 TextMode(EFont8x8);
 tk:='e';
 fns:=opt(1);
 if fns='' then fns:='tailor';

 WriteXySa(1,1,7,DupChr('Í',80));
 WriteXySa(27,1,7,DupChr('Í',80));

 WriteXySa(1,30,9,'Tailor By '+PrStr(EasEb));

 WriteXySa(30,10,4,'current file name:');
 Och:=flChar;
 FlChar:=#0;
 FlChar:=Och;
 WriteXySa(31,10,Tcoc(14,4),Fillstring(fns,8));

 Mbox(2,0,b2x1,b2y1,b2x2,b2y2);

 ChooseColor(i,i,1);

 ChooseChr(tk,1);

 SetMouseWindow(w1x1,w1y1,w1x2,w1y2);
 ChangeMcur(#26,14,0);

 fclr:=7;
 bclr:=0;
 fnt:=1;
 HideMouse;
 if opt(1)='' then Move(Sp[3]^,Ptr(Vseg,0160)^,ScrBufSize);
 ShowMouse;

  Repeat
  GetMouse(X,Y,bt);
  GetChara(x,y+tpwy,och,oclr);
  WriteXysA(49,2,Tcoc(7,0),
     Concat('X:',fillnumber(x,3),'Y:',fillnumber(y,3),
     'Walking over ',och,' colored of ',fillnumber(oclr,3),
     'pressing ',fillstring(mbt[bt],6),'button(s)'));
  Lxy(x,y);
  if (keypressed) then wk:=Wereadkey;
  if wk=KbwUpKey then begin;
                 Mlxy(locx-1,locy);
                 wk:=0;
                 end;
  if wk=KbwDownKey then begin;
                 Mlxy(locx+1,locy);
                 wk:=0;
                 end;
  if wk=KbwLeftKey then begin;
                 Mlxy(locx,locy-1);
                 wk:=0;
                 end;
  if wk=KbwRightkey then begin;
                 Mlxy(locx,locy+1);
                 wk:=0;
                 end;
  if wk=KbwCr    then begin;
                 writexyca(x,y+tpwy,Tcoc(fclr,bclr),tk);
                 wk:=0;
                 end;
  if wk=kbwcleftkey then begin;
                 ChangeMcur(#27,14,0);
                 tpwy:=-1;
                 wk:=0;
                 end;
  if bt=1        then writexyca(x,y+tpwy,Tcoc(fclr,bclr),tk);
  if bt=2        then writexyca(x,y+tpwy,7,' ');
  if wk=kbwcrightkey then begin;
                 ChangeMcur(#26,14,0);
                 tpwy:=1;
                 wk:=0;
                 end;
  if wk=KbwCf1  then Begin;
                HideMouse;
                scrollud(w1x1,w1y1-1,w1x2,w1y2+1,7);
                tpwy:=1;
                ChangeMcur(#26,14,0);
                ShowMouse;
                wk:=0;
                end;
  if wk=32  then begin;
                WriteXyCa(x,y+tpwy,7,' ');
                wk:=0;
                end;
  if wk=KbwAc  then begin;
               ChooseColor(fclr,bclr,0);
               SetMouseWindow(w1x1,w1y1,w1x2,w1y2);
               tpwy:=1;
               ChangeMcur(#26,14,0);
               MLxy(locx,locy);
               WtextAttr:=Tcoc(fclr,bclr);
               textattr:=Wtextattr;
               bt:=0;
               wk:=0;
               end;
  if wk=KbwAk  then begin;
               ChooseChr(tk,0);
               SetMouseWindow(w1x1,w1y1,w1x2,w1y2);
               tpwy:=1;
               ChangeMcur(#26,14,0);
               MLxy(locx,locy);
               bt:=0;
               wk:=0;
               end;
  If wk=KbwDelKey then begin
               wk:=0;
               end;
  If wk=KbwInsKey then begin
               wk:=0;
               end;

  if wk=KbwAH then Halt;
  if wk=Ord(^s) then begin;
                saveScrf1(fns+'.scr');
                wk:=0;
                end;
  if wk=Ord(^l) then begin;
                HideMouse;
                If FileExists(fns+'.scr') then LoadScrf1(fns+'.scr');
                tpwy:=1;
                ChangeMcur(#26,14,0);
                ShowMouse;
                wk:=0;
                end;
  if wk=KbwAp   then begin;
                PaintScr(fclr,bclr);
                wk:=0;
                end;

  if wk=Ord(^b) then begin;
                HideMouse;
                MWindow(w1x1,w1y1,w1x2,w1y2);
                Lxy(x,y);

                if tpwy= 1 then Blocksm('É','»','È','¼','º','Í');
                if tpwy= -1 then BlockSm('Ú','¿','À','Ù','³','Ä');

                MWindow(1,1,25,80);
                ShowMouse;
                wk:=0;
                end;
  if wk=KbwAr   then Begin;
                 HideMouse;
                 MWindow(w1x1,w1y1,w1x2,w1y2);
                 Lxy(x-1,y);
                 textattr:=Wtextattr;
                 repeat
                 kh:=readkey;
                 Write(kh);
                 until kh=#13;
                MWindow(1,1,50,80);
                ShowMouse;
                wk:=0;
                end;
  If Wk = KbwAl then Begin;
                HideMouse;
                WriteXySa(locx,1,Tcoc(Fclr,Bclr),DupChr(' ',80));
                ShowMouse;
                Wk:=0;
                End;
  If Wk = KbwAO then Begin;
                HideMouse;
                For i:=w1x1 to w1x2 do WriteXyCa(i,locy,Tcoc(Fclr,Bclr),' ');
                ShowMouse;
                Wk:=0;
                End;
  if wk = KbwF1 then Begin;
                HideMouse;
                Sp[1]:=@tailorHlpscr;
                move ( Sp[1]^,Ptr($B800,0160)^,ScrBufSize);
                ShowMouse;
                Wk:=0;
                end;
  if wk = KbwAv then Begin;
                HideMouse;
                GetMem(Sp[1],ScrBufSize*2);
                Move(Vsegp^,Sp[1]^,ScrBufsize*2);
                SaveScrf1('c:\tt$.$cr');
                TextMode(Co80);
                LoadScrf('c:\tt$.$cr',1);
                Readkey;
                TextMode(EFont8x8);
                Move(Sp[1]^,Vsegp^,ScrBufSize*2);
                FreeMem(Sp[1],ScrBufSize*2);
                ShowMouse;
                ChangeMcur(#26,14,0);
                tpwy:=1;
                Wk:=0;
                end;
  if UpCase(Chr(wk))='F' then begin;
                hidemouse;
                writexysa(30,10,4,'current file name:');
                fns:=InputXy(31,10,Tcoc(14,4),8,#0,AlphaNchar);
                wk:=0;
                showmouse;
                end;
  if wk=KbwAf   then begin;
                 MWindow(w1x1,w1y1,w1x2,w1y2);
                 Lxy(x,y);
                 HideMouse;
                 repeat
                 WriteXys(48,2,'current font name:'+fillstring(fntname[fnt],10));
                 kh:=readkey;
                 if fnt=4 then fnt:=1;
                 if kh=#4 then inc(fnt) else
                 if fnt=1 then Wclassicf(kh) else
                 if fnt=2 then Wlinef(kh) else
                 if fnt=3 then Wlargf(kh);
                 until kh=#13;
                ShowMouse;
                kh:=#0;
                wk:=0;
                Writexys(48,2,dupchr(' ',30));
                MWindow(1,1,50,80);
                end;
  if Wk=KbwCF10 then begin;
               HideMouse;
               GetMem(Sp[1],ScrBufSize);
               Move(Ptr(Vseg,0160)^,Sp[1]^,ScrBufSize);
               Break;
               end;
  if Wk=KbwF6 then Begin;
              HideMouse;
              MWindow(w1x1,1,w1x2,80);
              InsLine;
              Wk:=0;
              MWindow(1,1,50,80);
              ShowMouse;
              End;
  if Wk=KbwF5 then Begin;
              HideMouse;
              MWindow(w1x1,1,w1x2,80);
              DelLine;
              Wk:=0;
              MWindow(1,1,50,80);
              ShowMouse;
              End;
  if Wk=KbwAU then Begin;
              HideMouse;
              Move(Ptr(Vseg,0160)^,Sp[2]^,ScrBufSize);
              ShowMouse;
              Wk:=0;
              End;
  if Wk=KbwAJ then Begin;
              HideMouse;
              Move(Sp[2]^,Ptr(Vseg,0160)^,ScrBufSize);
              ShowMouse;
              Wk:=0;
              End;
  Until (WK=KbwF10);
HideMouse;
TextMode(LastMode);
TextMode(CO80);
If Wk=KbwF10 then Move(Sp[3]^,Vsegp^,ScrBufSize);

If Wk=KbwCF10 then Begin;
                   Move(Sp[1]^,Ptr(Vseg,0160)^,ScrBufSize);
                   FreeMem(Sp[1],ScrBufSize);
                   End;
 RestXy(1);
 FreeMem(Sp[2],ScrBufSize);
 FreeMem(Sp[3],ScrBufSize);

End;

Begin;
TailorProc;
End.
