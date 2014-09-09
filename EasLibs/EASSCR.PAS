Unit Easscr;

Interface

Uses Crt;
                   (* Easscr C&Onstants *)
Type
          Srep= (Ym,Nm);

Const     Scrbufsize = 4000 ;

          Normbox    = 0    ;
          Fillmbox   = 1    ;
          Cbox       = 2    ;
          Cboxcontain= 3    ;

          Efont8X8   = 259  ;
          Eblack     = 0    ;
          Eblue      = 1    ;
          Egreen     = 2    ;
          Ecyan      = 3    ;
          Ered       = 4    ;
          Emagenta   = 5    ;
          Ebrown     = 6    ;
          Elightgray = 7    ;
          Edarkgray  = 8    ;
          Elightblue = 9    ;
          Elightgreen= 10   ;
          Elightcyan = 11   ;
          Elightred  = 12   ;
          Elightmagenta = 13;
          Eyellow    = 14   ;
          Ewhite     = 15   ;
          Eblink     = 128  ;

Type
          Scrbuf  = Array[1..Scrbufsize] Of Byte;  (* Screen Buffer For Savescr But 25X80 Routine *)
          Scrbuf1 = Array[1..Scrbufsize*2] Of Byte;(* Screen Buffer For Savescr But 25X80 Routine *)
          Scrbufp = ^ Scrbuf;                      (* Screen Buffer Pointer  *)
Var
          Vseg       :Word;                        (* Video Segment Address *)
          Vsegp      :Scrbufp;                     (* Vidoe Segment Pointer *)
          Wtextattr,                               (* Text Color            *)
          Mwx1,Mwy1,Mbx1,Mby1,Wmaxx,               (* Window And Box        *)
          Mwx2,Mwy2,Mbx2,Mby2,Wmaxy,               (*  Coordinates          *)
          Tmb,                                     (* Temp Byte             *)
          Maxx,Maxy,Curdpage,
          Curdmode:Byte;                           (* Current Text Mode     *)
          Boxborder  :Array[1..6] Of Char;         (* Box Border Array      *)
          Mwindowon  :Boolean;                     (* Check If Window On    *)
          Qcurvmode  : Byte   Absolute $40:$49;    { Current Video Mode }
          Qscurvmode : Word   Absolute $40:$4C;    { Size Of Video Buffer Region }
          Qcurdpage  : Byte   Absolute $40:$62;    { Current Display Page }
          Qmaxy      : Word   Absolute $40:$4A;    { Max Y }
          Qmaxx      : Byte   Absolute $40:$84;    { Max Y }
          Page2      : ScrBuf Absolute $B900:$0000;{ memory screen pages}
          Page3      : ScrBuf Absolute $B900:$1000;{                    }
          Isavexy  :Array[0..20] Of Array [2..3] Of Byte;

                  (* Easscr P&Rocdures *)

