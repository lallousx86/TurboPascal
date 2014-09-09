Unit easMChk;

Interface

Implementation

Uses Dos,
     easSTR,easMISC,easINPUT,easSCR;

Const
  snTGTFile = 'C:\IO.SYS';
  snMaxLen  = 9;
  snSAVFile : String ='WIN.TAK';
  snSAVSize = 100;
Type
    TProc = Procedure;

Function _Num2Hex(number:Longint):String;
Const
   HexChars: Array [0..15] of Char = 'NZHOTVJKXYFBCDAE';
var
   I : integer;
   Str : string;
   BitsToShift: byte;
   Chr : char;
BEGIN
STR := '';
for i := 7 downto 0 do
         begin
         BitsToShift := i*4;
         Chr := HEXChars[ (Number shr BitsToShift) and $F];
         if not ((Str = '') and (Chr = '0')) then
            Str := Str + Chr;
         End;
If Str='' then Str:='00';
If Length(str)=1 Then Str:='0'+Str;
_Num2Hex:= Str;
End;

Procedure Reboot;Assembler;
Asm
   db   6Ah,00       { push 0 }
   or   al,al
   not  al
   pop  ds
   not  word ptr [4]
   not  word ptr [4*3]
   db   0EAh,00,00,0FFh,0FFh
End;

Procedure ContinueLen(Var S:String;l:byte);
var
   i:byte;
Begin;
  If Length(S) > l Then
    delete(S,1,l);
  for i := 1 To (l-Length(S)) Do
    S := S + 'E';
End;
Function IsEq(var op1,op2;sz:word):boolean;Assembler;
Asm
   push ds
   push es
   lds  si,op1
   les  di,op2
   mov  cx,sz
   rep  cmpsb
   mov  al,1
   jcxz @@1
   xor  ax,ax
 @@1:
   pop  es
   pop  ds
End;

function rcx:word;assembler;
asm
   mov ax,cx
end;

Function GetWD95(Var D:String):Boolean;
Var
   i,i1:byte;
Begin;
 GetWD95 := False;
 For i:=1 To EnvCount Do
 Begin;
  D := EnvStr(i);
  i1 := Pos('=',D);
  D := UpStr( Copy(D,1,i1-1) );
  If D = 'WINBOOTDIR' then begin;
      D := Copy(EnvStr(i),i1+1,Length(EnvStr(i)));
      If D[Byte(D[0])] = '\' Then
                                  Dec(D[0]);
      GetWD95 := True;
      Break;
      End;
 End;
End;

Function GenSn(Str:String):Longint;
Var
  I         :  Byte;
  Buf       :  Array[0..$100] Of Char;
  Num       :  Longint;
