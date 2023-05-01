.model small
.data
a db 37h
zeros db ?
ones db ?
.code
start:  mov ax,@data
        mov ds,ax
        mov al,a
        mov cl,08h
        mov ah,00h
        mov dx,0000h
l1:     rcl al,01h
        jc l2
        inc dh
        jmp l3
l2:     inc dl
l3:     dec cl
        jnz l1
        mov zeros,dh
        mov ones,dl
        int 03h
        end start
        end code
