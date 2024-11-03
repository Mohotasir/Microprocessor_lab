.MODEL SMALL


.DATA 
  PROMT DB "ENTER TWO NUBERS : $" 
  P1 DB 0AH, 0DH, "A IS LARGE $"
  P2 DB 0AH, 0DH, "B IS LARGE $"
  A DB ?
  B DB ?

.CODE
 MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,09H
    LEA DX,PROMT
    INT 21H
    
    MOV AH, 01H
    INT 21H 
    SUB AL, 30H
    MOV A, AL
    
    MOV AH,01H
    INT 21H
    SUB AL, 30H
    MOV B, AL
    
    MOV AL , A
    CMP AL , B
    JG DIS1
    JL DIS2
    JMP EXIT
    
    
 DIS1:
     MOV AH, 09H
     LEA DX, P1
     INT 21H 
     JMP EXIT
 DIS2:
     MOV AH, 09H
     LEA DX, P2
     INT 21H  
     JMP EXIT 
EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
 
 END MAIN