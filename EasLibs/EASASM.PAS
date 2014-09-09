Unit easAsm;

 Interface

 Const m80x60  = $0108;
       m132x25 = $0109;
       m132x43 = $010A;
       m132x50 = $010B;
       m132x60 = $010C;

Var

   Crt_TextAttr:Byte;
   Crt_WindMin,Crt_WindMax:Word;

 Procedure ChgMode(M:Word);
 Procedure Crt_ClrScr;
 Procedure Crt_ClrEol;
 Procedure Crt_GotoXy(X,Y:Byte);
 Procedure Crt_InsDelLine(UD:Boolean);
 Procedure Crt_Window(X1,Y1,X2,Y2:Byte);
 Procedure Crt_HighVideo;
 Procedure Crt_LoVideo;
 Procedure Crt_TextColor(Fc,Bc:Byte);
 Procedure SetCursor(HS,LS:Byte);
 Procedure GetCursor(Var HS,LS:Byte);

 Procedure Crt_EncryptBuffer(Var B;Pwd:String;Size:Word);
 Procedure Crt_DecryptBuffer(Var B;Pwd:String;Size:Word);

 Function  CalcCrc16(Var Buf;Size:Word):Word;

 Function  Crt_WhereX:Byte;
 Function  Crt_WhereY:Byte;

 Implementation

 Procedure ChgMode;Assembler;
 Asm
        Mov Ax,$4F02
        Mov Bx,m
        Int 10h
 End;

Procedure Crt_ClrScr;Assembler;
 Asm
      MOV       AX,0600H
      MOV       BH,[Crt_TextAttr]
      MOV       CX,[Crt_WindMin]
      MOV       DX,[Crt_WindMax]
      INT       10H
      MOV       DX,[Crt_WindMin]
      MOV       AH,02
      XOR       BH,BH
      INT       10H

 End;
Procedure Crt_ClrEol;Assembler;
 Asm
     MOV        AH,3
     XOR        BH,BH
     INT        10H
     MOV        AX,0600H
     MOV        BH,[Crt_TextAttr]
     MOV        CX,DX
     MOV        DL,BYTE PTR [Crt_WindMax]
     INT        10H
 End;
Procedure Crt_GotoXy;Assembler;
 Asm
     MOV        DL,Y
     MOV        DH,X
     DEC        DL
     DEC        DH
     MOV        AH,02
     XOR        BH,BH
     INT        10H
 End;
Procedure Crt_InsDelLine;Assembler;
 Asm
     CMP        UD,0
     JE         @@1
     MOV        AX,0601H
     JMP        @@2
@@1:
     MOV        AX,0701H
@@2:
     PUSH       AX
     MOV        AH,03
     XOR        BH,BH
     INT        10H
     POP        AX
     MOV        BH,[Crt_TextAttr]
     MOV        CL,BYTE PTR [Crt_WindMin]
     MOV        CH,DH
     MOV        DX,[Crt_WindMax]
     CMP        CH,DH
     JNE        @@3
     XOR        AL,AL
@@3:
     INT        10H
 End;
Procedure Crt_Window;Assembler;
 Asm
     MOV        DL,Y1
     MOV        DH,X1
     MOV        CL,Y2
     MOV        CH,X2
     DEC        CL
     DEC        CH
     DEC        DL
     DEC        DH
     MOV        [Crt_WindMin],DX
     MOV        [Crt_WindMax],CX
     MOV        AH,2
     XOR        BH,BH
     INT        10H
 End;

Procedure Crt_HighVideo;Assembler;
 Asm
     OR         BYTE PTR [Crt_TextAttr],08H
 End;

Procedure Crt_LoVideo;Assembler;
 Asm
     AND        BYTE PTR [Crt_TextAttr],0F7H
 End;

Function  Crt_KeyPressed:Boolean;Assembler;
 Asm
     MOV        AH,01
     INT        16H
     MOV        AL,00
     JE         @@1
     MOV        AL,1
@@1:
 End;

Function  ReadKey:Char;Assembler;
  Asm
     OR         AL,AL
     JNE        @@1
     XOR        AH,AH
     INT        16h
     OR         AL,AL
     JNE        @@1
     OR         AH,AH
     JNE        @@1
     MOV        AL,3
@@1:
  End;


