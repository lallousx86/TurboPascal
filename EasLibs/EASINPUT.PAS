Unit easInput;

Interface

 Uses easScr,easKey;

Function InputXy(x,y,clr,max:byte;endchar:char;sk:soc):string;

Implementation

Function InputXy;

Var
   i:integer;
   s,s1:string;
   wk:Word;
   swx1,swx2,swy1,swy2:byte;
Begin;

 swx1:=mwx1; swx2:=mwx2;
 swy1:=mwy1; swy2:=mwy2;
 Mwindow(1,1,qmaxx+1,qmaxy);
 dec(max);
 lxy(x,y);
 s:=hilite(x,y,y+max,-1);
 for i:=y to (y+max) do if s[i]=#32 then s[i]:=endchar;
 WriteXySa(x,y,clr,s);
 hilite(x,y,y+max,clr);

 Exclude(sk,endchar);

 repeat
       wk:=Wereadkey;

    if (wk=kbwleftkey) then
         if not (locy=y) then begin;
             lxy(locx,locy-1);
             continue;
         end;

    if (wk=kbwrightkey) then
        if not(locy=y+max) then begin;
            lxy(locx,locy+1);
            continue;
        end;
    if (wk=08) then
                     if not (locy=y) then begin;
                                     lxy(locx,locy-1);
                                     WriteXyCA(locx,locy,clr,endchar);
                                     continue;
                                     end else continue;
   if (wk=KbwHomeKey) then begin;
            Lxy(x,y);
            Continue;
            End;
   if (wk=KbwCendKey) then begin;
            Lxy(x,y+max);
            Continue;
            End;
    if (wk=Kbwinskey) then begin;
       s:=Hilite(x,locy,y+max,-1);
       Dec(s[0]);
       writexyca(x,locy,clr,endchar);
       if not(locy=y+max) then WriteXySa(x,locy+1,clr,s);
       continue;
       end;
    if (wk=kbwdelkey) then
         Begin;
         if (locy=y+max) then Writexyca(locx,locy,clr,endchar) else
            Begin;
            s1:=Hilite(x,locy+1,y+max,-1);
            WriteXycA(x,y+max,clr,EndChar);
            WriteXySa(x,locy,clr,s1);
            End;
         Continue;
         End;
    if (wk=KbwEndKey) then begin;
                       s:=hilite(x,y,y+max,-1);
                       for tmb:=max+1 downto 1 do if s[tmb] in sk then begin;
                           i:=tmb;
                           break;
                           end;
                       if not (y+i > y+max) then lxy(x,y+i);
                       continue;
                       end;
    if (wk=13)        then break;
    if (wk=KbwEsc)    then begin;
                      for i:=y to max+1 do writexyca(x,i,Clr,endchar);
                      lxy(x,y);
                      continue;
                      end;
    if chr(wk) in sk  then
                       if not (locy=y+max+1) then begin;
                               writexyca(locx,locy,clr,chr(wk));
                               if not (locy=y+max) then lxy(locx,locy+1);
                               continue;
                               end;

    until (1=2);
s:=hilite(x,y,y+max,-1);

for tmb:=max+1 downto 1 do if s[tmb] in sk then break;

s[0]:=chr(tmb);

While Pos(endchar,s) > 0 do
      s[pos(endchar,s)] := #32;

inputxy:=s;

 Mwindow(swx1,swy1,swx2+1,swy2);

End;

End.