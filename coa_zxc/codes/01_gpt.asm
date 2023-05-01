model small  ; Declare the memory model

.data        ; Declare the data segment
a dw 3629H   ; Declare variable 'a' with value 3629H
b dw 4738H   ; Declare variable 'b' with value 4738H

.code        ; Declare the code segment

mov ax, @data  ; Initialize the data segment pointer
mov ds, ax     ; Set DS to point to the data segment

mov ax, a      ; Move value of 'a' into AX
mov bx, b      ; Move value of 'b' into BX

add al, bl     ; Add lower two digits of 'a' and 'b'. The result is stored in AL.
daa           ; Decimal adjust AL to make it a valid BCD digit.
mov bl, al     ; Move result to BL.

adc ah, bh     ; Add upper two digits of 'a' and 'b', plus any carry from the lower digits. The result is stored in AH.
mov al, ah     ; Copy the result in AH to AL.
daa           ; Decimal adjust AL to make it a valid BCD digit.
mov bh, al     ; Move result to BH.

mov ch, 04h    ; Set up the loop counter for displaying 4 digits
mov cl, 04h    ; Set up the loop counter for shifting the bits

l2:
rol bx, cl     ; Shift BX left by CL bits, rotating the bits. This moves the next digit to be displayed into the least significant 4 bits.
mov dl, bl     ; Move the value of BL into DL to get the least significant 4 bits.
and dl, 0fH    ; Mask out all but the least significant 4 bits.
cmp dl, 09     ; Compare the value of DL with 9 (to check if it's a letter or digit).
jbe l4         ; Jump if DL is less than or equal to 9.

add dl, 07h    ; Add 7 to DL to convert it to a letter (A-F).
jmp l5         ; Jump to print the character.

l4:
add dl, 30h    ; Add 30h to DL to convert it to a digit (0-9).

l5:
mov ah, 02h    ; Set up the display function.
int 21h        ; Call the interrupt to display the character.

dec ch         ; Decrement the loop counter.
jnz l2         ; If the loop counter is not zero, jump back to the start of the loop.

mov ah, 4ch    ; Set up the program termination function.
int 21h        ; Call the interrupt to terminate the program.

end           ; End of program.
