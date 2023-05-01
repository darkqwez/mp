.MODEL SMALL ; define memory model
.STACK 100H ; set stack size

.DATA ; start data segment
STRING DB 'Madam', '$' ; define the string to be checked
STRING1 DB 'String is palindrome', '$' ; message to output if string is a palindrome
STRING2 DB 'String is not palindrome', '$' ; message to output if string is not a palindrome

.CODE ; start code segment
MAIN PROC FAR ; define main procedure
MOV AX, @DATA ; move the address of data segment to AX register
MOV DS, AX ; move the value of AX register to DS register

; call the Palindrome subroutine to check if the string is a palindrome
CALL Palindrome

; interrupt to exit the program
MOV AH, 4CH
INT 21H

MAIN ENDP ; end main procedure

Palindrome PROC ; start palindrome procedure

; load the starting address of the string into SI register
MOV SI, OFFSET STRING

; traverse to the end of the string
LOOP1 :
MOV AX, [SI]
CMP AL, '$' ; check if the character is the end of the string
JE LABEL1 ; jump to label1 if it is
INC SI ; move to next character
JMP LOOP1 ; continue looping

; load the starting address of the string
LABEL1 :
MOV DI, OFFSET STRING
DEC SI ; point to the last character

; compare characters at the beginning and end of the string
LOOP2 :
CMP SI, DI ; check if SI has reached DI or not
JL OUTPUT1 ; jump to OUTPUT1 if the string is a palindrome
MOV AX, [SI] ; move the current character into AX
MOV BX, [DI] ; move the corresponding character at the other end of the string into BX
CMP AL, BL ; compare the two characters
JNE OUTPUT2 ; jump to OUTPUT2 if they are not equal
DEC SI ; move to the next character from the beginning
INC DI ; move to the next character from the end
JMP LOOP2 ; continue looping

OUTPUT1:
LEA DX,STRING1 ; load the address of the message into DX
MOV AH, 09H ; set up for output to the console
INT 21H ; output the message
RET ; return from the subroutine

OUTPUT2:
LEA DX,STRING2 ; load the address of the message into DX
MOV AH,09H ; set up for output to the console
INT 21H ; output the message
RET ; return from the subroutine

Palindrome ENDP ; end of palindrome procedure
END MAIN ; end of program
