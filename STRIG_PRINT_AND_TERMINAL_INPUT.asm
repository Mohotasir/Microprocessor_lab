.MODEL SMALL

.DATA   
  MSG DB "HELLO STRING$"
  MSG2 DB "AGREED? $"
  PRINT DB ?
  NWLINE DB 0DH, OAH, '$'

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV AH,02H
    MOV DL,07H
    INT 21H 
    
    LEA DX, MSG
    
    MOV AH, 09H
    INT 21H  
    
    LEA DX, NWLINE
    MOV AH, 09H
    INT 21H
      
    LEA DX, MSG2
    
    MOV AH, 09H
    INT 21H 
    
    
    MOV AH,01H
    INT 21H   
    MOV PRINT,AL
    MOV DL,AL
    
    MOV AH, 02H
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
    
    
    
    MAIN ENDP
END MAIN