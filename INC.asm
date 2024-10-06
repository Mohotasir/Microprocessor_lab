.MODEL SMALL

.DATA
    NUM DB 5      ; Define a byte-sized variable initialized to 5

.CODE

MAIN PROC
    MOV AX, @DATA ; Load the address of the data segment into AX
    MOV DS, AX    ; Initialize the data segment
    
    MOV AL, NUM   ; Move the value of NUM (5) into AL (Accumulator Register)
    INC AL        ; Increment the value in AL by 1 (AL = AL + 1)
    
    MOV NUM, AL   ; Store the incremented value back into NUM
    
    ; Exit the program
    MOV AH, 4CH   ; DOS interrupt to terminate the program
    INT 21H
    
MAIN ENDP
END MAIN
