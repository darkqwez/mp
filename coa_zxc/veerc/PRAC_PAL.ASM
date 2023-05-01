.model small
.data
string db 'radar','$'
string1 db 'String is palindrome','$'
string2 db 'String is not palindrome','$'
.code
main proc far
mov ax,@data
mov ds,ax
call palindrome
mov ah,4ch
int 21h
main endp
palindrome proc near
mov si,offset string
l1: mov ax,[si]
    cmp al,'$'
    je l2
    inc si
    jmp l1
l2: mov di,offset string
    dec si
l3: cmp si,di
    je o1
    mov ax,[si]
    mov bx,[di]
    cmp al,bl
    jne o2
    dec si
    inc di
    jmp l3
o1: lea dx,string1
    mov ah,09h
    int 21h
    ret
o2: lea dx,string2
    mov ah,09h
    int 21h
    ret
    palindrome endp
    end main
