
Function        ComSepe(S,CS:String;Cn:Integer;Var AC:Integer):String;

Var
   I,J:Integer;

Begin;

 If Copy(S,1,Length(CS)) <> CS  Then S := CS + S;

 If Copy(S,Length(S)-Length(CS)+1,Length(S)) <> CS Then S := S + CS;

 AC  := 0;

 While  ( Pos(CS,S) > 0 ) Do

        Begin;

        I := Pos(CS,S);

        If  ( AC = CN ) Then Begin;
                        S := Copy( S, ( J + Length(CS) ) , ( I-Length(CS) ) - J );
                        Break;
                        End;

        Inc(AC);
        S [I] :=  Chr( NOT Ord( S[I]) );
        J := I;
        End;

 Dec(AC);
 ComSepe := S;

End;


