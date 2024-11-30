.MODEL SMALL

.DATA 
  MSG DB "Enter your score (0-100): $"
  GRA_A_PLUS DB 0AH, 0DH, "Your grade is A+ $"
  GRA_A DB 0AH, 0DH, "Your grade is A $"
  GRA_A_MINUS DB 0AH, 0DH, "Your grade is A- $"
  GRA_B DB 0AH, 0DH, "Your grade is B $"
  GRA_B_MINUS DB 0AH, 0DH, "Your grade is B- $"
  GRA_FAIL DB 0AH, 0DH, "You have failed $"
  SC DB ?               ; Variable to store the score

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display prompt
    MOV AH, 09H
    LEA DX, MSG
    INT 21H
    
    ; Read score input
    MOV AH, 01H
    INT 21H
    SUB AL, 30H          ; Convert ASCII to number
    MOV SC, AL           ; Store in SC
    
    ; Compare SC for grade
    MOV AL, SC
    
    CMP AL, 80
    JGE DISP_A_PLUS      ; If score >= 90, grade is A+
    
    CMP AL, 75
    JGE DISP_A           ; If score >= 80, grade is A
    
    CMP AL, 70
    JGE DISP_A_MINUS     ; If score >= 70, grade is A-
    
    CMP AL, 65
    JGE DISP_B           ; If score >= 60, grade is B
    
    CMP AL, 60
    JGE DISP_B_MINUS     ; If score >= 50, grade is B-
    
    JMP DISP_FAIL        ; If score < 50, the user has failed

DISP_A_PLUS:
    MOV AH, 09H
    LEA DX, GRA_A_PLUS
    INT 21H
    JMP END_PROG

DISP_A:
    MOV AH, 09H
    LEA DX, GRA_A
    INT 21H
    JMP END_PROG

DISP_A_MINUS:
    MOV AH, 09H
    LEA DX, GRA_A_MINUS
    INT 21H
    JMP END_PROG

DISP_B:
    MOV AH, 09H
    LEA DX, GRA_B
    INT 21H
    JMP END_PROG

DISP_B_MINUS:
    MOV AH, 09H
    LEA DX, GRA_B_MINUS
    INT 21H
    JMP END_PROG

DISP_FAIL:
    MOV AH, 09H
    LEA DX, GRA_FAIL
    INT 21H

END_PROG:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
