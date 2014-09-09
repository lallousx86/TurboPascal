{               Copyright 1991 TechnoJock Software, Inc.               }
{                          All Rights Reserved                         }
{                         Restricted by License                        }

{                             Build # 1.10                             }

Unit totSYS;
{$I TOTFLAGS.INC}

{
 Development History:
             03/15/91  1.00a   Changed DesqView checks
             02/03/92  1.00b   Changed tDate to tOSDate (conflicted with TotDate)
             12/15/92  1.10    DPMI update
}

INTERFACE

uses DOS, CRT;

TYPE
tVideo = (UnKnown, Mono, CGA, MCGAMono, MCGACol, EGAMono, EGACol, VGAMono, VGACol);
tOSDate = (USA,Europe,Japan);

pDisplayOBJ = ^DisplayOBJ;
DisplayOBJ = object
   vSnowProne : boolean;     {does system suffer from snow}
   vWidth : byte;            {no. of characters of display}
   vDepth: byte;             {no. of lines of display}
   vBaseOfScreen: pointer;   {location of video memory}   {5.00a}
   vDisplayType: tVideo;     {video display type}
   vForceBW: boolean;        {uses monochrome color schemes}
   {methods...}
   constructor Init;
   function    TestVideo: tVideo;
   function    SnowProne: boolean;
   function    GetMode: byte;
   function    ColorOn: boolean;
   function    Width: byte;
   function    Depth: byte;
   function    DisplayType: tVideo;
   procedure   SetCondensed;
   procedure   SetBW(on:boolean);
   procedure   Set25;
   function    BaseOfScreen:pointer;        {returns ptr to video memory}
   destructor  Done;
end; {DisplayOBJ}

pEquipOBJ = ^EquipOBJ;
EquipOBJ = object
   vMainInfo: word;
   vComputerID: byte;
   vRomDate: string[8];
   {methods...}
   constructor Init;
   function    ComputerID: byte;
   function    ParallelPorts: byte;
   function    SerialPorts: byte;
   function    FloppyDrives: byte;
   function    ROMDate: string;
   function    GameAdapter: boolean;
   function    SerialPrinter: boolean;
   function    MathChip: boolean;
   destructor  Done;
end; {EquipOBJ}

pMemOBJ = ^MemOBJ;
MemOBJ = object
   vMemInfo: word;
   vMaxExtMem: word;
   vMaxExpMem: word;
   vEMMInstalled: boolean;
   vEMMmajor: byte;
   vEMMminor: byte;
   {methods...}
   constructor Init;
   function    BaseMemory: integer;
   function    EMMInstalled: boolean;
   function    EMMVersionMajor: byte;
   function    EMMVersionMinor: byte;
   function    EMMVersion: string;
   function    MaxExtMem: word;
   function    MaxExpMem: word;
   function    ExtMemAvail: word;
   function    ExpMemAvail: word;
   destructor  Done;
end; {MemOBJ}

pOSOBJ = ^OSOBJ;
OSOBJ = object  {Operating System}
   vMajor: byte;
   vMinor: byte;
   vCountry: word;
   vDateFmt: tOSDate;
   vCurrency: string[5];
   vThousands: byte;
   vDecimal: byte;
   vDateSeparator: byte;
   vTimeSeparator: byte;
   vTimeFmt: byte;
   vCurrencyFmt: byte;
   vCurrencyDecPlaces: byte;
   {methods...}
   constructor Init;
   function OSVersionMajor: byte;
   function OSVersionMinor: byte;
   function OSVersion: string;
   function Country: word;
   function Currency: string;
   function DateFmt: tOSDate;
   function TimeFmt: byte;
   function ThousandsSep: char;
   function DecimalSep: char;
   function DateSep: char;
   function TimeSep: char;
   function CurrencyFmt: byte;
   function CurrencyDecPlaces: byte;
   destructor  Done;
end; {OSOBJ}

procedure sysINIT;

VAR
  Monitor: ^DisplayObj;

IMPLEMENTATION
{||||||||||||||||||||||||||||||||||||}
{                                    }
{     D I S P L A Y    S T U F F     }
{                                    }
{||||||||||||||||||||||||||||||||||||}
constructor DisplayObj.Init;
{}
var
   Mode : byte;
   Regs: Registers;
begin
   vDisplayType := TestVideo;
(* Disabled due to driver conflicts
   with Regs do
   begin
      AX := $2B01;       {1.00a DesqViewTest}
      CX := $4445;
      DX := $5351;
      intr($21,Regs);
      if Al <> $FF then {DesqView present}
      begin
         Ah := $FE;
         Intr($10,Regs);
         vBaseOfScreen := ptr(ES,DI);
      end
      else
      begin
         Mode := GetMode;
         if Mode = 7 then
            vBaseOfScreen := ptr($B000,0)  {Mono}
         else
            vBaseOfScreen := ptr($B800,0); {Color}
      end;
   end;
*)
   Mode := GetMode;
{$IFDEF DPMI}                 {1.10}
   if Mode = 7 then
      vBaseOfScreen := ptr(segB000,0)  {Mono}
   else
      vBaseOfScreen := ptr(segB800,0); {Color}
{$ELSE}
   if Mode = 7 then
      vBaseOfScreen := ptr($B000,0)  {Mono}
   else
      vBaseOfScreen := ptr($B800,0); {Color}
{$ENDIF}
   vSnowProne := (vDisplayType = CGA);
   vWidth := 80;
   vDepth := succ(Hi(WindMax));
   vForceBW := false;
end; {DisplayObj.Init}

function DisplayOBJ.TestVideo: tVideo;
{}
var
   Regs: Registers;
   Equip: byte;
   Temp: tVideo;
begin
   with Regs do
   begin
      Al := $00;
      Ah := $1A;   {get VGA info}
      Intr($10,Regs);
      if Al = $1A then
         case Bl of
         $00: Temp := unknown;
         $01: Temp := Mono;
         $04: Temp := EGACol;
         $05: Temp := EGAMono;
         $07: Temp := VGAMono;
         $08: Temp := VGACol;
         $0A,
         $0C: Temp := MCGACol;
         $0B: Temp := MCGAMono;
         else
            Temp := CGA;
         end {case}
      else         {more checking needed}
      begin
         Ah := $12;
         BX := $10;  {get EGA data}
         Intr($10,Regs);
         if BX = $10 then {EGA or Mono}
         begin
             Intr($11,Regs);
             if ((Al and $30) shr 4) = 3 then
                Temp := Mono
             else
                Temp := CGA;
         end
         else 
         begin
             Ah := $12;
             BX := $10;  {one more time!}
             Intr($10,Regs);
             if Bh = 0 then
                Temp := EGACol
             else
                Temp := EGAMono;
         end;  {if}
      end; {if}
   end; {with}
   TestVideo := Temp;
end; {DisplayOBJ.TestVideo}

function DisplayObj.GetMode;
{}
var Regs : registers;
begin
   with Regs do
   begin
      Ax := $0F00;
      Intr($10,Regs);  {get video display mode}
      GetMode := Al;
   end;
end; {DisplayObj.GetMode}

function DisplayObj.ColorOn: boolean;
{}
begin
   if (vForceBW)
   or (DisplayType in [Mono, MCGAMono, EGAMono, VGAMono])
   or (GetMode = 2) then       {Mode BW80 active}
      ColorOn := False
   else
      ColorOn := true;
end; {DisplayObj.ColorOn}

procedure DisplayOBJ.SetBW(On:boolean);
{}
begin
   vForceBW := On;
end; {DisplayOBJ.SetBW}

function DisplayObj.BaseOfScreen: pointer;
{}
begin
    BaseofScreen := vBaseOfScreen; {1.00a}
end; {DisplayObj.BaseOfScreen}

function DisplayObj.SnowProne: boolean;
{}
begin
   SnowProne := vSnowProne;
end; {DisplayObj.SnowProne}

function DisplayObj.Width: byte;
{}
begin
   Width := vWidth;
end; {DisplayObj.Width}

function DisplayObj.Depth: byte;
{}
begin
   Depth := vDepth;
end; {DisplayObj.Depth}

function DisplayObj.DisplayType: tVideo;
{}
begin
    DisplayType := vDisplayType;
end; {DisplayObj.DisplayType}

procedure DisplayObj.SetCondensed;
{sets to maximum number od display lines supported by the display system}
begin
   if vDisplayType in [EGAMono,EGACol,VGAMono,VGACol] then
   begin
      TextMode(Lo(LastMode)+Font8x8);
      vDepth := succ(Hi(WindMax));
   end;
end; {DisplayObj.SetCondensed}

procedure DisplayObj.Set25;
{resets display back to 25 lines}
begin
   if Depth <> 25 then
   begin
      TextMode(Lo(LastMode));
      vDepth := succ(Hi(WindMax));
   end;
end; {DisplayObj.Set25}

destructor DisplayObj.Done;
begin end;

{||||||||||||||||||||||||||||||||||||}
{                                    }
{       E Q U I P    S T U F F       }
{                                    }
{||||||||||||||||||||||||||||||||||||}

constructor EquipOBJ.Init;   {1.10}
{}
var
  Reg: registers;
  IDPtr: pointer;
  ROMPtr: pointer;
begin
   intr($11,Reg);
   vMainInfo := Reg.AX;
{$IFDEF DPMI}
   vComputerID := 0;
   vRomdate := 'Unknown';
{$ELSE}
   IDPtr := ptr($F000,$FFFE);
   vComputerID := byte(IDPtr^);
   ROMPtr := ptr($F000,$FFF5);
   move(ROMPtr^,vROMDate[1],8);
   vROMDate[0] := chr(8);
{$ENDIF}
end; {of const EquipOBJ.Init}

function EquipOBJ.ComputerID: byte;
{}
begin
   ComputerID := vComputerID;
end; {EquipOBJ.ComputerID}

function EquipOBJ.ParallelPorts: byte;
{}
begin
   ParallelPorts := hi(vMainInfo) shr 6;
end; {EquipOBJ.ParallelPorts}

function EquipOBJ.SerialPorts: byte;
{}
begin
   SerialPorts := hi(vMainInfo) and $0F shr 1;
end; {EquipOBJ.SerialPorts}

function EquipOBJ.FloppyDrives: byte;
{}
begin
   FloppyDrives := ((vMainInfo and $C0) shr 6) + 1;
end; {EquipOBJ.FloppyDrives}

function EquipOBJ.ROMDate: string;
{}
begin
   ROMDate := vROMDate;
end; {EquipOBJ.ROMDate}

function EquipOBJ.GameAdapter: boolean;
{}
begin
   GameAdapter := ((vMainInfo and $1000) = 1);
end; {EquipOBJ.GameAdapter}

function EquipOBJ.SerialPrinter: boolean;
{}
begin
   SerialPrinter := ((vMainInfo and $2000) = 1);
end; {EquipOBJ.SerialPrinter}

function EquipOBJ.MathChip: boolean;
{}
begin
   MathChip := ((vMainInfo and $2) = $2);
end; {EquipOBJ.mathChip}

destructor EquipOBJ.Done;
begin end;

{||||||||||||||||||||||||||||||||}
{                                }
{       M E M    S T U F F       }
{                                }
{||||||||||||||||||||||||||||||||}

constructor MemOBJ.Init;
{}
const
   FingerPrint: string[8] = 'EMMXXXX0';
var  
   Regs: registers;
   ID: string[8];
begin
{$IFDEF DPMI}
   vEMMInstalled := false;
{$ELSE}
   intr($12,Regs);
   vMemInfo := Regs.AX;
   with regs do
   begin
      Ah := $35;
      Al := $67;
      Intr($21,Regs); {ES now points to int $67 segment -- id is 10 bytes on}
      move(mem[ES:$000A],ID[1],8);
      ID[0] := chr(8);
      vEMMInstalled := (ID = FingerPrint);
   end;
{$ENDIF}
   vEMMMajor := 0;
   vEMMMinor := 0;
   if EMMInstalled then
   begin
      {get total expanded memory}
      Regs.Ah := $42;
      intr($67,Regs);
      vMaxExpMem := Regs.DX * 16;
      {get driver version number}
      Regs.Ah := $46;
      intr($67,Regs);
      if Regs.Ah = 0 then
      begin
          vEMMMajor := Regs.Al shr 4;
          vEMMMinor := Regs.AL and $F;
      end;
   end
   else
      vMaxExpMem := 0;
end; {of const MemOBJ.Init}

function MemOBJ.BaseMemory: integer;
{}
begin
   BaseMemory := vMemInfo;
end; {MemOBJ.BaseMemory}

function MemOBJ.EMMInstalled: boolean;
{}
begin
   EMmInstalled := vEMMInstalled;
end; {MemOBJ.EMMInstalled}

function MemOBJ.ExtMemAvail: word;
{}
var regs : registers;
begin
   Regs.Ah := $88;
   Intr($15,Regs);
   ExtMemAvail := Regs.AX;
end; {MemOBJ.ExtMemAvail}

function MemOBJ.ExpMemAvail: word;
{}
var regs : registers;
begin
   if EMMInstalled then
   begin
      Regs.Ah := $42;
      intr($67,Regs);
      ExpMemAvail := Regs.BX * 16;
   end
   else
      ExpMemAvail := 0;
end; {MemOBJ.NetExpMemory}

function MemOBJ.MaxExpMem: word;
{}
begin
   MaxExpMem := vMaxExpMem
end; {MemOBJ.MaxExpMem}

function MemOBJ.MaxExtMem: word;
{}
begin
   MaxExtMem := vMaxExtMem
end; {MemOBJ.MaxExtMem}

function MemOBJ.EMMVersionMajor: byte;
{}
begin
   EMMVersionMajor := vEMMMajor;
end; {MemOBJ.EMMVersionMajor}

function MemOBJ.EMMVersionMinor: byte;
{}
begin
   EMMVersionMinor := vEMMMinor;
end; {MemOBJ.EMMVersionMinor}

function MemOBJ.EMMVersion: string;
{}
begin
   EMMVersion := chr(EMMVersionMajor + 48)+'.'+chr(EMMVersionMinor + 48);
end; {MemOBJ.EMMVersion}


destructor MemOBJ.Done;
begin end;

{||||||||||||||||||||||||||||||||}
{                                }
{       O. S.    S T U F F       }
{                                }
{||||||||||||||||||||||||||||||||}
constructor OSObj.Init;
{}
var
   Regs: registers;
   CountryBuf: array[0..$21] of byte;
   P: byte;
   W: word absolute CountryBuf;
begin
   with regs do
   begin
      Ah := $30;
      msdos(Regs);
      vMajor := Al;
      vMinor := Ah;
      AX := $3800;
      DS := seg(CountryBuf);
      DX := ofs(CountryBuf);
      intr($21,Regs);
      vCountry := Regs.BX;
      if vMajor >= 3 then
      begin
         vDateFmt := tOSDate(W);
         vCurrency := '     ';
         move(CountryBuf[$2],vCurrency[1],5);
         P := pos(#0,vCurrency);      {ASCIIZ string form}
         if P > 0 then
            delete(vCurrency,P,5);
         vThousands := CountryBuf[$7];
         vDecimal := CountryBuf[$9];
         vDateSeparator := CountryBuf[$B];
         vTimeSeparator := CountryBuf[$D];
         vTimeFmt := CountryBuf[$11];
         vCurrencyFmt := CountryBuf[$F];
         vCurrencyDecPlaces := CountryBuf[$10];
      end
      else
      begin
         vDateFmt := tOSDate(W);
         vCurrency := chr(CountryBuf[$2]);
         vThousands := CountryBuf[$04];
         vDecimal := CountryBuf[$06];
         vDateSeparator := ord('/');   {not avialable before DOS 3}
         vTimeSeparator := ord(':');
         vTimeFmt := 1;
         vCurrencyFmt := 0;
         vCurrencyDecPlaces := 2;
      end;
   end;
end; {of const OSObj.Init}

function OSObj.OSVersionMajor: byte;
{}
begin
   OSVersionMajor := vMajor;
end; {OSObj.OSVersionMajor}

function OSObj.OSVersionMinor: byte;
{}
begin
   OSVersionMinor := vMinor;
end; {OSObj.OSVersionMinor}

function OSObj.OSVersion: string;
{}
begin
   OSVersion := chr(OSVersionMajor + 48)+'.'+chr(OSVersionMinor + 48);
end; {OSObj.OSVersion}

function OSObj.Country: word;
{}
begin
   Country := vCountry;
end; {OSObj.Country}

function OSObj.Currency: string;
{}
begin
   Currency := vCurrency;
end; {OSObj.Currency}

function OSObj.DateFmt: tOSDate;
{}
begin
   DateFmt := vDateFmt;
end; {OSObj.DateFmt}

function OSObj.ThousandsSep: char;
{}
begin
   ThousandsSep := chr(vThousands);
end; {OSObj.ThousandsSep}

function OSObj.DecimalSep: char;
{}
begin
   DecimalSep := chr(vDecimal);
end; {OSObj.DecimalSep}

function OSObj.DateSep: char;
{}
begin
   DateSep := chr(vDateSeparator);
end; {OSObj.DateSep}

function OSObj.TimeSep: char;
{}
begin
   TimeSep := chr(vTimeSeparator);
end; {OSObj.TimeSep}

function OSObj.TimeFmt: byte;
{}
begin
   TimeFmt := vTimeFmt;
end; {OSObj.TimeFmt}

function OSObj.CurrencyFmt: byte;
{}
begin
   CurrencyFmt := vCurrencyFmt;
end; {OSObj.CurrencyFmt}

function OSObj.CurrencyDecPlaces: byte;
{}
begin
   CurrencyDecPlaces := vCurrencyDecPlaces;
end; {OSObj.CurrencyDecPlaces}

destructor OSObj.Done;
begin end;
{|||||||||||||||||||||||||||||||||||||||||||||||}
{                                               }
{     U N I T   I N I T I A L I Z A T I O N     }
{                                               }
{|||||||||||||||||||||||||||||||||||||||||||||||}
procedure SysInit;
{initilizes objects and global variables}
begin
   new(Monitor,Init);
end;

{end of unit - add intialization routines below}
{$IFNDEF OVERLAY}
begin
   SysInit;
{$ENDIF}
end.


