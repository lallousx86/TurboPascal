Unit Easstr;

Interface

Type Stringp= ^ String;

Var
         Flchar : Char;
         Strfsepe:String[3];
         Easeb   :String;
                    (* P&Rocedure *)
Procedure Adds(Var D:String;S:String);                  (* Adds A String To Another , D:=D+S *)
Procedure Srchrepstr(What,Repw:String;Var Src:String);  (* Search Replace In String *)
Procedure Xchgstr(Var S1,S2:String);                    (* Exchanges The 2 Strings Values *)
Procedure Truncstr(Var S:String;L,C:Byte);              (* Truncates String From 1 To Len , Or Length To Len *)
Procedure Inputs(M:String;Var V:String);                (* Inputs *)
Procedure Eformatstr(Froms:String;Var Reps:String);     (* Formats A String *)
                    (* F&Unction  *)
Function  Comsepe(A,Cs:String;Cn:Integer;               (* /  Command Seperator        \  *)
          Var Ac:Integer):String;                       (* /                           \  *)
Function  CountLStr(S:String;C:Integer): String;        (* Copy From Left To Right Of String *)
Function  CountRStr(S: String;C:Integer): String;       (* Copy From Right To Left Of String *)
Function  Countstr(Wt,S: String): Integer;              (* Count Number Of Substring In String *)
Function  Str2Num(S:String):Longint;                    (* Turns A Str Value To Its Number Representation *)
Function  Num2Hex(number:Longint):String;               (* Number to Str Hex *)
Function  Num2Str(L:Longint):String;                    (* Turns A Number Value To Its Str Representation *)
Function  IntToHex(number:Longint;c:byte):String;
Function  Upstr(S:String):String;                       (* Turn String To Upper Case *)
Function  Lwstr(S:String):String;                       (* Turn String To Lower Case *)
Function  Prstr(S:String):String;                       (* Turn Proper String Only To Upper Case *)
Function  Rvrsstr(S:String):String;                     (* Reverses A String *)
Function  Dupstr(S:String;T:Byte) :String;              (* Duplicate A String *)
Function  Dupchr(K:Char;T:Byte) :String;                (* Duplicate A String *)
Function  Fillnumber(Num,Tm:Longint):String;            (* Fill The Number *)
Function  Fillstring(S:String;N:Byte):String;           (* Fill The String *)
Function  Slength(S:String):Byte;                       (* String Length   *)
Function  Nlength(N:Longint):Byte;                      (* Number Length *)

Function  Num2Bin(Numr:LongInt;t:byte):String;
Function  Bin2num(s:String;t:byte):Longint;


Function  Expos(Num:Longint;Ex:Byte):Longint;           (* Returns the Exponentiation of num *)
Function  Num2Chars(var n;t:byte):string;
Function  Int2Chrs(B:Integer):String;                   (* Integer To String *)
Function  Long2Chrs(B:Longint):String;                  (* Longint To String *)
Function  Word2Chrs(W:Word):String;                     (* Word To String *)
Function  Real2Chrs(R:Real):String;                     (* Real To String *)
Function  Chrs2Int(S:String):Integer;                   (* String To Integer *)
Function  Chrs2Long(S:String):Longint;                  (* String To Longint *)
Function  Chrs2Word(S:String):Word;                     (* String To Word    *)
Function  Chrs2Real(S:String):Real;                     (* String To Real *)
Function  LeadingZero(w : Word) : String;
Function  Array2Str(Var A; Len : Byte) : String;
  {-Convert an array of char to a string}
  inline(
    $8C/$DB/                 {mov bx,ds ;save DS}
    $59/                     {pop cx    ;CX = Len}
    $30/$ED/                 {xor ch,ch}
    $5E/                     {pop si    ;ds:si => A}
    $1F/                     {pop ds}
    $5F/                     {pop di    ;es:di => result}
    $07/                     {pop es}
    $06/                     {push es   ;put the pointer back on the stack}
    $57/                     {push di}
    $FC/                     {cld       ;go forward}
    $88/$C8/                 {mov al,cl ;set the length byte}
    $AA/                     {stosb}
    $F2/$A4/                 {rep movsb ;move data into string}
    $8E/$DB);                {mov ds,bx ;restore DS}

