Unit Eastry;
Interface
Type Rep=(Ym,Nm);

Procedure Readmc(T:Byte;Auto:Rep;Maxn:Byte;Wc,Bf:Char;Var Sr:String;Var Nr:Longint);

Implementation
Uses EasScr,
     EasStr,
     Crt;

Procedure Readmc;
Const Bs        = ^H;
      Lf        = ^J;
      Cr        = ^M;
      Ent       =Cr+Lf;
      Esc       =^[;
Var I,I1,Po,Curcolor,Chcolor:Byte;
    K,K1:Char;
    A,B,Saveds:String;
    Alli:Integer;
Label B1,B2,B3;
Begin;
If T=1 Then Begin {File Type}
B1:
A:='';
For I:=1 To (Maxn-1) Do Write(Bf);
Lxy(Locx,Locy-I);
I:=0;
Chcolor:=0;
While I<(Maxn+1) Do Begin
K:=Readkey;
Case K Of
 Esc     : Goto B1;
 ^S      : Saveds:=A;
 ^C      : Inc(Chcolor);
 ^B      : Begin Chcolor:=0;
                 Normvideo;
                 End;
'A'..'Z' : Begin If Not(Chcolor=0) Then Textattr:=Chcolor;
           If Wc='D' Then Write(K) Else Write(Wc);
           Inc(I);Insert(K,A,I);End;
'A'..'Z' : Begin If Not(Chcolor=0) Then Textattr:=Chcolor;;
           If Wc='D' Then Write(K) Else Write(Wc);
           Inc(I);Insert(K,A,I);End;
'0'..'9' : Begin If Not(Chcolor=0) Then Textattr:=Chcolor;;
           If Wc='D' Then Write(K) Else Write(Wc);
           Inc(I);Insert(K,A,I);End;
 Cr      : Break;
 Bs      : Begin If I=0 Then Goto B1 Else
           Lxy(locx,locy-1);Write(' ');Lxy(locx,locy-1);Write(Bf);Lxy(locx,locy-1);Delete(A,I,1);Dec(I);End;
End;
If Auto = Nm Then If I=255  Then I:=0;
If Auto = Nm Then If I=Maxn Then Begin
                                 Delete(A,I,1);
                                 Dec(I);
                                 Lxy(locx,locy-1);Write(' ');Lxy(locx,locy-1);
                                 End;
End;
Sr:=A;
Nr:=0;
Normvideo;
End;
If T=2 Then Begin { String Type }
B2:
A:='';
For I:=1 To Maxn-1 Do Write(Bf);
Lxy(Locx,Locy-I);
I:=0;
While I<Maxn+1 Do Begin
K:=Readkey;
Case K Of
 Esc     : Begin For Alli:=1 To Length(A) Do Lxy(locx,locy-1);Write(' ');Lxy(locx,locy-1);Goto B2 End;
 ^I      : Break;
'!'..'ÿ' : Begin If Wc='D' Then Write(K) Else Write(Wc);
           Inc(I);Insert(K,A,I);End;
 ' '     : Begin If Wc='D' Then Write(K) Else Write(Wc);
           Inc(I);Insert(K,A,I);End;
 Cr      : Break;
 Bs      : Begin If I=0 Then Goto B2 Else
           Lxy(locx,locy-1);Write(' ');Lxy(locx,locy-1);Write(Bf);Lxy(locx,locy-1);Delete(A,I,1);Dec(I);End;
End;
If Auto = Nm Then If I=255 Then I:=0;
If Auto = Nm Then If I=Maxn Then Begin Delete(A,I,1);Dec(I);Lxy(locx,locy-1);Write(' ');Lxy(locx,locy-1); End;
End;
Sr:=A;
Nr:=0;
End;
If T=3 Then Begin { Number Type }
B3:
A:='';
If Maxn >= 11 Then Maxn:=11;
For I:=1 To Maxn-1 Do Write(Bf);
Lxy(Locx,Locy-I);
I:=0;
While I<Maxn+1 Do Begin
K:=Readkey;
Case K Of
 Esc     : Goto B3;
'0'..'9' : Begin If Wc='D' Then Write(K) Else Write(Wc);
           Inc(I);Insert(K,A,I);End;
 Cr      : Break;
 Bs      : Begin If I=0 Then Goto B3 Else
           Lxy(locx,locy-1);Write(' ');Lxy(locx,locy-1);Write(Bf);Lxy(locx,locy-1);Delete(A,I,1);Dec(I);End;
End;
If Auto = Nm Then If I=255 Then I:=0;
If Auto = Nm Then If I=Maxn Then Begin Delete(A,I,1);Dec(I);Lxy(locx,locy-1);Write(' ');Lxy(locx,locy-1); End;
End;
Sr:='';
Nr:=Str2Num(A);
End;
End;

End.
