program FontLoad;

var
  P:Array[$0..$FF,$0..$F] Of Byte;
  F:File;
begin;
  If ParamStr(1) = '' Then Halt;

  Assign(F,ParamStr(1));
  {$I-} Reset(F,1); {$I+}
  If IOResult <> 0 Then Halt;
  If FileSize(F) <> $1000 Then Halt;

  BlockRead(F,P,$1000);
  Close(F);
  Asm
    Push        BP
    Mov         AX,1100H
    Mov         BX,1000H
    Mov         CX,100H
    XOr         DX,DX
    Mov         BP,Offset P
    Int         10H
    Pop         BP
  End;
 WriteLn('FONT LOADER v1.0 By ELIAS BACHAALANY');
End.