.MODEL SMALL
.DATA
    count DB 0                  
    msg DB 'Number of characters entered: $'         
    
    
.CODE
                    
MAIN PROC   

    MOV AX, @DATA               
    MOV DS, AX
    MOV ES, AX

READ_INPUT:
    MOV AH, 01H                  
    INT 21H                      
    
    CMP AL, 0DH                 
    JE DISPLAY            

    INC count                    
    JMP READ_INPUT               

DISPLAY:
    MOV AH, 09H                    
    LEA DX, msg                  
    INT 21H                      

    MOV AL, count               
    ADD AL, 30H                  
    MOV DL, AL                   
    MOV AH, 2                    
    INT 21H                     

    MOV AH, 4CH                  
    INT 21H                     

   MAIN ENDP
 END MAIN