{$M $4000,0,0}
{$I-}
Program Command_Repeater;
Uses Dos,
     Crt,
     EasScr,
     EasStr,
     EasMisc,
     EasKey;

Const
        Crver:String='V2.6A';

Function DiskLabel:string;
 var
    sr:searchrec;
begin;
 FindFirst('*.*',VolumeId,sr);
 DiskLabel:=sr.name;
end;
Var
      Oneyn:String;
Procedure Crhlp;External;{$L E:\Xc\Turbo\Pas\Crhlp}

Procedure Helpscr;

Var
    P:Scrbufp;
Begin;
P:=@Crhlp;
Loadiecs(P);
Oneyn:='ELIAS BAC';
Lxy(1,23);
Textattr:=Tcoc(15,2);
Write(Crver);
Lxy(1,32);
Textattr:=Tcoc(3,6);
Write(Prstr(Easeb));
Lxy(21,55);
Textattr:=Tcoc(14,1);
Write(Oneyn);
Lxy(24,1);
End;

Const Cs='//';
      Ecs='/`';

Label Next;

Var
    O:Array[1..4] Of String;
    D:Searchrec;
    Ac,
    Nuli,
    I:Integer;
    Dirt:String;
    Tofind:Byte;
    Curfn,
    Tota:Longint;
    fsPath: Pathstr;
    fsDir: Dirstr;
    fsName: Namestr;
    fsExt: Extstr;
    Dt:Datetime;
    k:Char;
Begin;

Strfsepe:='FLE';

If lwStr(Optlast)='/eallf' Then Tofind:=Anyfile  Else Tofind:=Archive;

If (Opt(1)='') Or (Opt(2)='') Then Helpscr;

O[1]:=Opt(1);
O[2]:=Optmax(2);
Tota:=0;
Curfn:=1;
Srchrepstr('/Eallf','',O[2]);
{}
{ Predefined Symbole.}
{}
Comsepe(O[2],Cs,1,Ac);
Findfirst(Opt(1), Tofind ,D);

{Count Files}

While Doserror=0 Do Begin
                    Inc(Tota);
                    Findnext(D);
                    End;
{End-Count Files}
FSplit(O[1],fsDir, fsName, fsExt);
{}
{ File Dir = Fle05 }
If fsDir='' Then fsDir:=CurrentDir('@') Else fsDir:=Countlstr(fsDir,Length(fsDir)-1);
{}
Findfirst(O[1], Tofind ,D);
While Doserror=0 Do Begin
      If (Keypressed) Then
      Begin
      Clrkbuf;
      Write('Terminate Cr ? ');
      K:=Upcase(Readkey);
      If K <>'Y' Then Begin
                     Mbck(Ym,15);
                     Goto Next;
                     End;
      WriteLn;
      Writeln('** - Cr Terminated By User - **');
      Halt;
      End;
      Next:
      For I:=1 To Ac Do Begin
      O[3]:=Comsepe(O[2],Cs,I,Nuli);
      FSplit(D.Name,fsDir,fsName,fsExt);
      Unpacktime(D.Time,Dt);
      O[4]:=
      D.Name+     ',,,'+      { 0 File Fullfilename }
      fsName+       ',,,'+      { 1 File Name }
      fsExt+        ',,,'+      { 2 File Ext }
      Num2Str(Dt.Hour)+':'+Num2Str(Dt.Min)+':'+Num2Str(Dt.Sec)+
                  ',,,'+      { 3 File Time }
      Num2Str(Dt.Month)+'-'+Num2Str(Dt.Day)+'-'+Num2Str(Dt.Year)+
                  ',,,'+      { 4 File Date }
      fsDir+         ',,,'+      { 5 File Dir See Up Up}
      Disklabel+  ',,,'+      { 6 Disklabel }
      Num2Str(Diskfree(0))+
                  ',,,'+      { 7 Diskfree }
      Fileattributes(D.Attr)+
                  ',,,'+      { 8 File Attr }
      Copy(CurrentDir('@'),1,1)+
                  ',,,'+      { 9 Cur Drive }
      Num2Str(D.Size)+
                  ',,,'+     { 10 File Size }
      'hACKER''s FiNGERs 98!'+
                  ',,,'+     { 11 About Program Maker }
      Num2Str(Curfn)+
                  ',,,'+     { 12 Current File Number }
      Num2Str(Tota)+
                  ',,,';     { 13 Total Files Searched}
      Eformatstr(O[4],O[3]);
      RunSystem(O[3]);
      End;
      Inc(Curfn);
      Findnext(D);
      End;
End.
