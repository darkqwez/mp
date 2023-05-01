.model small
.data
a dw 3629H   ; define a word-sized variable named 'a' and initialize it to 3629H
b dw 4738H   ; define a word-sized variable named 'b' and initialize it to 4738H

.code
start:
mov ax, @data ; Initialize data section 
mov ds, ax    ; Point ds to the data section
mov ax, a     ; Load number1 in ax 
mov bx, b     ; Load number2 in bx
add al, bl    ; Add lower two digits. Result in al
daa           ; Adjust result to valid BCD 
mov bl, al    ; Store result in bl 
adc ah, bh    ; Add upper two digits. Result in ah 
mov al, ah    ; al=ah as daa works on al only 
daa           ; Adjust result to valid BCD 
mov bh, al    ; Store result in bh 
mov ch, 04h   ; Count of digits to be displayed 
mov cl, 04h   ; Count to roll by 4 bits

l2:
rol bx, cl    ; Roll bl so that msb comes to lsb 
mov dl, bl    ; Load dl with data to be displayed 
and dl, 0fH   ; Get only lsb
cmp dl, 09    ; Check if digit is 0-9 or letter A-F 
jbe l4        ; Jump to l4 if dl <= 9 
add dl, 07H   ; If letter, add 37H 
l4: 
add dl, 30H   ; Add 30H to convert to ASCII digit 
mov ah, 02H   ; Function 2 under INT 21H (Display character)
int 21H       ; Call INT 21H to display character 
dec ch        ; Decrement count 
jnz l2        ; Jump to l2 if count != 0 

mov ah, 4cH   ; Terminate program 
int 21H
end start     ; End of program
