{$M $4000,0,65535}

Program           Command_Repeater;

Uses              Dos;
 {$I E:\try\Cr27\EForm.Pas}
 {$I E:\try\Cr27\EasEb.Pas}
 {$I E:\try\Cr27\PrintStr.Pas}
Const

  CrVer='CR Pro v2.7';
  CrDate='6 Jul 1997';

  RegTo:String[16] = 'Elias Bachaalany';

  CS = '//';
  FStr = 'FSI';
Var
  I,J,
  AC:Integer;

  K:Char;

  TotalFiles:LongInt;


  OOptions , OFiles : String;

  ToFind:Byte;

Function      DiskLabel:String;
  Var
    Sr:SearchRec;
  Begin;
    FindFirst('*.*',VolumeID,Sr);
    DiskLabel := Sr.Name;
  End;

Function       AdjustLast(k:Char;Dn:String):String;
 Begin;
   If Dn[ Length(Dn) ] = K Then Dec ( Dn[0] );
   AdjustLast := Dn;
 End;


Procedure       DisplayHelp;
Begin;
  WriteLn(CrVer,' Copyright (c) 1995-97 ',EasEb,'. ',CrDate);
  WritELN('All Rights Reserved.  All Questions And Suggestions are accepted.');
  WriteLn('Registered to ®',EasEb,'¯');
  WriteLn;
  WriteLn('Short display of used commands and options. Type CR /? for complete Reference.');
  WriteLn;
  WriteLn('Usage: CR <file(s)::file(s)> [<command_1> // <command_ü>] <Switches>');
  WriteLn('Example: CR *.* Echo Deleting file "FSI00" (FSI12/FSI13) // Del FSI00');
  WriteLn;
  WriteLn('<Files Search Information: FSInn Meanings>');
  WriteLn;
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
End;


Begin;
  { Init }

  If ParamCount < 2 Then
  Begin;
    DisplayHelp;
    Exit;
  End;

  { Gather Input Information }
  OFiles := ParamStr(1);
  For I := 2 To ParamCount Do OOptions := OOptions + ParamStr(I) + ' ';
  OOptions := AdjustLast(' ',OOptions);


  ToFind := Dos.Archive;
  ComSepe(OOptions,Cs,-1,Ac);



  { Done }

End.