Var

    Tms:String;
    Stri:Byte;

Implementation


Procedure Adds;
Begin
D:=D+S;
End;

Procedure Srchrepstr;
Var
    Posi:Integer;
    Times,I,
    J:Byte;
Begin;
If (Tms='>>') Or (Tms='') Then Times:=0
       Else
           Times:=Ord(Tms[1]);
I:=Times;
J:=0;
While Pos(What,Src) > Times Do
      Begin;
      If (Times<>0) Then If I=0 Then Exit;
      Inc(J);
      Posi:=Pos(What,Src);
      Delete(Src,Posi,Length(What));
      Insert(Repw,Src,Posi);
      If (Times<>0) Then Dec(I);
      End;
Tms[1]:=Chr(J);
End;

Procedure Xchgstr;
Begin
Tms:=S1;
S1:=S2;
S2:=Tms;
End;

Procedure Truncstr;
Begin;
Tms:=S;
S:='';
If C=1 Then S:=Copy(Tms,1,L);
If C=2 Then S:=Copy(Tms,Length(Tms)-L+1,Length(Tms));

End;

Procedure Inputs;
Begin
Write(M);
Readln(V);
End;

Function Comsepe;
Var P:Array[1..50] Of Integer;
    C:Array[1..50] Of String[120];
    I,I1,I2:Integer;
    K,K1:Char;
Begin;
(* Str Job *)
I1:=0;
I2:=0;
Ac:=0;
 If Not (Countlstr(A,Length(Cs))=Cs) Then A:=Cs+A;
 If Not (Countrstr(A,Length(Cs))=Cs) Then A:=A+Cs;
 While Pos(Cs,A) > 0 Do Begin
       Inc(I1);
       P[I1]:=Pos(Cs,A);
       A[Pos(Cs,A)]:=^A;
       End;
Ac:=I1-1;
For I2:=1 To Ac Do Begin
                C[I2]:=Copy(A,P[I2],P[I2+1]-P[I2]+1);
                Delete(C[I2],1,Length(Cs));
                Delete(C[I2],Length(C[I2]),Length(Cs));
                End;
Comsepe:=C[Cn];
End;

Function Countlstr;
Begin;
Countlstr:=Copy(S,1,C);
End;

Function Countrstr;
Begin;
Countrstr:=Copy(S,Length(S)-C+1, C);
End;

Function Countstr;
Var
    I:Byte;
Begin

Tms:=S;
I:=0;
While Pos(Wt,Tms) > 0 Do
                    Begin
                    Inc(I);
                    Tms[Pos(Wt,Tms)]:=^A;
                    End;
Countstr:=I;
End;

Function Str2Num;
Var I :Longint;
    I3:Integer;
Begin
If Length(S)>10 Then Exit;
Val(S,I,I3);
Str2Num:=I;
End;

Function Num2Str;
Begin;
Str(L,Tms);
Num2Str:=Tms;
End;

Function Upstr;

Begin
For Stri := 1 To Length(S) Do S[Stri] := Upcase(S[Stri]);
Upstr:=S;
End;

Function Prstr;
Var
    I:Byte;