Procedure Settmode(M:Byte);                             (* Set Text Mode           *)
Procedure W2Clch(W:Word;Var Cl:Byte;Var C:Char);        (* Un Clch2W *)
Procedure Utcoc(Var Color,Fore,Back:Byte);              (* Un Tcoc             *)
Procedure Fillscreenwith(A:Byte;C:Char);                (* Fill The Screen With Specified Char *)
Procedure WritexysA(X,Y,clr:Byte;S:String);             (* Direct Write String To Screen *)
Procedure WritexycA(X,Y,attr:Word;C:Char);              (* Direct Char String To Screen *)
Procedure Writexys(X,Y:Byte;S:String);                  (* Direct Write String To Screen *)
Procedure Writexyc(X,Y:Word;C:Char);                    (* Direct Char String To Screen *)
Procedure Writecn(X:Byte;S:String);                     (* Write At The Center Of Screen *)
Procedure Mbox(T,T1,X1,Y1,X2,Y2:Byte );                 (* Creates A Box *)
Procedure Bck(C:Srep);                                  (* Back The Cursor*)
Procedure Fbck(C:Srep);                                 (* Forward The Cursor *)
Procedure Mbck(C:Srep;I:Byte);                          (* Executes Bck As Much As I *)
Procedure Mwindow(X1,Y1,X2,Y2:Byte   );                 (* Make A Window *)
Procedure Mwindowbox(T,T1,X1,Y1,X2,Y2: Byte  );         (* Creates A Window In A Box *)
{
Procedure Adjustxxyy(Var X1,Y1,X2,Y2:Byte);             (* Adjusts Window Coordination *)
Procedure Adjustxy(Var X,Y:Byte);                       (* Adjusts Cursor Coordination *)
}
Procedure MemLxy(x,y:byte);                             (*  Memory  x,y modifing *)
Procedure Lxy(X,Y:Byte);                                (* Goto Y X *)
Procedure Ilxy(X,Y:Integer);                            (* Lxy In Mwindow As If Normal *)
Procedure Wlxy(X,Y:Integer);                            (* Goto X Y *)
Procedure Getchara(X,Y:Byte;Var C:Char;Var Cl:Byte);    (* Get Ch & Color At Locx,Locy*)
Procedure Loadiecs(Var F:Scrbufp);                      (* Load Ecs To Page 0 *)
Procedure Saveiecs(F:String);                           (* Save Page 0 To File *)
Procedure W29h(S:String);                               (* DOS Fast Character Int 29h *)
Procedure W09H(S:String;Clr:Byte);                      (* Write String Using BIOS INT 10,9 *)
Procedure Writever(A:String;C:Byte);                    (* Write String In A Horizontal Way *)
Procedure Clseol;                                       (* Clear End-Of-Line *)
Procedure Cls;                                          (* Clear The Screen *)
Procedure Clsc;                                         (* Clear The Screen With Black Back Ground *)
Procedure Savescr(Var Buf);                             (* Saves The Hole Screen *)
Procedure Restscr(Var Buf);                             (* Restore The Hole Screen *)
Procedure Savewindow(Var Buffer;Y,X,Sy,Sx:Integer);     (* Save A Part Of Screen *)
Procedure Restwindow(Var Buffer;Y,X,Sy,Sx:Integer);     (* Save A Part Of Screen *)
Procedure Savexy(Ln:Byte);                              (* Save Locx,Locy *)
Procedure Restxy(Ln:Byte);                              (* Restore Saved Locx,Locy By Savexy  *)
Procedure Scrollud(X1,Y1,X2,Y2,Clr:Byte);               (* Scroll Up or Down *)
Procedure Scr_ScrollUp;                                 (* Scroll window 1 line UP *)
Procedure Scr_ScrollDown;                               (* Scroll window 1 line UP *)
Procedure Getmaxxy;                                     (* Gets X , Y Coordination *)
Procedure SetCursor(hio,loo:byte);
                  (* Easscr F&Unction *)

Function Tcoc(Fore,Back:Byte):Byte;                     (* Conv. 2 Colors To 1 C*)
Function Hilite(X,Y1,Y2,Attr:Integer):String;           (* Hilites Screen Position *)
Function Clch2W(Cl:Byte;C:Char):Word;                   (* Conv Ch And Cl To Word *)
Function Locx:Byte;                                     (* Gets X Coord.*)
Function Locy:Byte;                                     (* Gets Y Coord.*)
Implementation
Var                      (* Iv& In Variables *)
        Dump:Byte;

Function Tcoc;
Begin;
Tcoc:=Fore+(Back Shl 4);
End;
Function Clch2W;
Begin;
Clch2W := ( Cl ) Shl 8 + Ord(C);
End;
Procedure SetCursor;assembler;
asm
    mov ah,01
    mov ch,hio
    mov cl,loo
    int 10h
End;
Function Hilite;
Var
    S:String;
    C:Char;
    B:Byte;
    i:Byte;
Begin;
S:='';
For i:=Y1 To Y2 Do
    Begin;
    Getchara(X,i,C,B);
    if (attr<>-1) then Writexysa(X,i,attr,C);
    S:=S+C;
    End;
