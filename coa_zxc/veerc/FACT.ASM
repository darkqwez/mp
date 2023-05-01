.model small
.data
a dw 05h
.code
start:  mov ax,@data
        mov ds,ax
        mov ax,01
        mov bx,a
        call fact
        mov ch,02h
        mov cl,04h
        mov bx,ax
l1:     rol bl,cl
        mov dl,bl
        and dl,0fh
        cmp dl,09
        jbe l3
        add dl,07h
l3:     add dl,30h
        mov ah,02h
        int 21h
        dec ch
        jnz l1
        mov ah,4ch
        int 21h
        FACT proc near
        cmp bx,01
        jz l5
l4:     mul bx
        dec bx
        cmp bx,01
        jnz l4
        ret
l5:     mov ax,01h
        ret
        fact endp
        end start
        end code
