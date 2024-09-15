
.MODEL SMALL

.DATA
   A DB 03H
   B DB 04H
   RES DB ?

.CODE


MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV AL,A
     MUL B
     MOV RES,AL
     HLT
        
    MAIN ENDP 
END MAIN