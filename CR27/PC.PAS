Procedure PrintC(Msg:String);Assembler;
Asm
  PUSH          DS

  LES           DI,Msg

  MOV           AH,9

  XOR           CX,CX
  PUSH          CX
  POP           BX
  CWD
  INC           CX
  MOV           DL,ES:[DI]

  MOV           BL,7

 @@1:
  INC           DI
  DEC           DL
  CMP           DL,-1
  JE            @@3
  CMP           BYTE PTR ES:[DI],0Fh
  JNBE          @@2
  MOV           BL,ES:[DI]
  JMP           @@1
 @@2:
  PUSH          AX
  PUSH          DX
  PUSH          CX
  MOV           AL,ES:[DI]
  INT           10h
  MOV           AH,3
  INT           10h
  INC           DL
  DEC           AH
  INT           10h
  POP           CX
  POP           DX
  POP           AX
  JMP           @@1
 @@3:
  POP           DS
End;

Begin;

  PrintC(#7'This program is written by '#11'Elias Bachaalany'#9'.');

End.