Hilite:=S;
End;
Function Locx;
Begin
If Mwindowon=False Then Locx:=Crt.Wherey;
If Mwindowon=True  Then Locx:=Crt.Wherey+Mwx1-1;
End;
Function Locy;
Begin
If Mwindowon=False Then Locy:=Crt.Wherex;
If Mwindowon=True  Then Locy:=Crt.Wherex+Mwy1-1;
End;
Procedure Utcoc;
Begin;
      Back:= Color Shr 4;
      Fore:= Color - (Back Shl 4);
End;
Procedure W2Clch;
Begin;
Cl:= W Shr 8;
C:=Chr ( W - ( Cl Shl 8 ) );
End;
Procedure Swapbyte(Var B1,B2:Word);
Var W:Word;
Begin;
W:=B2;
B2:=B1;
B1:=W;
End;
Procedure Settmode;Assembler;
Asm
    Mov Ah,00
    Mov Al,M
    Int 10H
End;
Procedure Cls;
Begin;
Textattr:=WtextAttr;
Clrscr;
End;
Procedure Clsc;
Begin;
Wtextattr:=Tcoc(7,0);
Cls;
End;

Procedure Savexy;
Begin;
Isavexy[Ln,2]:=Wherex;
Isavexy[Ln,3]:=Wherey;
End;

Procedure Restxy;
Begin;
Gotoxy(Isavexy[Ln,2],Isavexy[Ln,3]);
End;

Procedure Clseol;
Begin;
Clreol;
End;
{
Procedure Adjustxy;
Var
       Lm,Ly:Byte;
Begin;
Lm:=Lastmode;
 If Y>=81 Then  Begin Y:=Y-80;
                      Inc(X);
                      End Else

 If Y<=0  Then  Begin Dec(X);
                      Inc(Y,80);
                      End Else

If  Lm = 3 Then
    If (X=25) And (Y>=80) Then Begin
    X:=1;
    Y:=1
    End;
End;
}
Procedure Fillscreenwith;

Var Sb:Scrbuf;
Begin;

Fillchar( Sb , Scrbufsize , Tcoc( A, Ord (C) ));
Move ( Sb , Vsegp ^ , Scrbufsize);

End;
Procedure Mwindowbox;
Begin;
Mbox(T,T1,X1,Y1,X2,Y2);
Inc(X1);   Inc(Y1);
Dec(X2);   Dec(Y2);
Mwindow(X1,Y1,X2,Y2);
Mwx1:=X1;  Mwy1:=Y1;
Mwx2:=X2;  Mwy2:=Y2;
End;
Procedure Mwindow;
Begin;
{Mwindowon:=True;}
Wmaxx:=(X2-X1);
Wmaxy:=(Y2-Y1);
tmb:=textattr;
Textattr:=Wtextattr;
Window(Y1,X1,Y2,X2);
Mwx1:=X1;
Mwx2:=X2;
Mwy1:=Y1;
Mwy2:=Y2;
TextAttr:=tmb;
End;
Procedure Savescr;
Begin;
Move ( Vsegp ^ , Buf , Scrbufsize );
End;
Procedure Restscr;
Begin;
Move ( Buf , Vsegp ^ , Scrbufsize );
End;
{
Procedure Adjustxxyy;
Begin;
Getmaxxy;
If (X1 = 0) Or (X1>=X2) Then X1:=1;
If (Y1 = 0) Or (Y1>=Y2) Then Y1:=1;
If (X2 = 0) Or (X2<=X1) Then X2:=Maxx;
If (Y2 = 0) Or (Y2<=Y1) Then Y2:=Maxy;
If Y2 > Maxy Then Y2:=Maxy;
If X2 > Maxx Then X2:=Maxx;
End;
}
Procedure Mbox;
Label
      Jmpskip;

Var   Adjok:Boolean;
      X,Y:Byte;
Begin;
(* Clear Or Draw ? *)
Case T1 Of
Cbox      : Goto Jmpskip;
Cboxcontain: Goto Jmpskip;
End;
(* End C.O.D *)

