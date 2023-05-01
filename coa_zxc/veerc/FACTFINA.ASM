.model small
.data
a dw 01h
.code
start:  mov ax,@data
        mov ds,ax
        mov ax,01
        mov bx,a
        call fact
        mov di,ax
        mov bp,2
        mov bx,dx
        mov bx,di
        dec bp
        mov ah,4ch
        int 21h
        fact proc near
        cmp bx,01
        jz l1
l2:     mul bx
        dec bx
        cmp bx,01
        jnz l2
        ret
l1:     mov ax,01h
        ret
        fact endp
        end start
        end code