Begin;
S:=Lwstr(S);
S[1]:=Upcase(S[1]);
For I:=1 To Length(S)
    Do If Not (S[I] In ['A'..'Z','a'..'z','''']) Then S[I+1]:=Upcase(S[I+1]);
Prstr:=S;
End;

Function Lwstr;
Var K:Char;
    A:String;
    I:Integer;
Begin;
A:='';
For I:=1 To Length(S) Do
   Begin
   K:=S[I];
    Case K Of
      'A'..'Z' : A:=A+Chr(Ord(K)+32);
     Else
          A:=A+K;
      End;
    End;
Lwstr:=A;
End;

Function Rvrsstr;
Begin;
Tms:='';
For Stri:=Length(S) Downto 1 Do Tms:=Tms+S[Stri];
Rvrsstr:=Tms;
End;

Function Dupstr;
Begin;
Tms:='';
For Stri:=1 To T Do Adds(Tms,S);
Dupstr:=Tms;
End;

Function Dupchr;
Begin;
Tms:='';
For Stri:=1 To T Do Adds(Tms,K);
Dupchr:=Tms;
End;

Function Fillnumber;
Begin
Tms:='';
Str(Num,Tms);
Fillnumber:=Fillstring(Tms,Tm);
Tms:='';
End;

Function Fillstring;
Var
    A,B:String;
    I,I1:Integer;
    C:Char;
Begin
B:='';
A:=S;
If N<Length(A) Then S:=Copy(S,1,N);
For I:=1 To (N-Length(S)) Do Adds(B,Flchar);
Fillstring:=S+B
End;

Procedure Eformatstr;
Var A,
    B:String;
    Posi,
    Strnum:Byte;
    Nuli:Integer;
Begin;
While Pos(Strfsepe,Reps) > 0 Do Begin
      Posi:=Pos(Strfsepe,Reps);
      A:=Copy(Reps,Posi+3,2);
      Strnum:=Str2Num(A)+1;
      Delete(Reps,Posi,Length(Strfsepe)+2);
      B:=Comsepe(Froms,',,,',Strnum,Nuli);
      Insert(B,Reps,Posi);
      End;
End;

Function Slength;
Var
    Len : Byte Absolute S;
Begin;
Slength:=Len;
End;
Function Nlength;
Begin;

Nlength:=Length(Num2Str(N));

End;

Function  Num2Chars;
 Var
     c:array[1..10] of char absolute n;
     i:byte;
     s:string;
 Begin;
 s:='';
  For i:=1 to t do s:=s+c[i];
 Num2Chars:=s;
 End;
Function  Int2Chrs;
Var
     C:Array[1..4] Of Char;
Begin;
C[1]:=Char ( Ptr( Seg(B) , Ofs(B)   ) ^ );
C[2]:=Char ( Ptr( Seg(B) , Ofs(B)+1 ) ^ );
Int2Chrs:=C[1]+C[2];
End;
Function  Long2Chrs;
Var
     C:Array[1..4] Of Char;
Begin;
C[1]:=Char ( Ptr( Seg(B) , Ofs(B)   ) ^ );
C[2]:=Char ( Ptr( Seg(B) , Ofs(B)+1 ) ^ );
C[3]:=Char ( Ptr( Seg(B) , Ofs(B)+2 ) ^ );
C[4]:=Char ( Ptr( Seg(B) , Ofs(B)+3 ) ^ );
Long2Chrs:=C;
End;
Function  Chrs2Int;
Var
     C:Array[1..4] Of Char;
     T:Integer;
Begin;
C[1]:=S[1];
C[2]:=S[2];
Char ( Ptr(Seg(T),Ofs(T)  ) ^ ):=C[1];
Char ( Ptr(Seg(T),Ofs(T)+1) ^ ):=C[2];
Chrs2Int:=T;
End;
Function  Chrs2Long;
Var
     C:Array[1..4] Of Char;
     T:Longint;
Begin;
C[1]:=S[1];
C[2]:=S[2];
C[3]:=S[3];
C[4]:=S[4];
Char ( Ptr(Seg(T),Ofs(T)  ) ^ ):=C[1];
Char ( Ptr(Seg(T),Ofs(T)+1) ^ ):=C[2];
Char ( Ptr(Seg(T),Ofs(T)+2) ^ ):=C[3];
Char ( Ptr(Seg(T),Ofs(T)+3) ^ ):=C[4];
Chrs2Long:=T;
End;
Function Chrs2Word;
Var
    W:Word;
Begin;
Char ( Ptr( Seg(W),Ofs(W)   ) ^ ):=S[1];
Char ( Ptr( Seg(W),Ofs(W)+1 ) ^ ):=S[2];
Chrs2Word:=W;
End;
Function Word2Chrs;
Var
    C : Array[1..2] Of Char;
Begin;
C[1]:=Char( Ptr( Seg(W) , Ofs(W)   ) ^ );
C[2]:=Char( Ptr( Seg(W) , Ofs(W)+1 ) ^ );
Word2Chrs:=C;
End;
Function Num2Bin;
 Var
   num:longint;
   r,
   size:Byte;
   c:char;
   s:string;
begin;
s   :='';
num:=Numr;
size:=t*8;
 repeat
 r   := num mod 2;
 num := num div 2;
 c   :=chr(r+48);
 s   :=s+c;
 until num=0;
flchar:='0';
s:=Fillstring(s,size);
s:=RvrsStr(s);
Num2Bin:=s;
End;

Function Real2Chrs;
Var
     C : Array[1..6] Of Char;
Begin;
C[1]:=Char ( Ptr( Seg(R) , Ofs(R)   ) ^ );
C[2]:=Char ( Ptr( Seg(R) , Ofs(R)+1 ) ^ );
C[3]:=Char ( Ptr( Seg(R) , Ofs(R)+2 ) ^ );
C[4]:=Char ( Ptr( Seg(R) , Ofs(R)+3 ) ^ );
C[5]:=Char ( Ptr( Seg(R) , Ofs(R)+4 ) ^ );
C[6]:=Char ( Ptr( Seg(R) , Ofs(R)+5 ) ^ );
Real2Chrs:=C;
End;

Function  Chrs2Real;
Var
     T:Real;
Begin;
Char ( Ptr(Seg(T),Ofs(T)  ) ^ ):=S[1];
Char ( Ptr(Seg(T),Ofs(T)+1) ^ ):=S[2];
Char ( Ptr(Seg(T),Ofs(T)+2) ^ ):=S[3];
Char ( Ptr(Seg(T),Ofs(T)+3) ^ ):=S[4];
Char ( Ptr(Seg(T),Ofs(T)+4) ^ ):=S[5];
Char ( Ptr(Seg(T),Ofs(T)+5) ^ ):=S[6];
Chrs2Real:=T;
End;

Function Num2Hex(number:Longint):String;
Const
   HexChars: Array [0..15] of Char = '0123456789ABCDEF';
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
Num2Hex:= Str;
End;
function IntToHex(number:Longint;c:byte):String;
var
  HexChars: Array [0..15] of Char;
var
  i : byte;
  Str : string;
  BitsToShift: byte;
  Chr : char;
begin
  HexChars := '0123456789ABCDEF';
  Str := '';
  for i := 7 downto 0 do
  begin
    BitsToShift := i*4;
    Chr := HEXChars[ (Number shr BitsToShift) and $F];
    Str := Str + Chr;
  end;
  Delete(Str,1,8-c);
  IntToHex:= Str;
end;
Function Bin2num;
 Var
     i,
     size:byte;
     n,ex:longint;

 begin;
 ex:=1;
 size:=t*8;
 n:=0;
 s:=rvrsstr(s);
 fillchar(s[length(s)+1],size,0);
 for i:=1 to size do begin;
          if s[i]='1' then n:=n+ex;
          ex:=ex*2;
          end;
 Bin2Num:=n;
 End;

Function Expos;
Var I:Byte;
    L:Longint;
Begin;
L:=1;
For I:=1 To (Ex Div 2) Do L:=L*Sqr(Num);
If   (Ex Mod 2) <> 0 Then L:=L*Num;
Expos:=L;
End;

Function LeadingZero;
var
  s : String;
begin
  Str(w:0,s);
  if Length(s) = 1 then
    s := '0' + s;
  LeadingZero := s;
end;

Begin
Flchar:=' ';
Strfsepe:='\\s';
Easeb:= 'Recompile';
End.