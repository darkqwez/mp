.model small

.data
array db 12h, 23h, 26h, 63h, 25h, 36h, 2fh, 33h, 10h, 35h ; Define an array of 10 bytes

.code
start:
    MOV ax, @data   ; Initialize data segment register with the starting address of the data segment
    MOV ds, ax

    MOV cl, 10      ; Initialize loop counter to 10

    MOV SI, 2000h   ; Initialize source index register with address of first memory location for even numbers
    MOV DI, 2008h   ; Initialize destination index register with address of first memory location for odd numbers

    LEA BP, array   ; Load the effective address of array into the base pointer register

back:
    MOV AL, [BP]    ; Load byte pointed to by BP into accumulator
    MOV BL, AL      ; Move the byte to BL register for later storing
    
    AND AL, 01H     ; Check if the least significant bit of the byte is 0 or 1, i.e. whether it is even or odd
    JZ  next        ; Jump to next label if byte is even (least significant bit is 0)

    MOV [DI], BL    ; Store the byte in the memory location pointed to by DI if it is odd
    INC DI          ; Increment DI to point to the next memory location for odd numbers
    JMP skip        ; Jump to skip label to skip storing the byte in the memory location pointed to by SI

next:
    MOV [SI], BL    ; Store the byte in the memory location pointed to by SI if it is even
    INC SI          ; Increment SI to point to the next memory location for even numbers

skip:
    INC BP          ; Increment BP to point to the next byte in the array
    DEC CL          ; Decrement the loop counter
    JNZ back        ; Jump back to the back label if the loop counter is not zero

    int 03h         ; End the program and signal to the operating system that the program has completed execution

end start