Procedure Crt_TextColor;Assembler;
 Asm
     MOV        AL,Bc
     SHL        AL,4
     ADD        AL,Fc
     MOV        [Crt_TextAttr],AL
 End;
 Function Crt_WhereX;Assembler;
 Asm
     MOV        AH,3
     MOV        BH,0
     INT        10H
     XOR        AX,AX
     MOV        AL,DH
     INC        AL
 End;
 Function Crt_WhereY;Assembler;
 Asm
     MOV        AH,3
     MOV        BH,0
     INT        10H
     XOR        AX,AX
     MOV        AL,DL
     INC        AL
 End;

Procedure SetCursor;Assembler;
 Asm
     mov        ah,1
     mov        ch,[hs]
     mov        cl,[ls]
     int        10h
 End;
Procedure GetCursor;Assembler;
 Asm
     mov        ah,3
     mov        bh,0
     int        10h
     mov        byte ptr ls,ch
     mov        byte ptr hs,cl
 End;

 Procedure Crt_EncryptBuffer(Var B;Pwd:String;Size:Word);Assembler;
 Var
     pwdlen : byte;
 Asm

    push        ds                           { save data seg }
    push        bp                           { and base pointer}

    lds         si,B                         { ds:si = buffer }
    les         di,pwd                       { es:di = password}

    xor         bx,bx                        { clear BX }
    mov         al,byte ptr es:[di]
    mov         pwdlen,al
    inc         di                           { DI = pwd pointer }


    add         si,size                      { work reversly }
    sub         si,2

 @@2:
    mov         cx,size                      { CX = size }
    dec         cx

    push        si

 @@1:
    push        cx
    xor         cx,cx
    mov         cl,es:[di]

    add         [si],cl
    neg         word ptr [si]
    xor         [si],cl
    rol         word ptr [si],cl
    xor         [si],cl
    not         word ptr [si]

    pop         cx
    dec         si
    loop        @@1

    pop         si

    inc         bl
    inc         di

    cmp         bl,byte ptr [pwdlen]
    jne         @@2

    lds         si,B
    mov         cx,size
    xor         ax,ax
    mov         dx,ax

    pop         bp                           { restore base pointer }
    pop         ds                           { and data segment }
 End;

 Procedure Crt_DecryptBuffer(Var B;Pwd:String;Size:Word);Assembler;
 Var
     pwdlen : byte;
 Asm


    push        ds                           { save data seg }
    push        bp                           { and base pointer}

    lds         si,B                         { ds:si = buffer }
    les         di,pwd                       { es:di = password}

    xor         ax,ax
    xor         bx,bx                        { clear BX }
    mov         al,byte ptr es:[di]
    mov         pwdlen,al
    add         di,ax


 @@2:
    mov         cx,size                      { CX = size }
    dec         cx

    push        si

 @@1:
    push        cx
    xor         cx,cx
    mov         cl,es:[di]

    xor         [si],cl
    ror         word ptr [si],cl
    xor         [si],cl
    not         word ptr [si]
    neg         word ptr [si]
    sub         [si],cl

    pop         cx

    inc         si
    loop        @@1

    pop         si

    inc         bl
    dec         di

    cmp         bl,byte ptr [pwdlen]
    jne         @@2

    pop         bp                           { restore base pointer }
    pop         ds                           { and data segment }

 End;

Function CalcCrc16;Assembler;

Asm

         PUSH DS
         PUSH BP

         LDS  SI,Buf              { DS:SI := Buf                    }
         MOV  CX,Size             { CX := Size                      }


         PUSHF
         CLD                      { Move forward through the buffer }

         SUB  DX,DX               { CRC := 0000h                    }

@C1:     LODSB                    { AL := byte at DS:SI             }
         SUB  AH,AH

         XCHG AH,AL               { AX := 256 * AL                  }
         XOR  DX,AX               { CRC := CRC xor AX               }

         PUSH CX
         MOV  CX,8

@C2:     MOV  BX,DX
         SHL  DX,1

         AND  BX,8000h
         JZ   @C3

         XOR  DX,1021h
@C3:     LOOP @C2
         POP  CX

         LOOP @C1

         POPF

         XCHG AX,DX

         POP  BP
         POP  DS
End;

Begin;

 Crt_WindMin := 0;
 Crt_WindMax := $184F;


End.