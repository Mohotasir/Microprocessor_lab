


.MODEL SMALL  ; Use the small memory model (64KB for code and data segments)    

.STACK 100H   ; Define stack segment size

.DATA         ; Define the data segment
    A DB 09H  ; First number (9 in hexadecimal)
    B DB 03H  ; Second number (3 in hexadecimal)
    RES DB ?  ; Reserve a byte for the result

.CODE         ; Begin the code segment
MAIN PROC     
    MOV AX, @DATA  ; Initialize data segment by loading its address into AX
    MOV DS, AX     ; Move the address in AX to DS (data segment register)

    MOV AL, A      ; Load the value of A (09H) into register AL
    ADD AL, B      ; Add the value of B (03H) to AL (AL = A + B)
    MOV RES, AL    ; Store the result of the addition in RES
    HLT
    MOV AH, 4CH    ; Terminate program (DOS interrupt)
    INT 21H        ; Call DOS to terminate

MAIN ENDP          ; End of main procedure
END MAIN           ; End of the program
