.MODEL SMALL

 
.CODE
MAIN PROC
    MOV AH,01H
    INT 21H
    SUB AL,30H
    
    XOR CX,CX
    MOV CL,AL
    
    MOV AX,1H
    MOV BX,0

L:
    ADD BX,AX
    ADD AX,2H
    LOOP L
    
    
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN


 ; BX hold the value of SUM


