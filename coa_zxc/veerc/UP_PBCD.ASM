.model small
.data
n1 db 05h
n2 db 09h
pbcd db ?
.code
start:mov ax,@data
      mov ds,ax
      mov al,n1
      mov bl,n2
      mov cl,04h
      ror al,cl
      or al,bl
      mov pbcd,al
      int 03h
      end start
      end code
