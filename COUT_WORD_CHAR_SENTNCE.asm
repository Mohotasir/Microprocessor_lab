.MODEL SMALL

.DATA
    MSG  DB 0AH,0DH,"ENTER MESSAGE : $"           
    MSG1 DB 0AH,0DH,"NUM OF CHAR : $"
    MSG2 DB 0AH,0DH,"NUM OF WORD : $"
    MSG3 DB 0AH,0DH,"NUM OF SENTENCE : $"
    
    C DB 00H
    W DB 01H
    S DB 00H
    

.CODE

MAIN PROC
    MOV AX, @DATA ; Load the address of the data segment into AX
    MOV DS, AX    ; Initialize the data segment
    
    MOV CX,0
    
    MOV AH,09H
    LEA DX,MSG
    INT 21H
    
    MOV AH,01H
    L:
     INT 21H
     CMP AL , ' '
     JE K
     CMP AL , '.'
     JE M
     CMP AL, '!'
     JE M
     CMP AL, '?'
     JE M
     CMP AL , 0DH
     JE EXIT
     INC C
     LOOP L
     
    k:
     INC W
     JMP L
    M:
     INC S
     JMP L
     
    EXIT: 
      MOV AH,09H
      LEA DX,MSG1
      INT 21H
      
      MOV AH,02H
      MOV DL,C 
      ADD DL , 30H
      INT 21H
      
      MOV AH,09H
      LEA DX,MSG2
      INT 21H 
       MOV AH,02H
      MOV DL,W 
      ADD DL , 30H
      INT 21H
      
      MOV AH,09H
      LEA DX,MSG3
      INT 21H 
      
       MOV AH,02H
      MOV DL,S  
      ADD DL, 30H
      INT 21H
      
      MOV AH,4CH
      INT 21H
   
    
MAIN ENDP
END MAIN