Begin;
  For i := 1 to Length(Str) Do
    Str[i] := UpCase(Str[i]);

  FillChar(Buf,SizeOf(Buf),#0);
  Move(Str[1],Buf,SizeOf(Buf));
  Asm
    mov cx,4
  @@1:
    mov ax,cx
    inc cx
    db  66h,99h    { cdq }
    xor ax,dx
    sub ax,dx
    and ax,3
    xor ax,dx
    sub ax,dx
    mov bx,offset Buf-1
    add bx,cx
    mov dl,byte ptr [bx]
    mov bx,offset Buf
    add bx,ax
    xor byte ptr [bx],dl
    cmp cx,100h
    jl  @@1
  End;
  Move(Buf,Num,4);
  GenSn := Num;
End;

Function GetMachineCode:String;
Var
  Info : SearchRec;
  Dt   : DateTime;
  S    : String;
  I    : Byte;
  Sn   : Longint;
Begin;

  FindFirst(snTGTFile,AnyFile,Info);
  If DosError <> 0 Then
  Begin;
    WriteLn('Not enough memory. (1)');
    Halt;
  End;

  UnPackTime(Info.Time,Dt);

  S := Num2Str(Dt.Year)     + 'h' +
       Num2Str(Dt.Month)    + 'C' +
       Num2Str(Dt.Day)      + 'K' +
       Num2Str(Dt.Hour)     + 'F' +
       Num2Str(Dt.Min)      + 'N' +
       Num2Str(Dt.Sec)      + 'G' +
       Num2Str(Info.Size)   + '9' +
       Num2Str(Info.Attr)   + '8' +
       Num2Str(Info.Time)   + '!';

  Sn := GenSn(S);
  S := Num2Str(Sn);

  ContinueLen(S,snMaxLen);

  For I :=1 To Length(S) Do
    If S[i] in ['0'..'9'] Then
      S[i] := Chr(90-(Byte(S[i])-48));
  GetMachineCode := S;
End;

Procedure SimpleXOR(Var Buf;Key:Byte;Size:Word);Assembler;
Asm
   push ds
   lds  si,Buf
   mov  cx,size
 @@1:
   mov  al,byte ptr [si]
   xor  al,key
   mov  byte ptr [si],al
   inc  si
   loop @@1
   pop  ds
End;

Procedure SaveSn(YCode,MCode:String);
Var
   S,cCode : String;
   F       : File;
   Buf     : Array[1..snMaxLen+4] Of Char;
   I,I1,
   RndPos1,
   RndPos2 : Byte;
   WD      : String;
Begin;

 ContinueLen(YCode,snMaxLen);
 ContinueLen(MCode,snMaxLen);

 If Not GetWD95(WD) Then
 Begin;
  WriteLn('Not enough memory. (2)');
  Halt;
 End;

 Randomize;

 RndPos1  := Random(snSAVSize);

 Repeat
  RndPos2 := Random(snSAVSize);
 Until RndPos2 <> RndPos1;

 S     :=  YCode;
 S     :=  'TIC!' + S;
 cCode :=  'SIC!' + MCode;

 SimpleXOR(S[1],88,13);
 SimpleXOR(cCode[1],99,13);

 Assign(F,WD + '\' + snSAVFile);
 FileMode := 2;
 ReWrite(F,1);

 For I := 1 To snSAVSize Do
 Begin;
   If I = RndPos1 Then
                    BlockWrite(F,S[1],13) Else
   If I = RndPos2 Then
                    BlockWrite(F,cCode[1],13)
   Else
    Begin;
     For I1 := 1 To SizeOf(Buf) Do
         Buf[i1] := Char(Random(255));
     BlockWrite(F,Buf,SizeOf(Buf));
    End;
 End;
 Close(F);
End;

Function ReadSn(p:TProc):Boolean;
Var
   S,
   S1,cCode: String;
   F       : File;
   Buf     : Array[1..snMaxLen+4] Of Char;
   I,I1,
   RndPos1,
   RndPos2 : Byte;
   WD      : String;
   Rw      : Word;
   Sn      : Longint;
Begin;
 ReadSn := True;

 If Not GetWD95(WD) Then
 Begin;
  WriteLn('Not enough memory. (2)');
  Halt;
 End;

 Assign(F,WD + '\' + snSAVFile);
 FileMode := 2;
 {$I-} Reset(F,1); {$I+}
 If IOResult <> 0 Then
 Begin;
  ReadSn := False;
  Exit;
 End;

 FillChar(S1,SizeOf(S1),#0);
 FillChar(cCode,SizeOf(cCode),#0);

 If FileSize(F) <> SizeOf(Buf)*snSAVSize Then
 Begin;
  WriteLn('Not enough memory. (4)');
  Halt;
 End;

 For I := 1 To snSAVSize Do
 Begin;
  BlockRead(F,Buf,SizeOf(Buf));
  SimpleXOR(Buf,88,SizeOf(Buf));
  S[0] := #13;
  Move(Buf,S[1],13);
  If Copy(S,1,4) = 'TIC!' Then
                               S1    := Copy(S,5,snMaxLen);

  SimpleXOR(Buf,88,SizeOf(Buf));
  SimpleXOR(Buf,99,SizeOf(Buf));
  S[0] := #13;
  Move(Buf,S[1],13);
  If Copy(S,1,4) = 'SIC!' Then
                               cCode := Copy(S,5,snMaxLen);
 End;
 I  := 88;
 Close(F);
 I1 := 99;

 {
 Sn := GenSn(S1);
 S1 := _Num2Hex(Sn);
 ContinueLen(S1,snMaxLen);
 }
 IsEQ(s1,cCode,SizeOf(s1));
 asm push cx end;
 IsEQ(I,I1,SizeOf(I));
 If rcx <> 0 Then
                 Reboot;
 asm pop cx end;
 if rcx <> 0 Then
                  p;
End;

Procedure Error;
var
   f:file;
   wd:string;
Begin;
 if not getwd95(wd) then halt;
 writeLn('error!');
 assign(f,wd+'\win.tak');
 erase(f);
 Halt;
End;

Procedure Init;
Var
   YCode,
   MCode,
   TCode : String;
   Sn    : Longint;
Begin;

 If Not ReadSn(error) Then
 Begin;
  Cls;
  YCode := GetMachineCode;
  Sn := GenSn(YCode);
  MCode := _Num2Hex(Sn);
  ContinueLen(MCode,snMaxLen);
  Write('your code is :',YCode,#13#10+
        'input my code:');
  TCode := InputXy(2,15,9,9,'_',['0'..'9','A'..'Z']);
  IsEQ(TCode,MCode,snMaxLen+1);
  If rcx <> 0 then
                   halt;
  SaveSn(GetMachineCode,YCode);
 End;
End;

Begin;
 Init;
End.