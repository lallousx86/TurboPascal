Procedure PrintC(Msg:String);Assembler;

Label
     _Begin,_End,_NewLine,_Color,_Print,_Loop;

Var
   Len  : Byte;

Asm

 _Begin:

  PUSH          DS

  LDS           SI,Msg
  MOV           DL,[SI]
  MOV           BYTE PTR [Len],DL

 _Loop:
  INC           SI
  CMP           BYTE PTR [SI],16
  JE            _NewLine

  CMP           BYTE PTR [SI],15
  JE            _Color

  MOV           AL,[SI]
  MOV           BL,7
  INC           SI

 _Print:
  MOV           AH,9
  MOV           BH,0
  XOR           CX,CX
  INT           10h
 _Color:

 _NewLine:

 _End:

  POP           DS
End;

Begin;

  PrintC(#7'This program is written by '#11'Elias Bachaalany'#9'.');

End.