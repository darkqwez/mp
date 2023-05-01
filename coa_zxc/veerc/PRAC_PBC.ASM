.model small
.data
a db 0Ah
b db 0Dh
.code
start:  mov ax,@data
        mov ds,ax
        mov al,a
        mov bl,b
        mov cl,04h
        rol al,cl
        add al,bl
        mov bl,al
        mov cl,04h
        mov ch,02h
l1:     rol bl,cl
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
