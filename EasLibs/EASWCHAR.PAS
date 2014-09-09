UNIT EASWCHAR;
INTERFACE
USES EASSCR;
PROCEDURE WCLASSICF(V:STRING);
PROCEDURE WLINEF(V:STRING);
PROCEDURE WLARGF(V:STRING);
PROCEDURE WTRANSF(V:STRING);
IMPLEMENTATION
CONST BS=^H;
PROCEDURE WRITEITLL(A,B,C,D,E,F,G:STRING);
BEGIN
WRITE(A);
LXY(LOCX+1,LOCY-9);
WRITE(B);
LXY(LOCX+1,LOCY- 9);
WRITE(C);
LXY(LOCX+1,LOCY- 9);
WRITE(D);
LXY(LOCX+1,LOCY- 9);
WRITE(E);
LXY(LOCX+1,LOCY- 9);
WRITE(F);
LXY(LOCX+1,LOCY- 9);
WRITE(G);
LXY(LOCX+1,LOCY- 9);
LXY(LOCX-7,LOCY+13);
END;
PROCEDURE WRITEITL(A,B,C,D,E,F,G:STRING);
BEGIN
WRITE(A);
LXY(LOCX+1,LOCY-8);
WRITE(B);
LXY(LOCX+1,LOCY-8);
WRITE(C);
LXY(LOCX+1,LOCY-8);
WRITE(D);
LXY(LOCX+1,LOCY-8);
WRITE(E);
LXY(LOCX+1,LOCY-8);
WRITE(F);
LXY(LOCX+1,LOCY-8);
WRITE(G);
LXY(LOCX+1,LOCY-8);
LXY(LOCX-7,LOCY+9);
END;
PROCEDURE WRITEIT(A,B,C,D:STRING);
BEGIN
WRITE(A);
LXY(LOCX+1,LOCY-3);
WRITE(B);
LXY(LOCX+1,LOCY-3);
WRITE(C);
LXY(LOCX+1,LOCY-3);
WRITE(D);
LXY(LOCX-3,LOCY+1);
END;
PROCEDURE WCLASSICF;
VAR S,A:STRING;
    C:CHAR;
    I:INTEGER;
    D:ARRAY[1..10] OF STRING;
