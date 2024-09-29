  
.MODEL SMALL

.DATA 
     VAR1 DB ?
     VAR2 DB ?
     SUM DB ? 
     RES DW ?
  
.CODE
 MAIN PROC
     MOV AX, @DATA 
     MOV DS, AX

     MOV AH, 01H
     INT 21H
     SUB AL,30H 
     MOV VAR1,AL

     MOV AH, 01H 
     INT 21H 
     SUB AL,30H 
     MOV VAR2, AL

    ADD AL, VAR1 
    MOV SUM, AL
    
    MUL SUM 
    MOV RES,AX
    
   MOV AH, 4CH 
   INT 21H 
   MAIN ENDP 
END MAIN