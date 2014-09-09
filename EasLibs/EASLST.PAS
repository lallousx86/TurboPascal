{$M $4000,0,0}
Unit EasLst;

Interface

Uses u_1, easScr, easKey, easStr ,crt , easMisc , dos , easInput;

  Var

   CurLst:longint   Absolute    $B000:$0000;
   Startspc:Byte    Absolute    $B000:$0005;

 Type l_Rec=Record
      fn:String[12];
      size:Longint;
      time:LongInt;
      attr:Byte;
      tag :Byte;
      End;
 Type DesFunc = Function (mf:L_rec): String;
 Type HandProc = Procedure (Hnd:Word;mf:L_Rec);

 Type l_rec_file = file of l_rec;

 Const l_Rec_Size = SizeOf(l_rec);

   Procedure L_Init(var f:l_Rec_File;fn:string);

   Procedure L_Done(var f:l_Rec_File;t:boolean);

   Procedure L_CreateFile(var f:l_rec_File;ne,pth:string;attr:byte);

   Procedure L_AppendCrFile(var f:l_rec_File;ne,pth:string;attr:byte);

   Procedure L_ReadFile(var f:l_rec_file;l:longint;var res:l_Rec);

   Function  L_File_Total(var f:l_rec_file):Longint;

   Function  L_File_Size(var f:l_rec_file):Longint;


 Function  l_DefaultDes(mf:L_Rec):string;
 Procedure l_DefHand(w:Word;mf:L_Rec);


 Procedure L_ChooseFiles(x1,y1,x2,y2,Clr1,Clr2,boxt:Byte;exitkey:Word;
                      var f1:L_rec_file;fn:string;Des:DesFunc;Hand:HandProc);

 Implementation

 Function L_DefaultDes;
 Var
    S,dat,tim:string;
 Begin;
 FlCharMisc:='-';
 FileTimeStr(mf.time,dat,tim);
 If IsDirAttr(Mf.attr) then S:=FillString(mf.fn,15)+'<DIR>     ' Else
 S:=FillString(mf.fn,15)+FillNumber(mf.size,10);
 S:=S+FillString(dat,11)+FillString(tim,6)+FillString(FileAttributes(mf.attr),9);
 L_DefaultDes:=s;
 End;

 Procedure L_DefHand;
 Begin;

 End;

Procedure L_ChooseFiles;

Var
   Wk:Word;
   o1,tempm:Longint;
   i,max:integer;
   mf1:L_rec;
   sx1,sx2,sy1,sy2:Byte;
   ts:String;
   lastdrive:soc;
   ch:Char;
