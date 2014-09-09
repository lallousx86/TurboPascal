Procedure PrintStr(S: String); Assembler;
Asm
  PUSH    DS
  LDS     SI,S
  CLD
  LODSB
  XOr     AH,AH
  XCHG    AX,CX
  MOV     AH,40H
  MOV     BX,1
  MOV     DX,SI
  Int     21H
  POP     DS
End;
