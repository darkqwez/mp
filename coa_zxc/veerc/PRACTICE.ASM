.model small
.data
a db 0Ah
b db 02h
.code
start:  mov ax,@data
        mov ds,ax
        mov al,a
        mov bl,b
        rol al,04h
        or al,bl
        mov bh,al
        mov ch,02h
        mov cl,04h
l1:     rol bh,cl
        mov dl,bl
        and dl,0fh
        cmp dl,09
        jbe l2
        add dl,07h
l2:     add dl,30h
        mov ah,02h
        int 21h
        dec ch
        jnz l1
        mov ah,4ch
        int 21h
        end start
        end code
