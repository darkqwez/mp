.model small
.data
a db 0Ah
b db 05h
.code
start:  mov ax,@data
        mov ds,ax
        mov al,a
        mov bl,b
        mov cl,04h
        ror al,cl
        add al,bl
        mov ch,02h
        mov cl,04h
        mov bh,al
l2:     rol bh,cl
        mov dl,bh
        and dl,0fh
        cmp dl,09
        jbe l4
        add dl,07h
l4:     add dl,30h
        mov ah,02h
        int 21h
        dec ch
        jnz l2
        mov ah,4ch
        int 21h
        end start