BEGIN
FOR I:=1 TO LENGTH(V) DO
BEGIN
C:=V[I];
CASE C OF
^C:CLS;
^R:LXY(1,1);
'/':BEGIN WRITELN;WRITELN;WRITELN;WRITELN
END;
' ':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='   ';
D[4]:='   ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'\':BEGIN
LXY(LOCX,LOCY-4);
Write('   ');
LXY(LOCX+1,LOCY-3);
Write('   ');
LXY(LOCX+1,LOCY-3);
Write('   ');
LXY(LOCX+1,LOCY-3);
Write('   ');
LXY(LOCX-3,LOCY-3);
END;
'A' :BEGIN
D[1]:='⁄ƒ‹';
D[2]:='√ƒ€';
D[3]:='≥ €';
D[4]:='Ÿ ﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'B':BEGIN
D[1]:='‹ƒø';
D[2]:='€ƒ¥';
D[3]:='€ ≥';
D[4]:='ﬂƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'C':BEGIN
D[1]:='‹ƒø';
D[2]:='€  ';
D[3]:='€  ';
D[4]:='ﬂƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'D':BEGIN
D[1]:='⁄ƒ‹';
D[2]:='≥ €';
D[3]:='≥ €';
D[4]:='¿ƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'E':BEGIN
D[1]:='‹ƒƒ';
D[2]:='€ƒ ';
D[3]:='€  ';
D[4]:='ﬂƒƒ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'F':BEGIN
D[1]:='‹ƒƒ';
D[2]:='€ƒ ';
D[3]:='€  ';
D[4]:='ﬂ  ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'G':BEGIN
D[1]:='⁄ƒø';
D[2]:='≥  ';
D[3]:='≥ ‹';
D[4]:='¿ƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'H':BEGIN
D[1]:='‹ ¬';
D[2]:='€ƒ¥';
D[3]:='€ ≥';
D[4]:='ﬂ ¡';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'I':BEGIN
D[1]:='‹';
D[2]:='€';
D[3]:='€';
D[4]:='ﬂ';
WRITE(D[1]);
LXY(LOCX+1,LOCY-1);
WRITE(D[2]);
LXY(LOCX+1,LOCY-1);
WRITE(D[3]);
LXY(LOCX+1,LOCY-1);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'J':BEGIN
D[1]:='  ‹';
D[2]:='  €';
D[3]:='  €';
D[4]:='¿ƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'K':BEGIN
D[1]:='ø ‹';
D[2]:='≥ ≥';
D[3]:='€ƒ¥';
D[4]:='ﬂ ¿';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'L':BEGIN
D[1]:='‹  ';
D[2]:='€  ';
D[3]:='€  ';
D[4]:='ﬂƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'M':BEGIN
D[1]:='⁄ƒ‹ƒ‹';
D[2]:='≥ € €';
D[3]:='≥   €';
D[4]:='¡   ﬂ';
WRITE(D[1]);
LXY(LOCX+1,LOCY-5);
WRITE(D[2]);
LXY(LOCX+1,LOCY-5);
WRITE(D[3]);
LXY(LOCX+1,LOCY-5);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'N':BEGIN
D[1]:='⁄ƒ‹';
D[2]:='≥ €';
D[3]:='≥ €';
D[4]:='¡ ﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'O':BEGIN
D[1]:='‹ƒø';
D[2]:='€ ≥';
D[3]:='€ ≥';
D[4]:='ﬂƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'P':BEGIN
D[1]:='‹ƒø';
D[2]:='€ ≥';
D[3]:='€ƒŸ';
D[4]:='ﬂ  ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'Q':BEGIN
D[1]:='⁄ƒ‹';
D[2]:='≥ €';
D[3]:='≥\€';
D[4]:='¿ƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'R':BEGIN
D[1]:='‹ƒø';
D[2]:='€\≥';
D[3]:='€ ≥';
D[4]:='ﬂ ¿';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'S':BEGIN
D[1]:='‹ƒø';
D[2]:='ﬂƒø';
D[3]:='  ≥';
D[4]:='ﬂƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'T':BEGIN
D[1]:='ƒ‹ƒ';
D[2]:=' € ';
D[3]:=' € ';
D[4]:=' ﬂ ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'U':BEGIN
D[1]:='⁄ ‹';
D[2]:='≥ €';
D[3]:='≥ €';
D[4]:='¿ƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'V':BEGIN
D[1]:='‹ ⁄';
D[2]:='€ ≥';
D[3]:='€ ≥';
D[4]:='ﬂﬂæ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'W':BEGIN
D[1]:='⁄   ‹';
D[2]:='≥   €';
D[3]:='≥ € €';
D[4]:='¿ƒﬂƒﬂ';
WRITE(D[1]);
LXY(LOCX+1,LOCY-5);
WRITE(D[2]);
LXY(LOCX+1,LOCY-5);
WRITE(D[3]);
LXY(LOCX+1,LOCY-5);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'X':BEGIN
D[1]:='ƒ‹ƒ';
D[2]:=' € ';
D[3]:=' € ';
D[4]:='ƒﬂƒ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'Y':BEGIN
D[1]:='ø ‹';
D[2]:='≥ €';
D[3]:='¿ƒ€';
D[4]:='¿ƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'Z':BEGIN
D[1]:='‹ƒø';
D[2]:='⁄ƒŸ';
D[3]:='≥  ';
D[4]:='¿ƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'a':BEGIN
D[1]:='   ';
D[2]:='⁄ƒ‹';
D[3]:='⁄ƒ€';
D[4]:='¿ƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'b':BEGIN
D[1]:='‹  ';
D[2]:='€ƒø';
D[3]:='€ ≥';
D[4]:='ﬂƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'c':BEGIN
D[1]:='   ';
D[2]:='‹ƒø';
D[3]:='€  ';
D[4]:='ﬂƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'd':BEGIN
D[1]:='  ‹';
D[2]:='⁄ƒ€';
D[3]:='≥ €';
D[4]:='¿ƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'e':BEGIN
D[1]:='   ';
D[2]:='‹ƒø';
D[3]:='€ƒŸ';
D[4]:='ﬂƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'f':BEGIN
D[1]:='‹ƒø';
D[2]:='€ƒ ';
D[3]:='€  ';
D[4]:='ﬂ  ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'g':BEGIN
D[1]:='⁄ƒ‹';
D[2]:='≥ €';
D[3]:='¿ƒ€';
D[4]:=' ƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'h':BEGIN
D[1]:='‹  ';
D[2]:='€ƒø';
D[3]:='€ ≥';
D[4]:='ﬂ ¡';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'i':BEGIN
D[1]:='';
D[2]:='‹';
D[3]:='€';
D[4]:='ﬂ';
WRITE(D[1]);
LXY(LOCX+1,LOCY-1);
WRITE(D[2]);
LXY(LOCX+1,LOCY-1);
WRITE(D[3]);
LXY(LOCX+1,LOCY-1);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'j':BEGIN
D[1]:='  ';
D[2]:='  ‹';
D[3]:='  €';
D[4]:='ﬂƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'k':BEGIN
D[1]:='ø  ';
D[2]:='≥ ‹';
D[3]:='€ƒ¥';
D[4]:='ﬂ ¿';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'l':BEGIN
D[1]:='‹‹ ';
D[2]:=' € ';
D[3]:=' € ';
D[4]:=' ﬂ ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'm':BEGIN
D[1]:='     ';
D[2]:='¬ƒ‹ƒ‹';
D[3]:='≥ € €';
D[4]:='¡ ﬂ ﬂ';
WRITE(D[1]);
LXY(LOCX+1,LOCY-5);
WRITE(D[2]);
LXY(LOCX+1,LOCY-5);
WRITE(D[3]);
LXY(LOCX+1,LOCY-5);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'n':BEGIN
D[1]:='   ';
D[2]:='¬ƒ‹';
D[3]:='≥ €';
D[4]:='¡ ﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'o':BEGIN
D[1]:='   ';
D[2]:='‹ƒø';
D[3]:='€ ≥';
D[4]:='ﬂƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'p':BEGIN
D[1]:='‹ƒø';
D[2]:='€ ≥';
D[3]:='€ƒŸ';
D[4]:='ﬂ  ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'q':BEGIN
D[1]:='⁄ƒ‹';
D[2]:='≥ €';
D[3]:='¿ƒ€';
D[4]:='  ﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'r':BEGIN
D[1]:='   ';
D[2]:='‹ƒø';
D[3]:='€  ';
D[4]:='ﬂ  ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
's':BEGIN
D[1]:='   ';
D[2]:='‹ƒø';
D[3]:='ﬂƒø';
D[4]:='ﬂƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
't':BEGIN
D[1]:=' ‹ ';
D[2]:='ƒ€ƒ';
D[3]:=' € ';
D[4]:=' ﬂ ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'u':BEGIN
D[1]:='   ';
D[2]:='ø ‹';
D[3]:='≥ €';
D[4]:='¿ƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'v':BEGIN
D[1]:='   ';
D[2]:='‹ ¬';
D[3]:='€ ≥';
D[4]:='ﬂﬂæ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'w':BEGIN
D[1]:='     ';
D[2]:='⁄ ‹ ‹';
D[3]:='≥ € €';
D[4]:='¿ƒﬂƒﬂ';
WRITE(D[1]);
LXY(LOCX+1,LOCY-5);
WRITE(D[2]);
LXY(LOCX+1,LOCY-5);
WRITE(D[3]);
LXY(LOCX+1,LOCY-5);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'x':BEGIN
D[1]:='   ';
D[2]:='ƒ‹ƒ';
D[3]:=' € ';
D[4]:='ƒﬂƒ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'y':BEGIN
D[1]:='¬ ‹';
D[2]:='≥ €';
D[3]:='¿ƒ€';
D[4]:=' ƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'z':BEGIN
D[1]:='   ';
D[2]:='‹ƒø';
D[3]:='⁄ƒŸ';
D[4]:='¿ƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'!':BEGIN
D[1]:='‹  ';
D[2]:='€  ';
D[3]:='ﬂ  ';
D[4]:='ﬂ  ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'&':BEGIN
D[1]:='   ';
D[2]:='⁄ƒƒ';
D[3]:='€ƒ≈';
D[4]:='ﬂƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'1':BEGIN
D[1]:='   ';
D[2]:='ƒ‹ ';
D[3]:=' € ';
D[4]:='ƒﬂƒ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'&':BEGIN
D[1]:='   ';
D[2]:='⁄ƒƒ';
D[3]:='€ƒ≈';
D[4]:='ﬂƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'0':BEGIN
D[1]:='   ';
D[2]:='‹ƒ‹';
D[3]:='€ €';
D[4]:='ﬂƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'2':BEGIN
D[1]:='   ';
D[2]:='⁄ƒ‹';
D[3]:='⁄ƒﬂ';
D[4]:='¿ƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'3':BEGIN
D[1]:='   ';
D[2]:='ƒ‹ ';
D[3]:='ƒ€ ';
D[4]:='ƒﬂ ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'4':BEGIN
D[1]:='   ';
D[2]:='≥ ‹';
D[3]:='¿ƒ€';
D[4]:='  ﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'5':BEGIN
D[1]:='   ';
D[2]:='‹ƒƒ';
D[3]:='ﬂƒø';
D[4]:='ƒƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'6':BEGIN
D[1]:='   ';
D[2]:='‹  ';
D[3]:='€ƒø';
D[4]:='ﬂƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'7':BEGIN
D[1]:='   ';
D[2]:='ƒƒ‹';
D[3]:=' ƒ€';
D[4]:='  ﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'8':BEGIN
D[1]:='   ';
D[2]:='⁄ƒø';
D[3]:='€ƒ€';
D[4]:='ﬂƒﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'9':BEGIN
D[1]:='   ';
D[2]:='⁄ƒ‹';
D[3]:='¿ƒ€';
D[4]:='  ﬂ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
':':BEGIN
D[1]:='   ';
D[2]:=' ‹ ';
D[3]:=' ‹ ';
D[4]:='   ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'/':BEGIN WRITELN;WRITELN;WRITELN;WRITELN
END;
'?':BEGIN
D[1]:='‹ƒ‹';
D[2]:=' ‹ﬂ';
D[3]:=' ﬂ ';
D[4]:=' ﬂ ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'.':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='   ';
D[4]:=' ﬂ ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'˙':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='⁄ƒø';
D[4]:='¿ƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
ELSE Write(C);
END;
END;
END;
PROCEDURE WLINEF;
VAR S,A:STRING;
    C:CHAR;
    I:INTEGER;
    D:ARRAY[1..10] OF STRING;
