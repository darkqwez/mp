.model small
.code
start:  mov si,2000h
        mov di,4000h
        mov cl,05h
l1:     mov bx,[si]
        mov [di],bx
        inc si
        inc di
        dec cl
        jnz l1
        int 03h
        end start
        end code

