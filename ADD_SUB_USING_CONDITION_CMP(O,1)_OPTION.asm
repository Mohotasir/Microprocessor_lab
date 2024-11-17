
.MODEL SMALL

.DATA 
   M1 DB 'ENTER X :(0<= X <= 4) $'
   M2 DB 0AH, 0DH, 'ENTER Y :(0<= X <= 4 , X>Y) $'
   M3 DB 0AH ,0DH ,'ENTER Z : (0 OR 1) $'
   
   ADD_MSG DB 'ADDITION IS: $'
   SUB_MSG DB 'SUBTRACTION IS: $'
   X DB ? 
   Y DB ?
   Z DB ?
   ADDD DB ?
   SUBB DB ?


.CODE

  MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,09H
    LEA DX,M1
    INT 21H
    
    MOV AH, 01H
    INT 21H 
    SUB AL, 30H
    MOV X, AL 
    
    MOV AH,09H
    LEA DX,M2
    INT 21H
    
    MOV AH, 01H
    INT 21H 
    SUB AL, 30H
    MOV Y, AL 
    
    MOV AH,09H
    LEA DX,M3
    INT 21H
    
    MOV AH, 01H
    INT 21H 
    SUB AL, 30H
    MOV Z, AL
    
    CMP Z ,0
    JE SUBS
    CMP Z ,1
    JE ADDS
    JMP EXIT
    
SUBS:
    MOV AL , X
    ADD AL ,Y
    MOV ADDD, AL
    JMP EXIT
ADDS:
    MOV AL , X
    SUB AL ,Y
    MOV SUBB , AL
    JMP EXIT
EXIT:
    MOV AH ,4CH
    INT 21H 
    
    
    
    
    MAIN ENDP
  END MAIN                                         