(* Box Type Case *)
Case T  Of
1    : Begin
        Boxborder[1]:='É';
        Boxborder[2]:='»';
        Boxborder[3]:='Í';
        Boxborder[4]:='È';
        Boxborder[5]:='¼';
        Boxborder[6]:='º';
        End;
2    : Begin
        Boxborder[1]:='Ú';
        Boxborder[2]:='¿';
        Boxborder[3]:='Ä';
        Boxborder[4]:='À';
        Boxborder[5]:='Ù';
        Boxborder[6]:='³';
        End;
3    : Begin
        Boxborder[1]:='Ö';
        Boxborder[2]:='·';
        Boxborder[3]:='Ä';
        Boxborder[4]:='Ó';
        Boxborder[5]:='½';
        Boxborder[6]:='º';
        End;
4    : Begin
        Boxborder[1]:='Õ';
        Boxborder[2]:='¸';
        Boxborder[3]:='Í';
        Boxborder[4]:='Ô';
        Boxborder[5]:='¾';
        Boxborder[6]:='³';
        End;
5    : Begin
        Boxborder[1]:='þ';
        Boxborder[2]:='þ';
        Boxborder[3]:='Ä';
        Boxborder[4]:='þ';
        Boxborder[5]:='þ';
        Boxborder[6]:='³';
        End;
6    : Begin
        Boxborder[1]:='þ';
        Boxborder[2]:='þ';
        Boxborder[3]:='Í';
        Boxborder[4]:='þ';
        Boxborder[5]:='þ';
        Boxborder[6]:='º';
        End;
7    : Begin
        Boxborder[1]:='+';
        Boxborder[2]:='+';
        Boxborder[3]:='-';
        Boxborder[4]:='+';
        Boxborder[5]:='+';
        Boxborder[6]:='|';
        End;
      Else
        Begin
        Boxborder[1]:='/';
        Boxborder[2]:='\';
        Boxborder[3]:='Ä';
        Boxborder[4]:='\';
        Boxborder[5]:='/';
        Boxborder[6]:='³';
        End;
    End; (* End Case *)
(* Adjust X Y *)
{Adjustxxyy(X1,Y1,X2,Y2);}
Mbx1:=X1;
Mbx2:=X2;
Mby1:=Y1;
Mby2:=Y2;
(* End Adjust *)
Writexyc(X1,Y1,Boxborder[1]);
Writexyc(X1,Y2,Boxborder[2]);
Writexyc(X2,Y1,Boxborder[4]);
Writexyc(X2,Y2,Boxborder[5]);
For Tmb:=1 To (Y2-Y1-1) Do Writexyc(X1,(Y1+Tmb),Boxborder[3]);
For Tmb:=1 To (Y2-Y1-1) Do Writexyc(X2,(Y1+Tmb),Boxborder[3]);
For Tmb:=1 To (X2-X1-1) Do Writexyc((X1+Tmb),Y1,Boxborder[6]);
For Tmb:=1 To (X2-X1-1) Do Writexyc((X1+Tmb),Y2,Boxborder[6]);
(* Box Colors *)
Jmpskip:
Case T1 Of
Fillmbox : Begin
           Dec(X2);
           Dec(Y2);
        For X:=1  To (X2-X1)  Do Begin
        For Y:=1  To (Y2-Y1)  Do Begin
        Writexyc(X1+X,Y1+Y,' ');
        End;
        End;
        End;
Cbox     : Begin
        Tmb:=Wtextattr;
        Wtextattr:=Tcoc(7,0);
        For X:=X1  To X2  Do Begin
        For Y:=Y1  To Y2  Do Begin
        Writexyc(X,Y,' ');
        End;
        End;
        Wtextattr:=Tmb;
        End;
Cboxcontain : Begin
        Tmb:=Wtextattr;
        Wtextattr:=Tcoc(7,0);
        For X:=(X1+1)  To (X2-1)  Do Begin
        For Y:=(Y1+1)  To (Y2-1)  Do Begin
        Writexyc(X,Y,' ');
        End;
        End;
        Wtextattr:=Tmb;
        End;
        End;
End;

Procedure Getchara;
Var

  Loc    : Word;

