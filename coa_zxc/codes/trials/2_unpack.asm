.model small
.data
a db 13H ; Define a byte variable named "a" with a value of 13H
.code
mov ax, @data ; Initialize the data segment register
mov ds, ax ; Set the data segment register to point to the data segment
mov al, a ; Load the value of "a" into the low byte of the AX register
and al, 0f0h ; Mask off the lower nibble of "a"
mov cl, 04h ; Move the value 04h (4 in decimal) into CL
rcr al, cl ; Rotate the value in AL 4 bits to the right, putting the masked lower nibble into the upper nibble
mov bh, al ; Move the value in AL (which now contains the upper nibble) into BH
call disp ; Call the disp subroutine to display the upper nibble
mov al, a ; Load the value of "a" into the low byte of the AX register
and al, 0fh ; Mask off the upper nibble of "a"
mov bh, al ; Move the value in AL (which now contains the lower nibble) into BH
call disp ; Call the disp subroutine to display the lower nibble
mov ah, 4cH ; Set the AH register to 4CH, indicating an exit code of 0
int 21H ; Call the interrupt 21H, which terminates the program

disp proc near
mov ch, 02h ; Move the value 02h (2 in decimal) into CH, indicating the count of digits to be displayed
mov cl, 04h ; Move the value 04h (4 in decimal) into CL, indicating the count to roll by 4 bits
l2:
rol bh, cl ; Rotate the value in BH 4 bits to the left, so that the most significant bit comes to the least significant bit
mov dl, bh ; Move the value in BH into the DL register, so it can be displayed
and dl, 0fH ; Mask off all but the least significant nibble of DL
cmp dl, 09 ; Compare the value in DL to 9
jbe l4 ; Jump to l4 if DL is less than or equal to 9
add dl, 07 ; Add the value 7 to DL, which will make it a letter from A to F
l4:
add dl, 30H ; Add the value 30H to DL, which will make it the ASCII code for a digit from 0 to 9 or a letter from A to F
mov ah, 02 ; Set the AH register to 02, indicating a display character function
int 21H ; Call the interrupt 21H to display the character in DL
dec ch ; Decrement the value in CH by 1
jnz l2 ; If the value in CH is not zero, jump back to l2 to display the next nibble
mov ah, 02h ; Set the AH register to 02h
mov dl, ' ' ; Move a space character into the DL register
int 21h ; Call the interrupt 21H to display the space character
endp
ret ; Return from the disp subroutine
end ; End of the program
