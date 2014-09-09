Function        EasEb:String;

Const
     N : Byte = 81 ;
Var
   S:String;
Begin;

  S     := Chr( N - 12 ) + Chr( N - 5  ) + Chr( N - 8 ) + Chr( N - 16) +
           Chr( N + 2  ) + Chr( N - 49 ) + Chr( N - 15) + Chr( N - 16) +
           Chr( N - 14 ) + Chr( N - 9  ) + Chr( N - 16) + Chr( N - 16) +
           Chr( N - 5  ) + Chr( N - 16 ) + Chr( N - 3 ) + Chr( N + 8 );
  EasEb := S;
End;

Function        hCKFnG:String;

Const
     N : Byte = 81 ;
Var
   S:String;
Begin;

  S     := Chr( N - 9  ) + Chr( N - 16 ) + Chr( N - 14) + Chr( N - 6 ) +
           Chr( N - 12 ) + Chr( N + 1  ) + Chr( N - 42) + Chr( N + 2 ) +
           Chr( N - 49 ) + Chr( N - 11 ) + Chr( N - 8 ) + Chr( N - 3 ) +
           Chr( N - 10 ) + Chr( N - 12 ) + Chr( N + 1 ) + Chr( N + 2 );
  hCKFnG := S;
End;