Begin
   Loc :=( (X*80) - (80-Y) -1 ) * 2;
   { This To Get }
   Move(Ptr(Vseg,Loc   ) ^, C , 1);
   Move(Ptr(Vseg,Loc+1 ) ^, Cl, 1);
   { This To Write}

   {

   Word     Color              Char
   Ch  := ( Textattr ) Shl 8 + Ord(C);
   Loc :=( (X*80) - (80-Y) -1 ) * 2;
   Move(Ch,Ptr($B800,Loc )^ ,2);

   }

   End;
Procedure Restwindow;Assembler;
Label
  L;
Asm
  Push  Ds
  Mov   Cx,Sx
  Lds   Si,Buffer
  Mov   Di,X
  Dec   Di
  Shl   Di,1
  Mov   Ax,160
  Mov   Dx,Y
  Dec   Dx
  Mul   Dx
  Add   Di,Ax
  Mov   Es,Vseg
  Mov   Dx,Di
  Mov   Bx,Sy
L:
  Rep   Movsw
  Add   Dx,160
  Mov   Di,Dx
  Mov   Cx,Sx
  Dec   Bx
  Jnz   L
  Pop   Ds
End;
Procedure Savewindow;Assembler;
Label
  L;
Asm
  Push  Ds
  Mov   Cx,Sx
  Les   Di,Buffer
  Mov   Si,X
  Dec   Si
  Shl   Si,1
  Mov   Ax,160
  Mov   Dx,Y
  Dec   Dx
  Mul   Dx
  Add   Si,Ax
  Mov   Ds,Vseg
  Mov   Dx,Si
  Mov   Bx,Sy
  Mov   Cx,Sx
L:
  Rep   Movsw
  Add   Dx,160
  Mov   Si,Dx
  Mov   Cx,Sx
  Dec   Bx
  Jnz   L
  Pop   Ds
End;

Procedure Writexyc;Assembler;
Asm
  Mov   Es,VSeg
  Mov   Ax,X
  Dec   Ax
  Mov   Bx,160
  Mul   Bx
  Mov   Di,Y
  Dec   Di
  Shl   Di,1
  Add   Di,Ax
  Mov   Ah,Wtextattr
  Mov   Al,C
  Stosw
End;
Procedure Saveiecs;
Var
     Infile:File;
Begin;
Assign(Infile,F);
Rewrite(Infile,1);
Blockwrite(Infile, Vsegp ^ , Scrbufsize);
Close(Infile);
End;
Procedure Writever;
Var X,Y,I:Byte;
    K:Char;
Begin;
    X:=Locx;
    Y:=Locy;

For I:=1 To Length(A) Do Begin
    K:=A[I];
    If C = 1 Then Writexyc(X,Y,K);
    If C = 2 Then Writexyc(X,Y+1,K);
    Inc(X);
    If Not C=1 Then Inc(Y);
    End;
End;
Procedure W29h;Assembler;
  ASM
       PUSH     DS
       PUSH     BP
        LDS      SI,[S]
        XOR      CH,CH
        MOV      CL,[SI]
      @@1:
        INC     SI
        MOV     AL,[SI]
        INT     29h
      LOOP    @@1

       POP      BP
       POP      DS
  END;

Procedure W09H;Assembler;
 Asm
     Push       DS
     Push       Bp

     Lds Si,s
     Mov dh,0
     Mov dl,Byte Ptr [si]
     Mov Cx,1
 @@rep:
     Inc Si
     Mov Ah,9
     Mov Bh,0
     Mov Bl,Clr
     Mov al,[si]
     Int 10h
     Push Dx
     Mov Ah,3
     Mov Bh,0
     Int 10h
     Inc Dl
     Mov Ah,2
     Int 10h
     Pop Dx
     Mov Cx,1
     Dec Dx
     Cmp Dx,0
 Jne @@rep
     Pop  Bp
     Pop  DS
End;

Procedure Ilxy;
Begin;

If (X In [Mwx1..Mwx2]) And (Y In [Mwy1..Mwy2])
   Then Wlxy(X-Mwx1+1,Y-Mwy1+1);
