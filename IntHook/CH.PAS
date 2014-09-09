{$M $8000,0,0}
Uses Dos,easMISC;

Const
     VecToM = $FF;
Procedure IntFF;Assembler;
Asm
    xor dl,dl
    mov dl,66h
    iret
End;

Var
   SaveIntFF : Pointer;
Begin;
 LongInt(SaveIntFF) := MEML[$0:VecToM*4];

 MEML[$0:VecToM*4] := LongInt(@IntFF);

 Exec(ParamStr(1),OptMax(2));

 MEML[$0:VecToM*4] := LongInt(SaveIntFF);
End.
