
{$I E:\try\Cr27\ComSepe.Pas}
Procedure       EFormatStr(FStr,AS:String;Var FS:String);
Var
  S:String;
  I,J,
  GN,Max:Integer;

Begin;

  ComSepe ( AS , '~~', -1 , Max );

  While Pos(FStr,FS) > 0 Do
  Begin;

    I := Pos(FStr,FS);

    FS[I] := Chr ( Not Ord(FS[I]) );

    S := Copy(FS, I + Length(FStr) , 2 );

    Val( S , Gn , J );

    If J <> 0     Then         Continue;

    If Gn > Max   Then         Continue;

    Delete(FS , I , Length(FStr) + 2 );

    Inc ( GN );

    Insert ( ComSepe(AS,'~~',GN,J) , FS , I );

  End;
 { example:

    S := '^^00 has a last name:^^01';
    EFormatStr('^^','~~elias~~bachaalany~~is~~the~~best~~of~~all',S);
 }

End;

