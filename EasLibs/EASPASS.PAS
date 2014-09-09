Unit EasPass;

Interface

Const
   PassMaxLen = 50*2;

Type
  Tablepass = Array [1..PassMaxLen] Of Array [1..PassMaxLen] Of String[2];
  Actproc   = Procedure ( Var S:String);
  SetOfChar = Set Of Char;

Procedure  SearchForPassword(MyLen:Byte;C:SetOfChar;ActP:Actproc;Con:Boolean);

Implementation

Procedure  SearchForPassword;

Label
  1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,Pend;

Var
  S,A:String;
  I,J:Array[0..20] Of Integer;
  K:Integer;
  Tbl:Tablepass;
Begin;

  { Set Of Char To String }

  S := '';
  For I[0] := $0 To $FF Do If Chr( I[0] ) In C Then S:=S+Chr( I[0] );

  { End Of SOC  To String }

  { Table Filler } { Init }
  For I[0] := 1 To Length(S) Do Tbl[ 1,I[0] ] := S[ I[0] ];
  For I[0] := 1 To Length(S) Do
    For J[0] := 1 To Length(S) Do
      Tbl[ I[0]+1 ,J[0] ] := S[ I[0] ] + S[ J[0] ];
  { End Of Init }  { Done }

  If Length(S) > PassMaxLen then S[0] := Chr(PassMaxLen);

  Case MyLen Of
    1 :  Goto 1;
    2 :  Goto 2;
    3 :  Goto 3;
    4 :  Goto 4;
    5 :  Goto 5;
    6 :  Goto 6;
    7 :  Goto 7;
    8 :  Goto 8;
    9 :  Goto 9;
    10:  Goto 10;
    11:  Goto 11;
    12:  Goto 12;
    13:  Goto 13;
    14:  Goto 14;
    15:  Goto 15;
    16:  Goto 16;
    17:  Goto 17;
    18:  Goto 18;
    19:  Goto 19;
    20:  Goto 20;
    Else If MyLen > 20 Then Goto PEnd;
  End;

  { Password For Len 1 }
  1:
  For I[0] := 1 To Length(S) Do
      Begin;
       A := Tbl[1,I[0] ];

       ActP(A);

      End;

  If Not Con Then Goto PEnd;

  { Password For Len 2 }
  2:
  For I[0] := 1 To Length(S) Do
    For J[0] := 1 To Length(S) Do Begin;
      A :=
      Tbl[ I[0] +1,J[0]];

    ActP(A);

    End;

  If Not Con Then Goto PEnd;

  { Password For Len 3 }
  3:
  For K := 1 To Length(S) Do
    For I[0] := 1 To Length(S) Do
      For J[0] := 1 To Length(S) Do Begin;
        A :=
        Tbl[ I[0] +1,J[0]]+
        Tbl[ 1,K];

      ActP(A);

      End;

  If Not Con Then Goto PEnd;

  { Password For Len 4 }
  4:
  For I[0] := 1 To Length(S) Do
    For J[0] := 1 To Length(S) Do
      For I[1] :=1 To Length(S) Do
        For J[1] :=1 To Length(S) Do Begin;
          A :=
          Tbl[ I[0] +1,J[0] ] +
          Tbl[ I[1] +1,J[1] ];

          ActP(A);

        End;

  If Not Con Then
                  Goto PEnd;

  { Password For Len 5 }
  5:
  For K := 1 To Length(S) Do
    For I[0] := 1 To Length(S) Do
      For J[0] := 1 To Length(S) Do
        For I[1] := 1 To Length(S) Do
          For J[1] := 1 To Length(S) Do Begin;
            A :=
            Tbl[ I[0] +1, J[0] ] +
            Tbl[ I[1] +1 ,J[1] ] + Tbl[1,K];

            ActP(A);

          End;

  If Not Con Then
                  Goto PEnd;

  { Password For Len 6 }
  6:
  For I[0] :=1 To Length(S) Do
    For J[0] :=1 To Length(S) Do
      For I[1] :=1 To Length(S) Do
        For J[1] :=1 To Length(S) Do
          For I[2] :=1 To Length(S) Do
            For J[2] :=1 To Length(S) Do Begin;
              A :=
              Tbl[ I[0] +1,J[0] ] +
              Tbl[ I[1] +1,J[1] ] + Tbl[ I[2] +1,J[2] ];

              ActP(A);

            End;

  If Not Con Then
                 Goto PEnd;

  { Password For Len 7 }
  7:
  For K := 1 To Length(S) Do
    For I[0] :=1 To Length(S) Do
      For J[0] :=1 To Length(S) Do
        For I[1] :=1 To Length(S) Do
          For J[1] :=1 To Length(S) Do
            For I[2] :=1 To Length(S) Do
              For J[2] :=1 To Length(S) Do Begin
                A :=
                Tbl[ I[0] +1,J[0] ] + Tbl[I[1] +1, J[1]] +
                Tbl[ I[2] +1,J[2] ] + Tbl[1,K];

              ActP(A);

              End;

  If Not Con Then
                  Goto PEnd;

  { Password For Len 8 }
  8:
  For I[0] :=1 To Length(S) Do
    For J[0] :=1 To Length(S) Do
      For I[1] :=1 To Length(S) Do
        For J[1] :=1 To Length(S) Do
          For I[2] :=1 To Length(S) Do
            For J[2] :=1 To Length(S) Do
              For I[3] :=1 To Length(S) Do
                For J[3] :=1 To Length(S) Do Begin;
                  A :=
                  Tbl[ I[0] +1,J[0] ] + Tbl[ I[1] +1,J[1] ] +
                  Tbl[ I[2] +1,J[2] ] + Tbl[ I[3] +1,J[3] ];

                ActP(A);

                End;

  If Not Con Then
                 Goto PEnd;

  { Password For Len 9 }
  9:
  For K    :=1 To Length(S) Do
    For I[0] :=1 To Length(S) Do
      For J[0] :=1 To Length(S) Do
        For I[1] :=1 To Length(S) Do
          For J[1] :=1 To Length(S) Do
            For I[2] :=1 To Length(S) Do
              For J[2] :=1 To Length(S) Do
                For I[3] :=1 To Length(S) Do
                  For J[3] :=1 To Length(S) Do Begin;
                    A :=
                    Tbl[ I[0] +1,J[0] ] + Tbl[ I[1] +1,J[1] ] +
                    Tbl[ I[2] +1,J[2] ] + Tbl[ I[3] +1,J[3] ] +
                    Tbl[1,K];

                  ActP(A);

                  End;

  If Not Con Then
                 Goto PEnd;

  { Password For Len 10}
  10:
  For I[0] :=1 To Length(S) Do
    For J[0] :=1 To Length(S) Do
      For I[1] :=1 To Length(S) Do
        For J[1] :=1 To Length(S) Do
          For I[2] :=1 To Length(S) Do
            For J[2] :=1 To Length(S) Do
              For I[3] :=1 To Length(S) Do
                For J[3] :=1 To Length(S) Do
                  For I[4] :=1 To Length(S) Do
                    For J[4] :=1 To Length(S) Do Begin;
                      A :=
                      Tbl[ I[0] +1,J[0] ] +
                      Tbl[ I[1] +1,J[1] ] + Tbl[ I[2] +1,J[2]] +
                      Tbl[ I[3] +1,J[3] ] + Tbl[ I[4] +1,J[4]];

                    ActP(A);

                    End;

  If Not Con Then
                 Goto PEnd;

  { Password For Len 11}
  11:
  For K :=1 To Length(S) Do
    For I[0] :=1 To Length(S) Do
      For J[0] :=1 To Length(S) Do
        For I[1] :=1 To Length(S) Do
          For J[1] :=1 To Length(S) Do
            For I[2] :=1 To Length(S) Do
              For J[2] :=1 To Length(S) Do
                For I[3] :=1 To Length(S) Do
                  For J[3] :=1 To Length(S) Do
                    For I[4] :=1 To Length(S) Do
                      For J[4] :=1 To Length(S) Do Begin;
                        A :=
                        Tbl[ I[0] +1,J[0] ] + Tbl[ I[1] +1,J[1] ] +
                        Tbl[ I[2] +1,J[2] ] + Tbl[ I[3] +1,J[3] ] +
                        Tbl[ I[4] +1,J[4] ] + Tbl[ 1,K];

                      ActP(A);

                      End;

  If Not Con Then
                 Goto PEnd;

  { Password For Len 12}
  12:
  For I[0] :=1 To Length(S) Do
    For J[0] :=1 To Length(S) Do
      For I[1] :=1 To Length(S) Do
        For J[1] :=1 To Length(S) Do
          For I[2] :=1 To Length(S) Do
            For J[2] :=1 To Length(S) Do
              For I[3] :=1 To Length(S) Do
                For J[3] :=1 To Length(S) Do
                  For I[4] :=1 To Length(S) Do
                    For J[4] :=1 To Length(S) Do
                      For I[5] :=1 To Length(S) Do
                        For J[5] :=1 To Length(S) Do Begin;
                          A :=
                          Tbl[ I[0] +1,J[0] ] + Tbl[ I[1] +1,J[1] ] +
                          Tbl[ I[2] +1,J[2] ] + Tbl[ I[3] +1,J[3] ] +
                          Tbl[ I[4] +1,J[4] ] + Tbl[ I[5] +1,J[5] ];

                        ActP(A);

                        End;

  If Not Con Then
                  Goto PEnd;

  { Password For Len 13}
  13:
  For K :=1 To Length(S) Do
    For I[0] :=1 To Length(S) Do
      For J[0] :=1 To Length(S) Do
        For I[1] :=1 To Length(S) Do
          For J[1] :=1 To Length(S) Do
            For I[2] :=1 To Length(S) Do
              For J[2] :=1 To Length(S) Do
                For I[3] :=1 To Length(S) Do
                  For J[3] :=1 To Length(S) Do
                    For I[4] :=1 To Length(S) Do
                      For J[4] :=1 To Length(S) Do
                        For I[5] :=1 To Length(S) Do
                          For J[5] :=1 To Length(S) Do Begin;
                            A :=
                            Tbl[ I[0] +1,J[0] ] +
                            Tbl[ I[1] +1,J[1] ] + Tbl[ I[2] +1,J[2] ] +
                            Tbl[ I[3] +1,J[3] ] + Tbl[ I[4] +1,J[4] ] +
                            Tbl[ I[5] +1,J[5] ] + Tbl[ 1,K];

                          ActP(A);

                          End;

  If Not Con Then
                  Goto PEnd;

  { Password For Len 14}
  14:
  For I[0] :=1 To Length(S) Do
    For J[0] :=1 To Length(S) Do
      For I[1] :=1 To Length(S) Do
        For J[1] :=1 To Length(S) Do
          For I[2] :=1 To Length(S) Do
            For J[2] :=1 To Length(S) Do
              For I[3] :=1 To Length(S) Do
                For J[3] :=1 To Length(S) Do
                  For I[4] :=1 To Length(S) Do
                    For J[4] :=1 To Length(S) Do
                      For I[5] :=1 To Length(S) Do
                        For J[5] :=1 To Length(S) Do
                          For I[6] :=1 To Length(S) Do
                            For J[6] :=1 To Length(S) Do Begin;
                              A :=
                              Tbl[ I[0] +1, J[0] ] +
                              Tbl[ I[1] +1, J[1] ] + Tbl[ I[2] +1, J[2] ] +
                              Tbl[ I[3] +1, J[3] ] + Tbl[ I[4] +1, J[4] ] +
                              Tbl[ I[5] +1 ,J[5] ] + Tbl[ I[6] +1, J[6] ];

                            ActP(A);

                            End;

  If Not Con Then
                  Goto PEnd;

  { Password For Len 15}
  15:
  For K :=1 To Length(S) Do
    For I[0] :=1 To Length(S) Do
      For J[0] :=1 To Length(S) Do
        For I[1] :=1 To Length(S) Do
          For J[1] :=1 To Length(S) Do
            For I[2] :=1 To Length(S) Do
              For J[2] :=1 To Length(S) Do
                For I[3] :=1 To Length(S) Do
                  For J[3] :=1 To Length(S) Do
                    For I[4] :=1 To Length(S) Do
                      For J[4] :=1 To Length(S) Do
                        For I[5] :=1 To Length(S) Do
                          For J[5] :=1 To Length(S) Do
                            For I[6] :=1 To Length(S) Do
                              For J[6] :=1 To Length(S) Do Begin;
                                A :=
                                Tbl[ I[0] +1, J[0] ] + Tbl[ I[1] +1, J[1] ] +
                                Tbl[ I[2] +1, J[2] ] + Tbl[ I[3] +1, J[3] ] +
                                Tbl[ I[4] +1, J[4] ] + Tbl[ I[5] +1 ,J[5] ] +
                                Tbl[ I[6] +1, J[6] ] + Tbl[ 1,K];

                              ActP(A);

                              End;

  If Not Con Then
                  Goto PEnd;

  { Password For Len 16}
  16:
  For I[0] :=1 To Length(S) Do
    For J[0] :=1 To Length(S) Do
      For I[1] :=1 To Length(S) Do
        For J[1] :=1 To Length(S) Do
          For I[2] :=1 To Length(S) Do
            For J[2] :=1 To Length(S) Do
              For I[3] :=1 To Length(S) Do
                For J[3] :=1 To Length(S) Do
                  For I[4] :=1 To Length(S) Do
                    For J[4] :=1 To Length(S) Do
                      For I[5] :=1 To Length(S) Do
                        For J[5] :=1 To Length(S) Do
                          For I[6] :=1 To Length(S) Do
                            For J[6] :=1 To Length(S) Do
                              For I[7] :=1 To Length(S) Do
                                For J[7] :=1 To Length(S) Do Begin;
                                  A :=
                                  Tbl[ I[0] +1, J[0] ] + Tbl[ I[1] +1, J[1] ] +
                                  Tbl[ I[2] +1, J[2] ] + Tbl[ I[3] +1, J[3] ] +
                                  Tbl[ I[4] +1, J[4] ] + Tbl[ I[5] +1 ,J[5] ] +
                                  Tbl[ I[6] +1, J[6] ] + Tbl[ I[7] +1 ,J[7] ];

                                ActP(A);

                                End;

  If Not Con Then
                 Goto PEnd;

  { Password For Len 17}
  17:
  For K :=1 To Length(S) Do
    For I[0] :=1 To Length(S) Do
      For J[0] :=1 To Length(S) Do
        For I[1] :=1 To Length(S) Do
          For J[1] :=1 To Length(S) Do
            For I[2] :=1 To Length(S) Do
              For J[2] :=1 To Length(S) Do
                For I[3] :=1 To Length(S) Do
                  For J[3] :=1 To Length(S) Do
                    For I[4] :=1 To Length(S) Do
                      For J[4] :=1 To Length(S) Do
                        For I[5] :=1 To Length(S) Do
                          For J[5] :=1 To Length(S) Do
                            For I[6] :=1 To Length(S) Do
                              For J[6] :=1 To Length(S) Do
                                For I[7] :=1 To Length(S) Do
                                  For J[7] :=1 To Length(S) Do Begin;
                                    A :=
                                    Tbl[ I[0] +1, J[0] ] + Tbl[ I[1] +1, J[1] ] +
                                    Tbl[ I[2] +1, J[2] ] + Tbl[ I[3] +1, J[3] ] +
                                    Tbl[ I[4] +1, J[4] ] + Tbl[ I[5] +1 ,J[5] ] +
                                    Tbl[ I[6] +1, J[6] ] + Tbl[ I[7] +1 ,J[7] ] +
                                    Tbl[ 1,K];

                                  ActP(A);

                                  End;

  If Not Con Then
                  Goto PEnd;

  { Password For Len 18}
  18:
  For I[0] :=1 To Length(S) Do
    For J[0] :=1 To Length(S) Do
      For I[1] :=1 To Length(S) Do
        For J[1] :=1 To Length(S) Do
          For I[2] :=1 To Length(S) Do
            For J[2] :=1 To Length(S) Do
              For I[3] :=1 To Length(S) Do
                For J[3] :=1 To Length(S) Do
                  For I[4] :=1 To Length(S) Do
                    For J[4] :=1 To Length(S) Do
                      For I[5] :=1 To Length(S) Do
                        For J[5] :=1 To Length(S) Do
                          For I[6] :=1 To Length(S) Do
                            For J[6] :=1 To Length(S) Do
                              For I[7] :=1 To Length(S) Do
                                For J[7] :=1 To Length(S) Do
                                  For I[8] :=1 To Length(S) Do
                                    For J[8] :=1 To Length(S) Do Begin
                                      A :=
                                      Tbl[ I[0] +1, J[0] ] +
                                      Tbl[ I[1] +1, J[1] ] +
                                      Tbl[ I[2] +1, J[2] ] +
                                      Tbl[ I[3] +1, J[3] ] +
                                      Tbl[ I[4] +1, J[4] ] +
                                      Tbl[ I[5] +1 ,J[5] ] +
                                      Tbl[ I[6] +1, J[6] ] +
                                      Tbl[ I[7] +1 ,J[7] ] +
                                      Tbl[ I[8] +1 ,J[8] ];

                                    ActP(A);

                                    End;

  If Not Con Then
                 Goto PEnd;

  { Password For Len 19}
  19:
  For K :=1 To Length(S) Do
    For I[0] :=1 To Length(S) Do
      For J[0] :=1 To Length(S) Do
        For I[1] :=1 To Length(S) Do
          For J[1] :=1 To Length(S) Do
            For I[2] :=1 To Length(S) Do
              For J[2] :=1 To Length(S) Do
                For I[3] :=1 To Length(S) Do
                  For J[3] :=1 To Length(S) Do
                    For I[4] :=1 To Length(S) Do
                      For J[4] :=1 To Length(S) Do
                        For I[5] :=1 To Length(S) Do
                          For J[5] :=1 To Length(S) Do
                            For I[6] :=1 To Length(S) Do
                              For J[6] :=1 To Length(S) Do
                                For I[7] :=1 To Length(S) Do
                                  For J[7] :=1 To Length(S) Do
                                    For I[8] :=1 To Length(S) Do
                                      For J[8] :=1 To Length(S) Do Begin
                                        A :=
                                        Tbl[ I[0] +1, J[0] ] +
                                        Tbl[ I[1] +1, J[1] ] +
                                        Tbl[ I[2] +1, J[2] ] +
                                        Tbl[ I[3] +1, J[3] ] +
                                        Tbl[ I[4] +1, J[4] ] +
                                        Tbl[ I[5] +1 ,J[5] ] +
                                        Tbl[ I[6] +1, J[6] ] +
                                        Tbl[ I[7] +1 ,J[7] ] +
                                        Tbl[ I[8] +1 ,J[8] ] +
                                        Tbl[ 1,K];

                                      ActP(A);

                                      End;

  If Not Con Then
                 Goto PEnd;

  { Password For Len 20}
  20:
  For I[0] :=1 To Length(S) Do
    For J[0] :=1 To Length(S) Do
      For I[1] :=1 To Length(S) Do
        For J[1] :=1 To Length(S) Do
          For I[2] :=1 To Length(S) Do
            For J[2] :=1 To Length(S) Do
              For I[3] :=1 To Length(S) Do
                For J[3] :=1 To Length(S) Do
                  For I[4] :=1 To Length(S) Do
                    For J[4] :=1 To Length(S) Do
                      For I[5] :=1 To Length(S) Do
                        For J[5] :=1 To Length(S) Do
                          For I[6] :=1 To Length(S) Do
                            For J[6] :=1 To Length(S) Do
                              For I[7] :=1 To Length(S) Do
                                For J[7] :=1 To Length(S) Do
                                  For I[8] :=1 To Length(S) Do
                                    For J[8] :=1 To Length(S) Do
                                      For I[9] :=1 To Length(S) Do
                                        For J[9] :=1 To Length(S) Do Begin;
                                          A :=
                                          Tbl[ I[0] +1, J[0] ] +
                                          Tbl[ I[1] +1, J[1] ] +
                                          Tbl[ I[2] +1, J[2] ] +
                                          Tbl[ I[3] +1, J[3] ] +
                                          Tbl[ I[4] +1, J[4] ] +
                                          Tbl[ I[5] +1 ,J[5] ] +
                                          Tbl[ I[6] +1, J[6] ] +
                                          Tbl[ I[7] +1 ,J[7] ] +
                                          Tbl[ I[8] +1 ,J[8] ] +
                                          Tbl[ I[9] +1 ,J[9] ];

                                        ActP(A);

                                        End;


PEnd:
End;

End.

{ example }

{$M $9999,0,0} {important!}
Uses easPASS,CRT;


{ Procedure  SearchForPassword(MyLen:Byte;C:SetOfChar;ActP:Actproc;Con:Boolean); }

Procedure SOP(Var S:String);
var
   L : Longint;
   L1: Longint;
   C:Char;
begin;
 L := Longint( (Byte(S[1])*Byte(S[2])) + Byte(S[3]) + Byte(S[4]) * Byte(S[5]) );
 L1 := Longint( (Byte(S[1]) - Byte(S[2])) * Byte(S[3]) + Byte(S[4]) - Byte(S[5]) );
 If KeyPressed Then
    Begin;
      C := Readkey;
      If C = #27 Then Halt;
      WriteLn('current pass:',S,'                     <'#13);
      asm mov ax,0CFFh;int 21h;end;
    End;
 if (L = 9185) and  (L1 = 1961) then
  begin;
    WriteLn(#13#10'found the password! and is:',S);
    WriteLn('trying to find next!');
  end;
End;

Begin;

  SearchForPASSWord(5,['A'..'I','a'..'i','!','0'..'9'],SOp,False);

End.
