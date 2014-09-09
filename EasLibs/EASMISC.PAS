Unit EasMisc;

Interface

Type
  ProcT=Procedure;
Function  IsDirAttr(a:Byte):Boolean;
Function  DirExists(DirName:String):Boolean;
Function  FileExists(FileName:String):Boolean;
Function  Opt(i:Word):String;
Function  OptCount:Word;
Function  OptLast:String;
Function  OptMax(mo:Byte):String;
Function  FileAttributes(b:Byte):String;
Function  CurrentDir(d:Char):String;
Function  ValidDrive(Drive:Char):Boolean;
Function  FRemoveSlash(Var Pth:String):String;

Procedure Efsplit(pa:String;Var DI,na,ex:String);
Procedure RunSystem(s:String);
Procedure FileTimeStr(ftime:LongInt;Var dat,tim:String);
Procedure Unassign(Var p:Pointer);
Procedure SetMyExit(e:Byte);
Procedure ExtractiFile(fn:String;Sp:Pointer;Size:Word);
Procedure AsmErase(f:String);
Procedure CancelProc(P:Pointer);
Procedure RemoveSlash(Var pth:String);

  Var
    FlCharMisc,
    DateCSepe,
    TimeCSepe:Char;
    saveexitproc:Pointer;

  Implementation
   Uses
     Dos, easStr;

Function IsDirAttr;
Begin;
  IsDirAttr:=(A And $10)=$10;
End;

Function FileExists;
Var
  F: File;
Begin
  {$I-}
  Assign(F, FileName);
  FileMode := 0;
  Reset(F);
  Close(F);
  {$I+}
  FileExists := (IOResult = 0) And (FileName <> '');
End;
Procedure ExtractiFile;
Var
  f:File;
Begin;
  Assign(f,fn);
  Rewrite(f,1);
  BlockWrite(f,Sp^,Size);
  Close(f);
End;
Procedure AsmErase;Assembler;
 Asm
   PUSH       DS
   PUSH       BP
   MOV        AH,41H
   LDS        DX,F
   Inc        DX
   Int        21H
   POP        BP
   POP        DS
 End;

Function DirExists;
Var
  S: String;

Begin
  {$I-}
  GetDir(0,s);
  ChDir(DirName);
  DirExists:=(IOResult=0);
  ChDir(s);
  {$I+}

End;

Function Opt;
Begin;
  Opt:=ParamStr(i);

End;

Function OptCount;
Begin;

  OptCount:=ParamCount;

End;

Procedure Efsplit;
Var
  Dname:DirStr;
  Fname:NameStr;
  EStr:ExtStr;
Begin;
  FSplit(pa,Dname,Fname,Estr);
  DI:=Dname;
  na:=Fname;
  ex:=Estr;
End;

Function OptLast;
Begin;
  OptLast:=Opt(OptCount);
End;

Function  OptMax(mo:Byte):String;
Var
  i:Byte;
  s:String;
Begin;
  s:='';
  For i:=mo To OptCount Do s:=s+Opt(i)+FlCharMisc;
  OptMax:=s;
  S:='';
End;

Function FileAttributes;
Var
  S : Array[1..6] Of Char;
Begin
  FillChar(S,SizeOf(s),flcharmisc);
  If ((B And VolumeID) = VolumeID) Then
    S[1] := 'V';
  If ((B And SysFile) = SysFile) Then
    S[2] := 'S';
  If ((B And Hidden) = Hidden) Then
    S[3] := 'H';
  If ((B And Archive) = Archive) Then
    S[4] := 'A';
  If ((B And ReadOnly) = ReadOnly) Then
    S[5] := 'R';
  If ((B And Directory) = Directory) Then
    S[6] := 'D';
  FileAttributes:=S;
End;

Function CurrentDir;
Var
  s:String;
Begin;
  GetDir(Ord(UpCase(d))-64,s);
  CurrentDir:=s;
End;
Procedure RunSystem;
Begin;
  SwapVectors;
  Exec(GetEnv('Comspec'),'/c '+s);
  SwapVectors;

End;

Procedure FileTimeStr;
Var
  Year,Month,Day,Hour,Min,Sec:Word;
  dt : DateTime;

Begin;
  UnpackTime(ftime,dt);

  Dat:=Concat(LeadingZero(dt.Month),DateCSepe,
    LeadingZero(dt.Day),DateCSepe,
    LeadingZero(dt.Year));
  Tim:=Concat(LeadingZero(dt.Hour),TimeCSepe,
    LeadingZero(dt.Min));
End;

Procedure SetMyExit;
Begin;
  If (e <> 0) And (ExitCode <> 0 ) Then Begin;
    WriteLn('Error ',ExitCode,' in module ',opt(0),' at ',
      Seg(ErrorAddr),':',Ofs(ErrorAddr));
    ExitProc:=saveexitproc;
    Halt;
  End;
  ExitProc:=saveexitproc;
  Halt;
End;
Procedure Unassign;
Begin;
  P:=Nil;
End;

Procedure RemoveSlash;
Begin;
   If Length(Pth) <= 3 Then Exit;
   If Pth[ Byte(Pth[0]) ] = '\' Then
            Dec(Pth[0]);
End;
Function FRemoveSlash;
Label 1,2;
Begin;
   Goto 1;
 2:
   FRemoveSlash := Pth;
   Exit;
 1:
   If Length(Pth) <= 2 Then Goto 2;
   If Pth[ Byte(Pth[0]) ] = '\' Then
            Dec(Pth[0]);
   Goto 2;
End;

Function ValidDrive;Assembler;
 Asm
   MOV        AH,19H
   Int        21H
   MOV        BL,AL
   MOV        DL,Drive
   SUB        DL,'A'
   MOV        AH,0EH
   Int        21H
   MOV        AH,19H
   Int        21H
   MOV        CX,0
   CMP        AL,DL
   JNE        @@1
   MOV        CX,1
   MOV        DL,BL
   MOV        AH,0EH
   Int        21H
   @@1: XCHG AX,CX
 End;

Procedure CancelProc(P:Pointer);Assembler;
Asm
     push       es
     push       di
     les        di,P
     mov        ax,61CBh
     stosw
     pop        di
     pop        es
End;

Begin;

  FlCharMisc:=' ';
  DateCSepe:='Ä';
  TimeCSepe:=':';
  ExitProc:=saveexitproc;

End.