BEGIN
FOR I:=1 TO LENGTH(V) DO
BEGIN
C:=V[I];
CASE C OF
^C:CLS;
^R:LXY(1,1);
'/':BEGIN WRITELN;WRITELN;WRITELN;WRITELN
END;
'\':BEGIN
LXY(LOCX,LOCY-4);
Write('   ');
LXY(LOCX+1,LOCY-3);
Write('   ');
LXY(LOCX+1,LOCY-3);
Write('   ');
LXY(LOCX+1,LOCY-3);
Write('   ');
LXY(LOCX-3,LOCY-3);
END;
' ':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='   ';
D[4]:='   ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'A' :BEGIN
D[1]:='   ';
D[2]:='⁄ƒ∑';
D[3]:='√ƒ∂';
D[4]:='Ÿ ”';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'B':BEGIN
D[1]:='   ';
D[2]:='“ƒø';
D[3]:='«ƒ¥';
D[4]:='–ƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'C':BEGIN
D[1]:='   ';
D[2]:='÷ƒø';
D[3]:='∫  ';
D[4]:='”ƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'D':BEGIN
D[1]:='   ';
D[2]:='¬ƒ∑';
D[3]:='≥ ∫';
D[4]:='¡ƒΩ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'E':BEGIN
D[1]:='   ';
D[2]:='÷ƒƒ';
D[3]:='«ƒ ';
D[4]:='”ƒƒ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'F':BEGIN
D[1]:='   ';
D[2]:='÷ƒƒ';
D[3]:='«ƒ ';
D[4]:='–  ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'G':BEGIN
D[1]:='   ';
D[2]:='⁄ƒø';
D[3]:='≥ ∑';
D[4]:='¿ƒ–';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'H':BEGIN
D[1]:='   ';
D[2]:='“ ¬';
D[3]:='«ƒ¥';
D[4]:='– ¡';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'I':BEGIN
D[1]:=' ';
D[2]:='“';
D[3]:='∫';
D[4]:='–';
WRITE(D[1]);
LXY(LOCX+1,LOCY-1);
WRITE(D[2]);
LXY(LOCX+1,LOCY-1);
WRITE(D[3]);
LXY(LOCX+1,LOCY-1);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'J':BEGIN
D[1]:='   ';
D[2]:='  “';
D[3]:='  ∫';
D[4]:='¿ƒΩ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'K':BEGIN
D[1]:='   ';
D[2]:='ø ÷';
D[3]:='√ƒ¥';
D[4]:='– ¿';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'L':BEGIN
D[1]:='   ';
D[2]:='∑  ';
D[3]:='∫  ';
D[4]:='”ƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'M':BEGIN
D[1]:='     ';
D[2]:='¬ƒ“ƒ∑';
D[3]:='≥ ∫ ∫';
D[4]:='¡   –';
WRITE(D[1]);
LXY(LOCX+1,LOCY-5);
WRITE(D[2]);
LXY(LOCX+1,LOCY-5);
WRITE(D[3]);
LXY(LOCX+1,LOCY-5);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'N':BEGIN
D[1]:='   ';
D[2]:='¬ƒ∑';
D[3]:='≥ ∫';
D[4]:='¡ –';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'O':BEGIN
D[1]:='   ';
D[2]:='÷ƒø';
D[3]:='∫ ≥';
D[4]:='”ƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'P':BEGIN
D[1]:='   ';
D[2]:='“ƒø';
D[3]:='«ƒŸ';
D[4]:='–  ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'Q':BEGIN
D[1]:='   ';
D[2]:='⁄ƒ∑';
D[3]:='≥\∫';
D[4]:='¿ƒ–';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'R':BEGIN
D[1]:='   ';
D[2]:='“ƒø';
D[3]:='«\≥';
D[4]:='– ¿';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'S':BEGIN
D[1]:='   ';
D[2]:='÷ƒø';
D[3]:='”ƒø';
D[4]:='”ƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'T':BEGIN
D[1]:='   ';
D[2]:='ƒ“ƒ';
D[3]:=' ∫ ';
D[4]:=' – ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'U':BEGIN
D[1]:='   ';
D[2]:='ø ÷';
D[3]:='≥ ∫';
D[4]:='¿ƒΩ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'V':BEGIN
D[1]:='   ';
D[2]:='∑ ⁄';
D[3]:='∫ ≥';
D[4]:='»Õæ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'W':BEGIN
D[1]:='     ';
D[2]:='ø   ÷';
D[3]:='≥ ∫ ∫';
D[4]:='¿ƒ–ƒΩ';
WRITE(D[1]);
LXY(LOCX+1,LOCY-5);
WRITE(D[2]);
LXY(LOCX+1,LOCY-5);
WRITE(D[3]);
LXY(LOCX+1,LOCY-5);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'X':BEGIN
D[1]:='   ';
D[2]:='⁄“ø';
D[3]:=' ∫ ';
D[4]:='¿–Ÿ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'Y':BEGIN
D[1]:='   ';
D[2]:='ø ÷';
D[3]:='¿ƒ∂';
D[4]:='¿ƒΩ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'Z':BEGIN
D[1]:='   ';
D[2]:='÷ƒø';
D[3]:='⁄ƒŸ';
D[4]:='¿ƒΩ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'a':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='⁄ƒ∑';
D[4]:='¿ƒ–';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'b':BEGIN
D[1]:='   ';
D[2]:='∑  ';
D[3]:='«ƒø';
D[4]:='”ƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'c':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='÷ƒ ';
D[4]:='”ƒ ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'd':BEGIN
D[1]:='   ';
D[2]:='  ∑';
D[3]:='⁄ƒ∂';
D[4]:='¿ƒΩ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'e':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='÷ø ';
D[4]:='”ƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'f':BEGIN
D[1]:='   ';
D[2]:='÷ƒ ';
D[3]:='◊  ';
D[4]:='–  ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'g':BEGIN
D[1]:='   ';
D[2]:='⁄ƒ∑';
D[3]:='¿ƒ∂';
D[4]:=' ƒΩ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'h':BEGIN
D[1]:='   ';
D[2]:='∑  ';
D[3]:='«ƒø';
D[4]:='– ¡';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'i':BEGIN
D[1]:=' ';
D[2]:='o';
D[3]:='∑';
D[4]:='–';
WRITE(D[1]);
LXY(LOCX+1,LOCY-1);
WRITE(D[2]);
LXY(LOCX+1,LOCY-1);
WRITE(D[3]);
LXY(LOCX+1,LOCY-1);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'j':BEGIN
D[1]:=' o ';
D[2]:=' ∑ ';
D[3]:=' ∫ ';
D[4]:='ƒΩ ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'k':BEGIN
D[1]:='   ';
D[2]:='ø  ';
D[3]:='≥_÷';
D[4]:='– ¿';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'l':BEGIN
D[1]:='   ';
D[2]:='∑  ';
D[3]:='∫  ';
D[4]:='”ƒ ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'l':BEGIN
D[1]:='   ';
D[2]:='∑  ';
D[3]:='∫  ';
D[4]:='”ƒ ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'm':BEGIN
D[1]:='     ';
D[2]:='     ';
D[3]:='¬ƒ“ƒ∑';
D[4]:='¡ – –';
WRITE(D[1]);
LXY(LOCX+1,LOCY-5);
WRITE(D[2]);
LXY(LOCX+1,LOCY-5);
WRITE(D[3]);
LXY(LOCX+1,LOCY-5);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'n':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='¬ƒ∑';
D[4]:='¡ –';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'o':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='÷ƒø';
D[4]:='”ƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'p':BEGIN
D[1]:='   ';
D[2]:='“ƒø';
D[3]:='«ƒŸ';
D[4]:='–  ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'q':BEGIN
D[1]:='   ';
D[2]:='⁄ƒ∑';
D[3]:='¿ƒ∂';
D[4]:='  ”';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'r':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='“ƒ ';
D[4]:='–  ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
's':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:=' ÷ƒ';
D[4]:='ƒΩ ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
't':BEGIN
D[1]:='   ';
D[2]:=' ∑ ';
D[3]:='ƒ◊ƒ';
D[4]:=' ”ƒ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'u':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='ø ÷';
D[4]:='¿ƒΩ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'v':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='∑ ⁄';
D[4]:='»Õæ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'w':BEGIN
D[1]:='     ';
D[2]:='     ';
D[3]:='ø   ÷';
D[4]:='¿ƒ–ƒΩ';
WRITE(D[1]);
LXY(LOCX+1,LOCY-5);
WRITE(D[2]);
LXY(LOCX+1,LOCY-5);
WRITE(D[3]);
LXY(LOCX+1,LOCY-5);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'x':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='ƒ“ƒ';
D[4]:='ƒ–ƒ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'y':BEGIN
D[1]:='   ';
D[2]:='¬ “';
D[3]:='¿ƒ∂';
D[4]:=' ƒΩ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'z':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='ƒ∑ ';
D[4]:=' ”ƒ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'!':BEGIN
D[1]:=' ';
D[2]:='∫';
D[3]:='∫';
D[4]:='';
WRITE(D[1]);
LXY(LOCX+1,LOCY-1);
WRITE(D[2]);
LXY(LOCX+1,LOCY-1);
WRITE(D[3]);
LXY(LOCX+1,LOCY-1);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'&':BEGIN
D[1]:='   ';
D[2]:='⁄ƒƒ';
D[3]:='«ƒ≈';
D[4]:='”ƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'0':BEGIN
D[1]:='   ';
D[2]:='÷ƒ∑';
D[3]:='∫ ∫';
D[4]:='”ƒΩ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'1':BEGIN
D[1]:=' ';
D[2]:='∂';
D[3]:='∫';
D[4]:='–';
WRITE(D[1]);
LXY(LOCX+1,LOCY-1);
WRITE(D[2]);
LXY(LOCX+1,LOCY-1);
WRITE(D[3]);
LXY(LOCX+1,LOCY-1);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'2':BEGIN
D[1]:='   ';
D[2]:='⁄ƒ∑';
D[3]:='⁄ƒΩ';
D[4]:='¿ƒΩ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'3':BEGIN
D[1]:='   ';
D[2]:='ƒ∑ ';
D[3]:='ƒ∂ ';
D[4]:='ƒΩ ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'4':BEGIN
D[1]:='   ';
D[2]:='≥  ';
D[3]:='¿ƒ∂';
D[4]:='  –';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'5':BEGIN
D[1]:='   ';
D[2]:='÷ƒƒ';
D[3]:='”ƒø';
D[4]:='¿ƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'6':BEGIN
D[1]:='   ';
D[2]:='÷ƒ ';
D[3]:='«ƒø';
D[4]:='”ƒŸ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'7':BEGIN
D[1]:='   ';
D[2]:='ƒ∑ ';
D[3]:=' ∂ ';
D[4]:=' – ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'8':BEGIN
D[1]:='   ';
D[2]:='⁄ƒø';
D[3]:='«ƒ∂';
D[4]:='”ƒΩ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'9':BEGIN
D[1]:='   ';
D[2]:='⁄ƒ∑';
D[3]:='¿ƒ∂';
D[4]:='  –';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
':':BEGIN
D[1]:=' ';
D[2]:=' ';
D[3]:='¯';
D[4]:='¯';
WRITE(D[1]);
LXY(LOCX+1,LOCY-1);
WRITE(D[2]);
LXY(LOCX+1,LOCY-1);
WRITE(D[3]);
LXY(LOCX+1,LOCY-1);
WRITE(D[4]);
LXY(LOCX-3,LOCY+1);
END;
'?':BEGIN
D[1]:='   ';
D[2]:='⁄ƒø';
D[3]:='÷ƒŸ';
D[4]:='o  ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
ELSE WRITE(C);
END;
END;
END;
PROCEDURE WLARGF;
VAR S,A:STRING;
    C:CHAR;
    I:INTEGER;
    D:ARRAY[1..10] OF STRING;
