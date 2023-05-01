.model small          ; Define the memory model to be used by the program
.data                 ; Define the data segment
n1 db 31h             ; Define an 8-bit number to count the 1's and 0's for
zeros db 1 dup(0)     ; Define a variable to store the count of 0's
ones db 1 dup(0)      ; Define a variable to store the count of 1's
.code                 ; Define the code segment
Start:                ; Start the program
mov ax,@data          ; Initialize the data segment
mov ds,ax             ; Set the data segment to the address in ax
mov cl,08h            ; Set the loop counter to 8 (we will loop through each bit)
mov ah,00h            ; Clear the high byte of ax (we will use ax to shift the bits)
mov al,n1             ; Move the input number into the low byte of ax
mov dx,0000h          ; Clear the dx register (we will use dx to store the counts)

up:                   ; Start of the loop
rcl al,01H            ; Rotate the bits of the input number left through the carry flag
JC next               ; If the carry flag is set (most significant bit is 1), jump to the next label
inc dl                ; Increment the count of 1's
jmp down              ; Jump to the end of the loop
next:                 ; Label for when the carry flag is set
inc dh                ; Increment the count of 0's
down:                 ; End of the loop
loop up              ; Decrement the loop counter and loop back to the start of the loop if it is not zero

mov zeros, dh         ; Move the count of 0's into the zeros variable
mov ones,dl           ; Move the count of 1's into the ones variable
int 03H               ; Terminate the program

end Start             ; End of the program
