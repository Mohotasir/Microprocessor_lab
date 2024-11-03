.MODEL SMALL


.DATA 
  PROMT DB "ENTER TWO NUBERS : $" 
  P1 DB 0AH, 0DH, "A IS LARGE $"
  P2 DB 0AH, 0DH, "B IS LARGE $" 
  P3 DB 0AH, 0DH, "C IS LARGE $"
  A DB ?
  B DB ? 
  C DB ?

.CODE
 MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ; PRINT PROMT 
    MOV AH,09H
    LEA DX,PROMT
    INT 21H
    
    ; TAKE INPUT 1 AND SAVE IN A
    MOV AH, 01H
    INT 21H 
    SUB AL, 30H
    MOV A, AL
    
    ; TAKE INPUT 2
    MOV AH,01H
    INT 21H
    SUB AL, 30H
    MOV B, AL 
    
    ; TAKE INPUT 3
    MOV AH,01H
    INT 21H
    SUB AL, 30H
    MOV C, AL
    
    MOV AL , A
    CMP AL , B
    JG CHECK_A_C
    MOV AL, B
    JMP CHECK_B_C

CHECK_A_C: 
    CMP AL , C
    JG DIS1
    JMP DIS3

CHECK_B_C:
    CMP AL , C
    JG DIS2
    JMP DIS3
       
    
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
 DIS3:
     MOV AH, 09H
     LEA DX, P3
     INT 21H  
     JMP EXIT
   
EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
 
 END MAIN