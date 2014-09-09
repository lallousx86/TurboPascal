Unit EasMouse;

 Interface

 Function  IsMouseInst:boolean;
 Procedure ShowMouse;
 Procedure GetMouse(Var X,Y,Bt:Byte);
 Procedure SetMouseWindow(X1,Y1,X2,Y2:Word);
 Procedure HideMouse;
 Procedure ChangeMCur(kh:char;clr,tp:byte);
 Procedure MLxy(X,Y:word);
 Procedure SetMouseSens(X,Y,BT:Word);

 Implementation

 Procedure MLxy;
 Begin;
 x:=x*8;
 y:=y*8;
 asm
       mov ax,4h
       mov cx,y
       mov dx,x
       dec cx
       dec dx
       int 33h
 end;

 End;

 Procedure GetMouse;
  Var
      wx,wy,btx:Word;
  Begin;
    asm
        mov ax,03h
        int 33h
        mov wy,cx
        mov wx,dx
        mov btx,bx
    end;
  X:=Succ(wx div 8);
  Y:=Succ(wy div 8);
  Bt:=Btx;
  End;
 Procedure ChangeMCur;
  Begin;

   asm
       mov ax,$A
       cmp TP,0
       je  @soft
       mov cx,word ptr Kh
       mov dx,word ptr Clr
       jmp @go
  @soft:
       mov cx,0
       mov bx,0
       mov dl,Kh
       mov dh,Clr
       jmp @go
  @go:
       int 33h
  end;
 End;
 Procedure ShowMouse;assembler;
   asm
       mov ax,0001
       int 33h
   end;
 Procedure HideMouse;assembler;
  asm
      mov ax,2h
      int 33h
  end;
 Procedure SetMouseWindow;
  Begin;
   y1:=Pred(y1*8);
   y2:=Pred(y2*8);
   x1:=Pred(x1*8);
   x2:=Pred(x2*8);
  asm
        mov ax,7h
        mov cx,y1
        mov dx,y2
        int 33h
        mov ax,8h
        mov cx,x1
        mov dx,x2
        int 33h
  end;
 End;
 Procedure SetMouseSens;assembler;
 asm
      mov ah,$0f
      mov cx,y
      mov dx,x
      int 33h
 end;

 Function  IsMouseInst;
   var
       x:word;
 begin;
   asm
      mov ax,0
      int 33h
      mov x,ax
   end;
 IsMouseInst:=(x=$FFFF);
 end;
 End.
