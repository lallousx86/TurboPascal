Unit Easkey;

Interface

   Uses Crt;
     Type
           soc=set of char;


  Function   Wereadkey:Word;
  Function   Extended2Byte(W:Word):Byte;
  Procedure  ClrKbuf;
  Procedure  WriteToBufStr(s:string);
  Procedure  WriteToBufB(c:byte);
  Procedure EnLargeBuf(buf:Word);

Const

  {Functions Keys F1..F10}
  KbwSpace       = 32;
  KbwCr          = 13;
  KbwLf          = 10;
  Kbwesc         = 27;
  Kbwbel         = 07;
  Kbwbs          = 08;
  Kbwtab         = 09;     NulChar        = #0;
  Kbwf1          = 15104;  Kbwaf10        = 28928;
  Kbwf2          = 15360;  Kbwaf9         = 28672;
  Kbwf3          = 15616;  Kbwaf8         = 28416;
  Kbwf4          = 15872;  Kbwaf7         = 28160;
  Kbwf5          = 16128;  Kbwaf6         = 27904;
  Kbwf6          = 16384;  Kbwaf5         = 27648;
  Kbwf7          = 16640;  Kbwaf4         = 27392;
  Kbwf8          = 16896;  Kbwaf3         = 27136;
  Kbwf9          = 17152;  Kbwaf2         = 26880;
  Kbwf10         = 17408;  Kbwaf1         = 26624;
  {Alt Keys F1..F10}


  {Alt Keys 'A' To 'Z'}
  Kbwaa          = 7680 ;
  Kbwab          = 12288;
  Kbwac          = 11776;
  Kbwad          = 8192 ;
  Kbwae          = 4608 ;
  Kbwaf          = 8448 ;
  Kbwag          = 8704 ;
  Kbwah          = 8960 ;
  Kbwai          = 5888 ;
  Kbwaj          = 9216 ;
  Kbwak          = 9472 ;
  Kbwal          = 9728 ;
  Kbwam          = 12800;
  Kbwan          = 12544;
  Kbwao          = 6144 ;
  Kbwap          = 6400 ;
  Kbwaq          = 4096 ;
  Kbwar          = 4864 ;
  Kbwas          = 7936 ;
  Kbwat          = 5120 ;
  Kbwau          = 5632 ;
  Kbwav          = 12032;
  Kbwaw          = 4352 ;
  Kbwax          = 11520;
  Kbway          = 5376 ;
  Kbwaz          = 11264;
  Kbwamlinus     = 33280;
  Kbwaequal      = 33536;
  {Cursor Keys}
  Kbwupkey       = 18432;
  Kbwdownkey     = 20480;
  Kbwleftkey     = 19200;
  Kbwrightkey    = 19712;
  {6 Keys}
  Kbwhomekey     = 18176;
  Kbwendkey      = 20224;
  Kbwpgupkey     = 18688;
  Kbwpgdnkey     = 20736;
  Kbwinskey      = 20992;
  Kbwdelkey      = 21248;
  {Ctrl Keys}
  Kbwcf1         = 24064;
  Kbwcf2         = 24320;
  Kbwcf3         = 24576;
  Kbwcf4         = 24832;
  Kbwcf5         = 25088;
  Kbwcf6         = 25344;
  Kbwcf7         = 25600;
  Kbwcf8         = 25856;
  Kbwcf9         = 26112;
  Kbwcf10        = 26368;
  Kbwcleftkey    = 29440;
  Kbwcrightkey   = 29696;
  KbwcEndKey     = 29952;
  KbwcHomeKey    = 30464;

    Const
           AlphanChar = ['0'..'9','A'..'Z','a'..'z'];
           AlphChar   = AlphanChar - ['0'..'9'];
           NumChar    = ['0'..'9'];
           NumXChar   = ['0'..'9','a'..'f','A'..'F'];
           PonctChar  = ['.',':',',',';','/','\',#39,'"','[',']','(',')','?',
                        '~','`','!','@','#','$','%','^','&','_','|'];
           nAll1      = AlphaNChar + PonctChar + [' '];
           PhoneChar  = NumChar + ['(',')','-','/'];
           MathChar   = ['+','-','*'];
	   AllChar    = [#1..#255];
	   nAllChar   = [#31..#255];
  var
      easkeypc:pchar;
Implementation

Function Wereadkey:Word;
Var
    C : Char;
Begin

C := Readkey;
 If Ord(C) = 0 Then                    { Extended Character }
		Wereadkey:= Word(Ord(Readkey)) Shl 8
 Else Wereadkey := Ord(C);             { Normal Character }
End;

Function Extended2Byte;
Begin;
Extended2Byte:=(W Shr 8);
End;

Procedure ClrkBuf;assembler;
 asm
       mov ax,0C00h
       int 21h
 end;

Procedure WriteToBufb;assembler;
 asm
     mov ah,05
     mov cl,c
     int 16h
 end;


Procedure WriteToBufStr;

    Var
        i:byte;
  Begin;

   For i:=1 to length(s) do WriteToBufB(ord(s[i]));
 End;

Procedure EnLargeBuf;assembler;
   Asm
                mov     ah,0Ch
                int     21h
                push	es
                mov     ax,40h
                mov	es,ax
                mov	ax,0b0h
                mov	es:$80,ax
                mov	es:$1A,ax
                mov	es:$1C,ax
                add	ax,Word Ptr Buf {Size}
                mov	es:$82,ax
                pop	es

   End;

End.
