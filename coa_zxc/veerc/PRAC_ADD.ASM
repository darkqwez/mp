.model small
.data
a dw 3629h
b dw 4738h
.code
start:  mov ax,@data
        mov ds,ax
        mov ax,a
        mov bx,b
        add al,bl
        daa
        mov bl,al
        adc ah,bh
        mov al,ah
        daa
        mov bh,al
        mov ch,04h
        mov cl,04h
l1:     rol bx,cl
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

