Unit EasCht;

Interface

Const
       EasChtVer = 1.0;
Type
     TMyProc = Procedure;

Procedure ReadChunk(var f:file;offs:longint;var ch;how:word);
Procedure PutChunk (var f:file;offs:longint;var ch;how:word);
Procedure MyExit;

Var
    MyProc : TMyProc;
    PMyProc: ^TMyProc;

Implementation

Var
    MyOffs:Longint;
    MyRw  :Word;

Procedure ReadChunk;
Begin;
MyOffs:=FilePos(f);
Seek(f,offs);
BlockRead(f,ch,how);
Seek(f,MyOffs);
End;

Procedure PutChunk;
Begin;
MyOffs:=FilePos(f);
Seek(f,offs);
BlockWrite(f,ch,how);
Seek(f,MyOffs);
End;

Procedure MyExit;
Begin;
WriteLn('this program has been halted while executing an invalid');
WriteLn('instruction. if error occurs an other time , please ');
WriteLn('contact your vendor.');
Halt;
End;

End.
