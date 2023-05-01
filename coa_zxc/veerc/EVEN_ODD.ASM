.model small
.data
array db 12h,23h,26h,63h,25h,36h,2fh,33h,10h,35h
.code
start: MOV ax,@data
mov ds,ax
mov cl,0Ah
mov si,2000h
mov di,2008h
lea bp,array
back: mov al,ds:[bp]
mov bl,al
and al,01h
jz next
mov [di],bl
inc di
jmp skip
next: mov [si],bl
inc si
skip: inc bp
dec cl
jnz back
mov ah,4ch
int 21h
end start
end code
