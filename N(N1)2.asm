 
 .MODEL SMALL
 
 .DATA
 
 
 
 .CODE
 
 MAIN PROC 
     MOV AX,@DATA
     MOV DS,AX  
     
     MOV AH ,01H
     INT 21H
     SUB AL , 30H
     
     
     XOR CX,CX  
     MOV CL , AL
     
     
     MOV AX ,01H
     MOV BX , 0H
     
     L: 
       ADD BX,AX
       ADD AX,1H
       LOOP L
       
       
       MOV AH,4CH
       INT 21H
     
    
    MAIN ENDP
 END MAIN