BEGIN
FOR I:=1 TO LENGTH(V) DO
BEGIN
C:=V[I];
CASE C OF
^C:CLS;
^R:LXY(1,1);
'/':BEGIN WRITELN;WRITELN;WRITELN;WRITELN;WRITELN;WRITELN;WRITELN;WRITELN
END;
' ':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='        ';
D[4]:='        ';
D[5]:='        ';
D[6]:='        ';
D[7]:='        ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'>':WRITE(' ');
'<':WRITE(BS);
'\':BEGIN
LXY(LOCX,LOCY-9);
Write('         ');
LXY(LOCX+1,LOCY-9);
Write('         ');
LXY(LOCX+1,LOCY-9);
Write('         ');
LXY(LOCX+1,LOCY-9);
Write('         ');
LXY(LOCX+1,LOCY-9);
Write('         ');
LXY(LOCX+1,LOCY-9);
Write('         ');
LXY(LOCX+1,LOCY-9);
Write('         ');
LXY(LOCX+1,LOCY-9);
LXY(LOCX-7,LOCY);
END;
'A':BEGIN
D[1]:=' ‹€€€€‹ ';
D[2]:='ﬁ€ﬂ  ﬂ€›';
D[3]:='ﬁ€    €›';
D[4]:=' €€€€€€ ';
D[5]:='ﬁ€    €›';
D[6]:='ﬁ€    €›';
D[7]:='ﬁ€    €›';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'B':BEGIN
D[1]:='ﬁ€€€€€‹ ';
D[2]:='ﬁ€   ﬂ€›';
D[3]:='ﬁ€   ‹€›';
D[4]:='ﬁ€€€€€› ';
D[5]:='ﬁ€   ﬂ€›';
D[6]:='ﬁ€   ‹€›';
D[7]:='ﬁ€€€€€ﬂ ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'C':BEGIN
D[1]:=' ‹€€€€‹ ';
D[2]:='ﬁ€ﬂ  ﬂ€›';
D[3]:='ﬁ€      ';
D[4]:='ﬁ€      ';
D[5]:='ﬁ€      ';
D[6]:='ﬁ€‹  ‹€›';
D[7]:=' ﬂ€€€€ﬂ ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'D':BEGIN
D[1]:='ﬁ€€€€€‹ ';
D[2]:='ﬁ€   ﬂ€›';
D[3]:='ﬁ€    €›';
D[4]:='ﬁ€    €›';
D[5]:='ﬁ€    €›';
D[6]:='ﬁ€   ‹€›';
D[7]:='ﬁ€€€€€ﬂ ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'E':BEGIN
D[1]:='ﬁ€€€€ﬂ  ';
D[2]:='ﬁ€      ';
D[3]:='ﬁ€      ';
D[4]:='ﬁ€€€    ';
D[5]:='ﬁ€      ';
D[6]:='ﬁ€      ';
D[7]:='ﬁ€€€€‹  ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'F':BEGIN
D[1]:='ﬁ€€€€ﬂ  ';
D[2]:='ﬁ€      ';
D[3]:='ﬁ€      ';
D[4]:='ﬁ€€€    ';
D[5]:='ﬁ€      ';
D[6]:='ﬁ€      ';
D[7]:='ﬁ€      ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'G':BEGIN
D[1]:=' ‹€€€€‹ ';
D[2]:='ﬁ€ﬂ  ﬂ€›';
D[3]:='ﬁ€      ';
D[4]:='ﬁ€  ‹‹‹ ';
D[5]:='ﬁ€  ﬂﬂ€›';
D[6]:='ﬁ€‹  ‹€›';
D[7]:=' ﬂ€€€€ﬂ ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'H':BEGIN
D[1]:='ﬁ€   €› ';
D[2]:='ﬁ€   €› ';
D[3]:='ﬁ€   €› ';
D[4]:='ﬁ€€€€€› ';
D[5]:='ﬁ€   €› ';
D[6]:='ﬁ€   €› ';
D[7]:='ﬁ€   €› ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'I':BEGIN
D[1]:=' ﬁ€€€   ';
D[2]:='  ﬁ€    ';
D[3]:='  ﬁ€    ';
D[4]:='  ﬁ€    ';
D[5]:='  ﬁ€    ';
D[6]:='  ﬁ€    ';
D[7]:=' ﬁ€€€   ';
WLARGF('<<');
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
WLARGF('<<');
END;
'J':BEGIN
D[1]:='      €›';
D[2]:='      €›';
D[3]:='      €›';
D[4]:='      €›';
D[5]:='      €›';
D[6]:='ﬁ€‹  ‹€›';
D[7]:=' ﬂ€€€€ﬂ ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'K':BEGIN
D[1]:='ﬁ€    €›';
D[2]:='ﬁ€   €› ';
D[3]:='ﬁ€  €›  ';
D[4]:='ﬁ€€€›   ';
D[5]:='ﬁ€  €€  ';
D[6]:='ﬁ€   €€ ';
D[7]:='ﬁ€    €€';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'L':BEGIN
D[1]:='ﬁ€      ';
D[2]:='ﬁ€      ';
D[3]:='ﬁ€      ';
D[4]:='ﬁ€      ';
D[5]:='ﬁ€      ';
D[6]:='ﬁ€      ';
D[7]:='ﬁ€€€€€› ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'M':BEGIN
D[1]:='ﬁ€‹     ‹€›';
D[2]:='ﬁ€ﬂ€‹ ‹€ﬂ€›';
D[3]:='ﬁ€  ﬂ€ﬂ  €›';
D[4]:='ﬁ€       €›';
D[5]:='ﬁ€       €›';
D[6]:='ﬁ€       €›';
D[7]:='ﬁ€       €›';
WRITE(D[1]);
LXY(LOCX+1,LOCY-11);
WRITE(D[2]);
LXY(LOCX+1,LOCY-11);
WRITE(D[3]);
LXY(LOCX+1,LOCY-11);
WRITE(D[4]);
LXY(LOCX+1,LOCY-11);
WRITE(D[5]);
LXY(LOCX+1,LOCY-11);
WRITE(D[6]);
LXY(LOCX+1,LOCY-11);
WRITE(D[7]);
LXY(LOCX+1,LOCY-11);
LXY(LOCX-7,LOCY+13);
END;
'N':BEGIN
D[1]:='ﬁ€     €›';
D[2]:='ﬁ€€‹   €›';
D[3]:='ﬁ€ ﬂ€‹ €›';
D[4]:='ﬁ€   ﬂ€€›';
D[5]:='ﬁ€     €›';
D[6]:='ﬁ€     €›';
D[7]:='ﬁ€     €›';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'O':BEGIN
D[1]:=' ‹€€€€€‹ ';
D[2]:='ﬁ€ﬂ   ﬂ€›';
D[3]:='ﬁ€     €›';
D[4]:='ﬁ€     €›';
D[5]:='ﬁ€     €›';
D[6]:='ﬁ€‹   ‹€›';
D[7]:=' ﬂ€€€€€ﬂ ';
WLARGF('<<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'P':BEGIN
D[1]:='ﬁ€€€€€€‹ ';
D[2]:='ﬁ€    ﬂ€›';
D[3]:='ﬁ€    ‹€›';
D[4]:='ﬁ€€€€€€ﬂ ';
D[5]:='ﬁ€       ';
D[6]:='ﬁ€       ';
D[7]:='ﬁ€       ';
WLARGF('<<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'Q':BEGIN
D[1]:=' ‹€€€€€‹ ';
D[2]:='ﬁ€ﬂ   ﬂ€›';
D[3]:='ﬁ€     €›';
D[4]:='ﬁ€     €›';
D[5]:='ﬁ€  €€ €›';
D[6]:='ﬁ€‹  €›ﬁ›';
D[7]:=' ﬂ€€€ €ﬂ ';
WLARGF('<<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'R':BEGIN
D[1]:='ﬁ€€€€€€‹ ';
D[2]:='ﬁ€    ﬂ€›';
D[3]:='ﬁ€    ‹€›';
D[4]:='ﬁ€€€€€€ﬂ ';
D[5]:='ﬁ€ ﬂ€‹   ';
D[6]:='ﬁ€   ﬂ€‹ ';
D[7]:='ﬁ€     €›';
WLARGF('<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'S':BEGIN
D[1]:=' ‹€€€€€‹ ';
D[2]:='€ﬂ     ﬂ€';
D[3]:='€‹       ';
D[4]:=' ﬂ€€€€€‹ ';
D[5]:='       ﬂ€';
D[6]:='€‹     ‹€';
D[7]:=' ﬂ€€€€€ﬂ ';
WLARGF('<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'T':BEGIN
D[1]:='ﬁ€€€€€€€';
D[2]:='   ﬁ€   ';
D[3]:='   ﬁ€   ';
D[4]:='   ﬁ€   ';
D[5]:='   ﬁ€   ';
D[6]:='   ﬁ€   ';
D[7]:='   ﬁ€   ';
WLARGF('<<');
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'U':BEGIN
D[1]:='ﬁ€     €›';
D[2]:='ﬁ€     €›';
D[3]:='ﬁ€     €›';
D[4]:='ﬁ€     €›';
D[5]:='ﬁ€     €›';
D[6]:='ﬁ€‹   ‹€›';
D[7]:=' ﬂ€€€€€ﬂ ';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'V':BEGIN
D[1]:='ﬁ€     €›';
D[2]:='ﬁ€     €›';
D[3]:='ﬁ€     €›';
D[4]:='ﬁ€     €›';
D[5]:=' €‹   ‹€ ';
D[6]:='  €‹ ‹€  ';
D[7]:='   ﬂ€ﬂ   ';
WLARGF('<<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
WLARGF('<<<');
END;
'W':BEGIN
D[1]:='ﬁ€         €›';
D[2]:='ﬁ€         €›';
D[3]:='ﬁ€         €›';
D[4]:='ﬁ€  ﬁ›     €›';
D[5]:=' €€  €›   €€ ';
D[6]:='  €€ ﬁ›› €€  ';
D[7]:='   ﬂ€ﬂ ﬂ€ﬂ   ';
WRITE(D[1]);
LXY(LOCX+1,LOCY-13);
WRITE(D[2]);
LXY(LOCX+1,LOCY-13);
WRITE(D[3]);
LXY(LOCX+1,LOCY-13);
WRITE(D[4]);
LXY(LOCX+1,LOCY-13);
WRITE(D[5]);
LXY(LOCX+1,LOCY-13);
WRITE(D[6]);
LXY(LOCX+1,LOCY-13);
WRITE(D[7]);
LXY(LOCX+1,LOCY-13);
LXY(LOCX-7,LOCY+13);
WLARGF('>>');
END;
'X':BEGIN
D[1]:='€€    €€';
D[2]:=' €€  €€ ';
D[3]:='  €€ €  ';
D[4]:='   €€   ';
D[5]:='  € €€  ';
D[6]:=' €€  €€ ';
D[7]:='€€    €€';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
WLARGF('>>');
END;
'Y':BEGIN
D[1]:='€€      €€';
D[2]:=' €€    €€ ';
D[3]:='  €€  €€  ';
D[4]:='   €€ €   ';
D[5]:='    €€    ';
D[6]:='    €€    ';
D[7]:='    €€    ';
WRITE(D[1]);
LXY(LOCX+1,LOCY-10);
WRITE(D[2]);
LXY(LOCX+1,LOCY-10);
WRITE(D[3]);
LXY(LOCX+1,LOCY-10);
WRITE(D[4]);
LXY(LOCX+1,LOCY-10);
WRITE(D[5]);
LXY(LOCX+1,LOCY-10);
WRITE(D[6]);
LXY(LOCX+1,LOCY-10);
WRITE(D[7]);
LXY(LOCX+1,LOCY-10);
LXY(LOCX-7,LOCY+13);
END;
'Z':BEGIN
D[1]:='ﬁ€€€€€€›';
D[2]:='     €€ ';
D[3]:='    €€  ';
D[4]:='   €€   ';
D[5]:='  €€    ';
D[6]:=' €€     ';
D[7]:='ﬁ€€€€€€›';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'a':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='        ';
D[4]:=' €€€€€‹ ';
D[5]:='     ﬁ€ ';
D[6]:=' ‹€ﬂ ﬁ€ ';
D[7]:=' ﬂ€€€€ﬂ ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'b':BEGIN
D[1]:='        ';
D[2]:=' €›     ';
D[3]:=' €›     ';
D[4]:=' €‹€€€‹ ';
D[5]:=' €›  ﬁ€ ';
D[6]:=' €›  ﬁ€ ';
D[7]:=' €ﬂ€€€ﬂ ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'c':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='        ';
D[4]:=' ‹€€€‹  ';
D[5]:=' €›     ';
D[6]:=' €›     ';
D[7]:=' ﬂ€€€ﬂ  ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'd':BEGIN
D[1]:='        ';
D[2]:='     ﬁ€ ';
D[3]:='     ﬁ€ ';
D[4]:=' ‹€€€‹€ ';
D[5]:=' €›  ﬁ€ ';
D[6]:=' €›  ﬁ€ ';
D[7]:=' ﬂ€€€ﬂ€ ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'e':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='        ';
D[4]:=' ‹€€€‹  ';
D[5]:=' €› ‹€  ';
D[6]:=' €›    ‹';
D[7]:=' ﬂ€€€€€ﬂ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;

'f':BEGIN
D[1]:='        ';
D[2]:=' ‹€€€‹  ';
D[3]:=' €›     ';
D[4]:=' €€€€   ';
D[5]:=' €›     ';
D[6]:=' €›     ';
D[7]:=' €›     ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'g':BEGIN
D[1]:='        ';
D[2]:=' ‹€€€€‹ ';
D[3]:=' €›  ﬁ€ ';
D[4]:=' €›  ﬁ€ ';
D[5]:=' ﬂ€€€€‹ ';
D[6]:='     ﬁ€ ';
D[7]:='  ﬂ€€ﬂ  ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'h':BEGIN
D[1]:='        ';
D[2]:=' €›     ';
D[3]:=' €›     ';
D[4]:=' €‹€€‹  ';
D[5]:=' €›  €  ';
D[6]:=' €›  €  ';
D[7]:=' €›  €  ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'i':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='  ﬁ€    ';
D[4]:='        ';
D[5]:='  ﬁ€    ';
D[6]:='  ﬁ€    ';
D[7]:='  ﬁ€    ';
WLARGF('<<');
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
WLARGF('<<<');
END;
'j':BEGIN
D[1]:='     ﬁ€ ';
D[2]:='        ';
D[3]:='     ﬁ€ ';
D[4]:='     ﬁ€ ';
D[5]:='     ﬁ€ ';
D[6]:=' €›  ﬁ€ ';
D[7]:='  ﬂ€€ﬂ  ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'k':BEGIN
D[1]:='        ';
D[2]:=' ﬁ€     ';
D[3]:=' ﬁ€     ';
D[4]:=' ﬁ€ ‹ﬂ  ';
D[5]:=' ﬁ€€    ';
D[6]:=' ﬁ€ €   ';
D[7]:=' ﬁ€  €  ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'l':BEGIN
D[1]:='        ';
D[2]:=' ﬁ€     ';
D[3]:=' ﬁ€     ';
D[4]:=' ﬁ€     ';
D[5]:=' ﬁ€     ';
D[6]:=' ﬁ€     ';
D[7]:=' ﬁ€€    ';
WLARGF('<<');
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
WLARGF('<<');
END;
'm':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='        ';
D[4]:=' ﬁ‹€‹€‹ ';
D[5]:=' ﬁ€ € € ';
D[6]:=' ﬁ€ € € ';
D[7]:=' ﬁ€ € € ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'n':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='        ';
D[4]:='  ﬁ‹€€‹ ';
D[5]:='  ﬁ€  € ';
D[6]:='  ﬁ€  € ';
D[7]:='  ﬁ€  € ';
WLARGF('<<<<<');
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
WLARGF('>>>');
END;
'o':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='        ';
D[4]:='  ‹€€€€‹';
D[5]:='  €›  ﬁ€';
D[6]:='  €›  ﬁ€';
D[7]:='  ﬂ€€€€ﬂ';
WLARGF('<<<<<');
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
WLARGF('>>>');
END;
'p':BEGIN
D[1]:='        ';
D[2]:=' ﬁ€€€‹  ';
D[3]:=' ﬁ€  ﬁ€ ';
D[4]:=' ﬁ€  ﬁ€ ';
D[5]:=' ﬁ€€€ﬂ  ';
D[6]:=' ﬁ€     ';
D[7]:=' ﬁ€     ';
WLARGF('<<<<<');
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
WLARGF('>>>');
END;
'q':BEGIN
D[1]:='        ';
D[2]:=' ‹€€€€‹ ';
D[3]:=' €›  ﬁ€ ';
D[4]:=' €›  ﬁ€ ';
D[5]:=' ﬂ€€€‹€ ';
D[6]:='     ‹€ ';
D[7]:='     €‹ ';
WLARGF('<<<<<');
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'r':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='        ';
D[4]:='  ﬁ‹€€€‹';
D[5]:='  ﬁ€    ';
D[6]:='  ﬁ€    ';
D[7]:='  ﬁ€    ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
's':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='        ';
D[4]:='  ‹€€‹  ';
D[5]:=' ﬂ€€‹   ';
D[6]:='   ﬂ€€‹ ';
D[7]:='  ﬂ€€ﬂ  ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
't':BEGIN
D[1]:='        ';
D[2]:='   €›   ';
D[3]:=' €€€€€€ ';
D[4]:='   €›   ';
D[5]:='   €›   ';
D[6]:='   €›   ';
D[7]:='   ﬂ€‹  ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'u':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='        ';
D[4]:=' €›   €›';
D[5]:=' €›   €›';
D[6]:=' €›   €›';
D[7]:=' ﬂ€€€€ﬂ›';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'v':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='        ';
D[4]:=' €›   ﬁ€';
D[5]:='  €   € ';
D[6]:='  ﬂ€ €ﬂ ';
D[7]:='   ﬂ€ﬂ  ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'w':BEGIN
D[1]:='           ';
D[2]:='           ';
D[3]:='           ';
D[4]:='€›     ﬁ€  ';
D[5]:=' €  €   €  ';
D[6]:=' ﬂ€ ﬂ€ €ﬂ  ';
D[7]:='  ﬂ€ ﬂ€ﬂ   ';
WRITE(D[1]);
LXY(LOCX+1,LOCY-11);
WRITE(D[2]);
LXY(LOCX+1,LOCY-11);
WRITE(D[3]);
LXY(LOCX+1,LOCY-11);
WRITE(D[4]);
LXY(LOCX+1,LOCY-11);
WRITE(D[5]);
LXY(LOCX+1,LOCY-11);
WRITE(D[6]);
LXY(LOCX+1,LOCY-11);
WRITE(D[7]);
LXY(LOCX+1,LOCY-11);
LXY(LOCX-7,LOCY+13);
END;
'x':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='        ';
D[4]:=' ﬂ€   ‹€';
D[5]:='   €‹‹ﬂ ';
D[6]:='  €ﬂ €  ';
D[7]:=' €ﬂ   €‹';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'y':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:=' €›  ﬁ€ ';
D[4]:=' €›  ﬁ€ ';
D[5]:=' ﬂ€€€€‹ ';
D[6]:='     ﬁ€ ';
D[7]:='  ﬂ€€ﬂ  ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'z':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='        ';
D[4]:=' ﬂ€€€   ';
D[5]:='   €    ';
D[6]:='  €     ';
D[7]:=' €€€‹   ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
{
'.':BEGIN
D[1]:='        ';
D[2]:='        ';
D[3]:='        ';
D[4]:='        ';
D[5]:='        ';
D[6]:='        ';
D[7]:='   ‹    ';
WRITEITL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
}
ELSE WRITE(C);
END;
END;
END;
PROCEDURE WTRANSF;
VAR S,A:STRING;
    C:CHAR;
    I:INTEGER;
    D:ARRAY[1..10] OF STRING;
BEGIN
FOR I:=1 TO LENGTH(V) DO
BEGIN
C:=V[I];
CASE C OF
^C:CLS;
^R:LXY(1,1);
'>':FBCK(NM);
'<':BCK(NM);
'/':BEGIN WRITELN;WRITELN;WRITELN;WRITELN
END;
' ':BEGIN
D[1]:='   ';
D[2]:='   ';
D[3]:='   ';
D[4]:='   ';
WRITEIT(D[1],D[2],D[3],D[4]);
END;
'\':BEGIN
LXY(LOCX,LOCY-4);
Write('   ');
LXY(LOCX+1,LOCY-3);
Write('   ');
LXY(LOCX+1,LOCY-3);
Write('   ');
LXY(LOCX+1,LOCY-3);
Write('   ');
LXY(LOCX-3,LOCY-3);
END;
'A' :BEGIN
D[1]:='  ±±±±±± ';
D[2]:=' ±±    ±±';
D[3]:=' ±±    ±±';
D[4]:='  ±±±±±± ';
D[5]:=' ±±    ±±';
D[6]:=' ±±    ±±';
D[7]:=' ±±    ±±';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'B' :BEGIN
D[1]:='±±±±±±±  ';
D[2]:='±±    ±± ';
D[3]:='±±    ±± ';
D[4]:='±±±±±±±  ';
D[5]:='±±    ±± ';
D[6]:='±±    ±± ';
D[7]:='±±±±±±±  ';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'C' :BEGIN
D[1]:=' ±±±±±±  ';
D[2]:='±±    ±± ';
D[3]:='±±       ';
D[4]:='±±       ';
D[5]:='±±       ';
D[6]:='±±    ±± ';
D[7]:=' ±±±±±±  ';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'D' :BEGIN
D[1]:='±±±±±±±  ';
D[2]:='±±    ±± ';
D[3]:='±±    ±± ';
D[4]:='±±    ±± ';
D[5]:='±±    ±± ';
D[6]:='±±    ±± ';
D[7]:='±±±±±±±  ';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'E' :BEGIN
D[1]:='±±±±±±   ';
D[2]:='±±       ';
D[3]:='±±       ';
D[4]:='±±±±     ';
D[5]:='±±       ';
D[6]:='±±       ';
D[7]:='±±±±±±   ';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'F' :BEGIN
D[1]:='±±±±±±   ';
D[2]:='±±       ';
D[3]:='±±       ';
D[4]:='±±±±     ';
D[5]:='±±       ';
D[6]:='±±       ';
D[7]:='±±       ';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'G' :BEGIN
D[1]:='  ±±±±±± ';
D[2]:=' ±±    ±±';
D[3]:=' ±±      ';
D[4]:=' ±±   ±± ';
D[5]:=' ±±    ±±';
D[6]:=' ±±    ±±';
D[7]:='  ±±±±±± ';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'H' :BEGIN
D[1]:='±±     ±±';
D[2]:='±±     ±±';
D[3]:='±±     ±±';
D[4]:='±±±±±±±±±';
D[5]:='±±     ±±';
D[6]:='±±     ±±';
D[7]:='±±     ±±';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'I' :BEGIN
D[1]:='±±±±±±   ';
D[2]:='  ±±     ';
D[3]:='  ±±     ';
D[4]:='  ±±     ';
D[5]:='  ±±     ';
D[6]:='  ±±     ';
D[7]:='±±±±±±   ';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
WTRANSF('<<<<<');
END;
'J' :BEGIN
D[1]:='       ±±';
D[2]:='       ±±';
D[3]:='       ±±';
D[4]:='       ±±';
D[5]:='       ±±';
D[6]:='±±     ±±';
D[7]:=' ±±±±±±± ';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'K' :BEGIN
D[1]:='±±    ±± ';
D[2]:='±±   ±±  ';
D[3]:='±±  ±±   ';
D[4]:='±±±±±    ';
D[5]:='±±  ±±   ';
D[6]:='±±   ±±  ';
D[7]:='±±    ±± ';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'L' :BEGIN
D[1]:=' ±±      ';
D[2]:=' ±±      ';
D[3]:=' ±±      ';
D[4]:=' ±±      ';
D[5]:=' ±±      ';
D[6]:=' ±±      ';
D[7]:=' ±±±±±±± ';
WTRANSF('<<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'M' :BEGIN
D[1]:='±±       ±±';
D[2]:='±±±±   ±±±±';
D[3]:='±± ±±±±± ±±';
D[4]:='±±       ±±';
D[5]:='±±       ±±';
D[6]:='±±       ±±';
D[7]:='±±       ±±';
WTRANSF('<<');
WRITE(D[1]);
LXY(LOCX+1,LOCY-11);
WRITE(D[2]);
LXY(LOCX+1,LOCY-11);
WRITE(D[3]);
LXY(LOCX+1,LOCY-11);
WRITE(D[4]);
LXY(LOCX+1,LOCY-11);
WRITE(D[5]);
LXY(LOCX+1,LOCY-11);
WRITE(D[6]);
LXY(LOCX+1,LOCY-11);
WRITE(D[7]);
LXY(LOCX+1,LOCY-11);
LXY(LOCX-7,LOCY+13);
END;
'N' :BEGIN
D[1]:='±±     ±±';
D[2]:='±±±±   ±±';
D[3]:='±± ±±  ±±';
D[4]:='±±  ±± ±±';
D[5]:='±±   ±±±±';
D[6]:='±±     ±±';
D[7]:='±±     ±±';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'O' :BEGIN
D[1]:=' ±±±±±±± ';
D[2]:='±±     ±±';
D[3]:='±±     ±±';
D[4]:='±±     ±±';
D[5]:='±±     ±±';
D[6]:='±±     ±±';
D[7]:=' ±±±±±±± ';
WTRANSF('<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'P' :BEGIN
D[1]:='±±±±±±±± ';
D[2]:='±±     ±±';
D[3]:='±±     ±±';
D[4]:='±±±±±±±± ';
D[5]:='±±       ';
D[6]:='±±       ';
D[7]:='±±       ';
WTRANSF('<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'Q' :BEGIN
D[1]:=' ±±±±±±± ';
D[2]:='±±     ±±';
D[3]:='±±     ±±';
D[4]:='±±     ±±';
D[5]:='±±  ±± ±±';
D[6]:='±±   ±± ±';
D[7]:=' ±±±± ±± ';
WTRANSF('<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'R' :BEGIN
D[1]:='±±±±±±±± ';
D[2]:='±±     ±±';
D[3]:='±±     ±±';
D[4]:='±±±±±±±± ';
D[5]:='±±   ±±  ';
D[6]:='±±    ±± ';
D[7]:='±±     ±±';
WTRANSF('<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'S' :BEGIN
D[1]:=' ±±±±±±± ';
D[2]:='±±     ±±';
D[3]:='±±       ';
D[4]:=' ±±±±±±± ';
D[5]:='       ±±';
D[6]:='±±     ±±';
D[7]:=' ±±±±±±± ';
WTRANSF('<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'T' :BEGIN
D[1]:='±±±±±±±± ';
D[2]:='   ±±    ';
D[3]:='   ±±    ';
D[4]:='   ±±    ';
D[5]:='   ±±    ';
D[6]:='   ±±    ';
D[7]:='   ±±    ';
WTRANSF('<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'U' :BEGIN
D[1]:='±±     ±±';
D[2]:='±±     ±±';
D[3]:='±±     ±±';
D[4]:='±±     ±±';
D[5]:='±±     ±±';
D[6]:='±±     ±±';
D[7]:=' ±±±±±±± ';
WTRANSF('<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'V' :BEGIN
D[1]:='±±     ±±';
D[2]:='±±     ±±';
D[3]:='±±     ±±';
D[4]:='±±     ±±';
D[5]:=' ±±   ±± ';
D[6]:='  ±± ±±  ';
D[7]:='    ±    ';
WTRANSF('<<');
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'W' :BEGIN
D[1]:='±±         ±±';
D[2]:='±±         ±±';
D[3]:='±±         ±±';
D[4]:='±±         ±±';
D[5]:=' ±±  ±±   ±± ';
D[6]:='  ±±  ±± ±±  ';
D[7]:='    ±±  ±    ';
WRITE(D[1]);
LXY(LOCX+1,LOCY-13);
WRITE(D[2]);
LXY(LOCX+1,LOCY-13);
WRITE(D[3]);
LXY(LOCX+1,LOCY-13);
WRITE(D[4]);
LXY(LOCX+1,LOCY-13);
WRITE(D[5]);
LXY(LOCX+1,LOCY-13);
WRITE(D[6]);
LXY(LOCX+1,LOCY-13);
WRITE(D[7]);
LXY(LOCX+1,LOCY-13);
LXY(LOCX-7,LOCY+13);
WLARGF('>>');
END;
'X' :BEGIN
D[1]:='±±    ±± ';
D[2]:=' ±±  ±±  ';
D[3]:='  ±± ±   ';
D[4]:='   ±±    ';
D[5]:='  ± ±±   ';
D[6]:=' ±±  ±±  ';
D[7]:='±±    ±± ';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'Y' :BEGIN
D[1]:='±±     ±±';
D[2]:=' ±±   ±± ';
D[3]:='  ±± ±±  ';
D[4]:='   ±±±   ';
D[5]:='    ±±   ';
D[6]:='    ±±   ';
D[7]:='    ±±   ';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;
'Z' :BEGIN
D[1]:='±±±±±±±± ';
D[2]:='     ±±  ';
D[3]:='    ±±   ';
D[4]:='   ±±    ';
D[5]:='  ±±     ';
D[6]:=' ±±      ';
D[7]:='±±±±±±±± ';
WRITEITLL(D[1],D[2],D[3],D[4],D[5],D[6],D[7]);
END;

ELSE WRITE(C);
END;
END;
END;
END.