label 1,2;
Begin;
 ClsC;
 sx1:=mwx1; sx2:=mwx2;
 sy1:=mwy1; sy2:=mwy2;
 CurLst := 1;
 2:
 lastdrive:=[];
 for ch:='A' to 'Z' do If ValidDrive(ch) Then Include(LastDrive,Chr(Ord(Ch)-64));
 wk:=0;
 o1:=0;
 tempm:=0;
 MWindowbox(boxt,0,x1,y1,x2,y2);

 If L_file_total(f1) < (x2-x1-1) then max:=L_file_total(f1) Else Max:=(x2-x1-1);

 for i:=1 to  Max do begin;
     L_readfile(f1,i,mf1);
     WriteXySa(x1+i,y1+1,Clr1,Des(mf1));
     end;

 Lxy(1,1);
 i:=1;
 o1:=1;
 L_readfile(f1,i,mf1);
 Hilite(x1+i,y1+1,y2-1,Clr2);

 repeat

 Wk := wereadkey;
 If Wk = ExitKey Then Break;

 If Wk = KbwUpKey then begin;
         If o1 <=1 then Continue;
         If i<=1 then Begin;
            Hilite(x1+i,y1+1,y2-1,Clr1);
            Scr_ScrollDown;
            i:=1;
            Dec(o1);
            L_ReadFile(f1,o1,mf1);
            WriteXySa(x1+i,y1+1,Clr2,Fillstring(Des(mf1),y2-y1-1));
            goto 1;
            end;
         Hilite(x1+i,y1+1,y2-1,Clr1);
         Dec(i);
         Dec(o1);
         L_ReadFile(f1,o1,mf1);
         Lxy(i,1);
         Hilite(x1+i,y1+1,y2-1,Clr2);
         Goto 1;
         end;

 If Wk = KbwDownKey then begin
       If o1 >=L_file_total(f1) then Continue;
       If i >= (x2-x1-1) then Begin;
               Hilite(x1+i,y1+1,y2-1,Clr1);
               Scr_ScrollUp;
               Inc(o1);
               L_ReadFile(f1,o1,mf1);
               WriteXySa(x1+i,y1+1,Clr2,fillstring(Des(mf1),y2-y1-1));
               Continue;
               End;
         Hilite(x1+i,y1+1,y2-1,Clr1);
         Inc(i);
         Inc(o1);
         Hilite(x1+i,y1+1,y2-1,Clr2);
         L_ReadFile(f1,o1,mf1);
         Lxy(i,1);
         Goto 1;
         end;
  {}
 If Wk = KbwEndKey Then Begin;
         If o1=L_file_total(f1) then goto 1;
         Cls;
         o1:=L_file_total(f1)-max+1;
         i:=0;
         for tempm:=o1 to L_file_total(f1) do begin;
             Inc(i);
             L_ReadFile(f1,tempm,mf1);
             WriteXySa(x1+i,y1+1,Clr1,fillstring(Des(mf1),y2-y1-1));
             end;
         i:=max;
         o1:=L_File_Total(f1);
         Hilite(x1+i,y1+1,y2-1,Clr2);
         Lxy(i,1);
         Goto 1;
         End;
 If Wk = KbwHomeKey Then Begin;
          If o1 = 1 then Goto 1;
          Cls;
           for i:=1 to  Max do begin;
           L_readfile(f1,i,mf1);
           WriteXySa(x1+i,y1+1,Clr1,Des(mf1));
           end;
         i:=1;
         o1:=1;
         L_readFile(f1,o1,mf1);
         Hilite(x1+i,y1+1,y2-1,Clr2);
         Lxy(i,1);
         Goto 1;
         End;
 If Wk = KbwCr      Then Begin;
         If IsDirAttr(mf1.attr) then
            begin
            ts:=RemoveSlash(CurrentDir('@'))+'\'+mf1.fn;
            If DirExists(ts) then Begin;
               ChDir(ts);
               L_CreateFile(f1,fn,RemoveSlash(CurrentDir('@'))+'\*.*',AnyFile);
               ClsC;
               Goto 2;
               End;
            End Else
         End;
 if Chr (Wk) In LastDrive Then
         If ValidDrive(Chr(Wk+64)) Then Begin;
            ChDir(Chr(Wk+64)+':');
            L_CreateFile(f1,fn,RemoveSlash(CurrentDir('@'))+'\*.*',AnyFile);
            ClsC;
            Goto 2;
            End;
 1:
 Hand(wk,mf1);
 CurLst:=o1;

 until 1=2;

 MWindow(sx1,sy1,sx2,sy2);

 End;

Procedure L_CreateFile;
 Var
   Sr: SearchRec;
   fr: l_rec;

Begin;

ReWrite(f);
FindFirst(pth,attr,Sr);
 While DosError=0 Do
  Begin;
  fr.fn:=sr.name;
  fr.size:=sr.size;
  fr.attr:=sr.attr;
  fr.time:=sr.time;
  fr.Tag :=0;
  Write(f,fr);
  FindNext(sr);
  End;

End;
Procedure L_AppendCrFile;
 Var
   Sr: SearchRec;
   fr: l_rec;
Begin;

Seek(f,L_file_Size(f)+1);
FindFirst(pth,attr,Sr);
 While DosError=0 Do
  Begin;
  {if LwStr(sr.name) = LwStr(ne) then FindNext(sr);}
  fr.fn:=sr.name;
  fr.size:=sr.size;
  fr.attr:=sr.attr;
  fr.time:=sr.time;
  fr.Tag :=0;
  Write(f,fr);
  FindNext(sr);
  End;

End;

 Procedure L_ReadFile;

Begin;

 Seek(f,l);
 Read(f,res);

 End;

 Procedure L_Init;
 Begin;

 Assign(f,fn);
 If FileExists(fn) then Reset(f) Else ReWrite(f);

 End;

 Procedure L_Done;
 Begin;

 Reset(f);
 If t = true then Erase(f);
 Close (f);

 End;

 Function L_File_Total;

 Begin;
 L_File_Total := ( FileSize(f) ) - 1;
 End;

 Function L_File_Size;

 Begin;
 L_File_Size := (L_File_Total(f)+1) * L_Rec_Size;
 End;


End.