End;
Procedure Getmaxxy;
Begin;
Maxx:=Qmaxx;
Maxy:=Qmaxy;
Inc(Maxx);
If Mwindowon=True Then
   Begin
   Maxy:=Mwy2-Mwy1+1;
   Maxx:=Mwx2-Mwx1;
   End;

End;
Procedure Wlxy;
Begin;
Gotoxy(Y,X);
End;
Procedure Lxy;
Begin;
{Adjustxy(X,Y);}
Gotoxy(Y,X);
End;
Procedure MemLxy;
  var
      c:char;
      b:byte;
 Begin;
 {

 GetChara(x,y,c,b);
 }
 Dec(x);
 Dec(y);
 Byte(Ptr($40,$50)^):=y;
 Byte(Ptr($40,$51)^):=x;
 {
 write(#0,#8,#0,#8);
 Inc(x);
 Inc(y);
 writexyca(x,y,b,c);
 }
 End;
Procedure Bck;
Begin
If C=Ym Then Begin
             Lxy(Locx,Locy-1);
             Write(' ');
             Lxy(Locx,Locy-1);
             End;
If C=Nm Then Lxy(Locx,Locy-1);
End;

Procedure Mbck;
Var I1:Byte;
Begin;
For I1:=1 To I Do Bck(C);
End;
Procedure Scrollud;
Var
    Ln:Byte;
Begin;
If Not (Tmb In [6,7]) Then Tmb:=6;
Ln:=X2-X1;
Inc(Ln);
Dec(X1);
Dec(Y1);
Dec(X2);
Dec(Y2);
 Asm
    Mov Ah,Tmb
    Mov Al,Ln
    Mov Bh,Clr
    Mov Ch,X1
    Mov Cl,Y1
    Mov Dh,X2
    Mov Dl,Y2
    Int 10H
 End;
End;

Procedure Fbck;
Begin
If C = Ym Then Write(' ');
If C = Nm Then Lxy(Locx,Locy+1);
End;

Procedure Writecn;
Begin
Getmaxxy;
If Mwindowon=False Then
         Writexys(X,( Maxy - Length(S )) Div 2 , S )
   Else
         Writexys(X,( (Mby2-Mby1) - Length(S) ) Div 2 , S )
End;

Procedure Loadiecs;
Begin;
Move ( F ^ , Vsegp ^ , Scrbufsize);
End;
Procedure Writexys;
Var
  I : Byte;
Begin;
  For I := 0 To Length(S)-1 Do
  Writexyc( X , Y+I,S[I+1]);
End;
Procedure Writexyca;Assembler;
Asm
  Mov   Es,VSeg
  Mov   Ax,X
  Dec   Ax
  Mov   Bx,160
  Mul   Bx
  Mov   Di,Y
  Dec   Di
  Shl   Di,1
  Add   Di,Ax
  Mov   Ah,byte ptr Attr
  Mov   Al,C
  Stosw
End;
Procedure Writexysa;
Var
  I : Byte;
Begin;
  For I := 0 To Length(S)-1 Do
  Writexyca( X , Y+I,clr,S[I+1]);
End;

Procedure Scr_ScrollUp;
Begin;
SaveXy(0);
Lxy(1,1);
DelLine;
RestXy(0);
End;

Procedure Scr_ScrollDown;
Begin;
SaveXy(0);
Lxy(1,1);
InsLine;
RestXy(0);
End;

                  (* Easscr I&Nit Part *)
Begin;

 Vseg := $B800;
 Vsegp:=Ptr(Vseg,0);
 Maxx :=25;
 Maxy :=80;
  Wtextattr:= Textattr;       (* Text Color = Default         *)
  Mwindowon:= False;          (* Window Off                   *)
  Getmaxxy;
  Mbx1:=1;Mwx1:=1;            (*   Box And Window             *)
  Mby1:=1;Mwy1:=1;            (*                              *)
  Mbx2:=Maxx;Mwx2:=Maxx;      (*  Default Coordinates         *)
  Mby2:=Maxy;Mwy2:=Maxy;      (*                              *)
End.
