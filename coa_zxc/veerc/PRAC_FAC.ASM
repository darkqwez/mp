.model small
.data
a dw 05h
.code
start:  mov ax,@data
        mov ds,ax
        mov ax,01h
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
        je l2
l1:     mul bl
        dec bl
        cmp bl,01h
        jne l1
        ret
l2:     mov ax,01
        ret
        fact endp
        end start
        end code




