
.MODEL SMALL

.DATA
   PROMT DB 0AH,0DH, "ENTER A NUMER:$"  
   P1 DB 0AH,0DH , "NUM IS EVEN$"
   P2 DB 0AH,0DH, "NUM IS ODD$"
   NUM DB ?


.CODE 
  MAIN PROC
        
   MOV AX,@DATA
   MOV DS,AX
   
   MOV AH, 09H
   LEA DX , PROMT 
   INT 21H
   
   MOV AH , 01H  
   INT 21H
   SUB AL , 30
   MOV NUM , AL
   
   
   MOV AL, NUM
   AND AL , 1
   CMP AL , 0
   JE EVN
   JMP ODD
   
   
 EVN:
    MOV AH,09H
    LEA DX,P1
    INT 21H
    JMP EXIT
 ODD:
  MOV AH, 09H
  LEA DX, P2
  INT 21H 
 EXIT:
   MOV AH,4CH
   INT 21H     
        
        
  MAIN ENDP
END MAIN