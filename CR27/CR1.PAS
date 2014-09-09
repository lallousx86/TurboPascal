{$M $4000,0,65535}

Program           Command_Repeater;

Uses              Dos;

Type
  DiskInfo = Record
    InfoLevel : Word;
    SN        : Longint;
    VLabel    : Array[1..11] Of Char;
    FileSys   : Array[1..8] Of  Char;
  End;

Const

  CrVer='CR Pro v2.7';
  CrDate='6 Jul 1997';

  RegTo:String[16] = 'Elias Bachaalany';

  CS = '//';
  FStr = 'FLE';
Var
  I,J,
  AC:Integer;

  K:Char;

  TotalFiles:LongInt;

  OOptions , OFiles : String;

  ToFind:Byte;

Procedure GetDiskInfo(Var Di:DiskInfo);Assembler;
  Asm
    PUSH       DS
    PUSH       BP
    MOV        AX,6900h
    LDS        DX,&DI
    XOR        BX,BX
    INT        21h
    POP        BP
    POP        DS
  End;

Function       AdjustLast(k:Char;Dn:String):String;
 Begin;
   If Dn[Length(Dn)] = K Then Dec (Dn[0]);
   AdjustLast := Dn;
 End;

Procedure PrintC(Msg:String;Nl:Byte);Assembler;
Asm
  LES           DI,Msg

  MOV           AH,9         { write function             }
  XOR           CX,CX        { character count            }
  PUSH          CX           {                            }
  POP           BX           { bx = cx                    }
  CWD                        { dx = cx = 0                }
  INC           CX           { cx = 1                     }

  MOV           DL,ES:[DI]   { get len                    }
  MOV           BL,7         { set init. color            }

 @@1:
  INC           DI           { inc index                  }
  DEC           DL           { dec len                    }

  CMP           DL,-1        { finshed                    }
  JE            @@3          { yes? exit                  }

  CMP           BYTE PTR ES:[DI],0Fh
  JNBE          @@2          { is it a color and less than 16 }

  MOV           BL,ES:[DI]   { yes, bl = color           }
  JMP           @@1          { get another char.         }
 @@2:
  PUSH          AX           { save                      }
  PUSH          DX           {      them                 }
  PUSH          CX           {           all             }

  MOV           AL,ES:[DI]   { al = char.                }
  INT           10h          { call bios                 }
  MOV           AH,3         { get cursor info           }
  INT           10h          { call bios                 }
  INC           DL           { X = X + 1                 }
  DEC           AH           { set cursor info           }
  INT           10h          { call bios                 }
  POP           CX           { pop                       }
  POP           DX           {     them                  }
  POP           AX           {          all              }
  JMP           @@1          { get more char.            }
 @@3:
  CMP           NL,1
  JNE           @@4
  MOV           AH,2
  MOV           DL,13
  INT           21h
  MOV           DL,10
  INT           21h
 @@4:
End;


Procedure       DisplayHelp;
Begin;
  PrintC (#14+CrVer+#7' Copyright (c) 1995-97 '#10'Elias Bachaalany. '#7+CrDate,1);
  PrintC ('All Rights Reserved.  All Questions And Suggestions are accepted.',1);
  PrintC ('Registered to ®'#2+RegTo+#7'¯',1);
  PrintC ('',1);
  PrintC ('Short display of used commands and options. Type CR /? for complete Reference.',1);
  PrintC ('',1);
  PrintC ('Usage: CR <file(s)::file(s)> [<command_1> // <command_ü>] <Switches>',1);
  PrintC ('Example: CR *.* Echo Deleting file "'#3'FLE00'#7'" ('#3'FLE12'#7'/'#3'FLE13'#7') // Del '#3'FLE00',1);
  PrintC ('',1);
  PrintC ('<Files Search Information: '#3'FLE'#7'nn Meanings>',1);
  PrintC ('',1);
  {
  WriteLn('  ',FStr,'00: full file name ',FStr+'01: file name (file_ext)':41);
  WriteLn('  ',FStr,'02: only file name (file_)',FStr+'03: file extention':28);
  WriteLn('  ',FStr,'04: file drive ',FStr+'05: file path':34);
  WriteLn('  ',FStr,'06: file size  ',FStr+'07: file attr.':35);
  WriteLn('  ',FStr,'08: file date  ',FStr+'09: file time':34);
  WriteLn('  ',FStr,'10: file number',FStr+'11: file total':35);
  WriteLn('  ',FStr,'12: disk volume label',FStr+ '13: disk total size in bytes':43);
  WriteLn('  ',FStr,'14: disk free space',FStr+'15: disk used space':36);
  WriteLn('  ',FStr,'15: CR''s path and Parameters',FStr+'16: CR''s Maker':22);
  WriteLn('<Switches>');
  WriteLn('  ','x: exculdes files','m: mask files':32);
  }
End;

Begin;
  { Init }
  Asm Mov AX,0003;Int 10h End;
  DisplayHelp;
  { Done }

End.
