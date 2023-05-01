.model small
.data
num dw 05h ; Define a word-sized variable called "num" and initialize it with the value 5

.code
MOV ax, @data ; Initialize the data segment by moving the value of the @data segment into the ax register
MOV ds, ax ; Move the value in ax register to the ds register to point to the beginning of the data segment

MOV ax, 01 ; Initialize ax register with the value 1
MOV bx, num ; Load the value of "num" variable into the bx register
CALL fact ; Call the "fact" procedure to find the factorial of the number in bx register

MOV di, ax ; Move the least significant byte (lsb) of the result into the di register
MOV bp, 2 ; Initialize count for the number of times the display is called
MOV bx, dx ; Move the most significant byte (msb) of the result into the bx register
MOV bx, di ; Move the lsb of the result into the bx register
DEC bp ; Decrement the value of bp register by 1

MOV ah,4ch ; Move the value 4ch (function to exit the program) into the ah register
Int 21h ; Call the interrupt 21h to exit the program

Fact proc near ; Define a near procedure called "fact" to find the factorial of a number
CMP bx,01 ; Compare the value in bx register with 1
JZ l11 ; Jump to "l11" label if the value in bx register is 1
l12: MUL bx ; Multiply ax register with bx register
DEC bx ; Decrement the value in bx register by 1
CMP bx,01 ; Compare the value in bx register with 1
JNE l12 ; Jump back to "l12" label if the value in bx register is not 1
RET ; Return to the calling program

l11:MOV ax,01 ; If the value in bx register is 1, move 1 into the ax register
RET ; Return to the calling program

fact ENDP ; End the procedure "fact"

END ; End the program
