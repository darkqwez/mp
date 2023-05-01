.model small
.data
a db 37h
zeros db ?
ones db ?
.code
start:  mov ax,@data
        mov ds,ax
        mov cl,08h
        mov ah,00h
        mov al,a
        mov dx,0000h
l2:     rcl al,01h
        jc l1
        inc dl
        jmp l3
l1:     inc dh
l3:     loop l2
        mov zeros,dl
        mov ones,dh
        int 03h
        end start
        end code
        
