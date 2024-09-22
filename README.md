## 8086 microProcessor
- 16 bit microprocessor
## Registers(16bit) - AX , BX , CX , DX
- AX, BX, CX, and DX are general-purpose registers used to store data temporarily during program execution. Each of these registers is 16 bits wide and can be divided into two 8-bit registers, allowing both byte-level and word-level operations.
# 1. AX (Accumulator Register):
Purpose: Primarily used in arithmetic operations and I/O operations.
Divided into:
AH: The higher 8 bits of the AX register.
AL: The lower 8 bits of the AX register.
Common Usage: The AX register is often used to store the result of arithmetic operations like ADD, SUB, MUL, and DIV. It is also used for certain system calls and I/O operations.
# BX (Base Register):
Purpose: Often used as a base pointer for addressing memory locations.
Divided into:
BH: The higher 8 bits of the BX register.
BL: The lower 8 bits of the BX register.
Common Usage: The BX register is frequently used in indexed addressing to access memory arrays or structures
# CX (Count Register):
Purpose: Primarily used as a counter in loop operations.
Divided into:
CH: The higher 8 bits of the CX register.
CL: The lower 8 bits of the CX register.
Common Usage: The CX register is often used in LOOP and REP instructions, which repeat operations a certain number of times. It is also used in shift and rotate instructions.
# DX (Data Register):
Purpose: Used in combination with AX for multiplication, division, and I/O operations.
Divided into:
DH: The higher 8 bits of the DX register.
DL: The lower 8 bits of the DX register.
Common Usage: The DX register is used to store the high word in 32-bit multiplication or division. It is also used in port I/O operations where the port address is placed in DX.

////////////////////////////////////////////////

; function AH a thakbe
; ascii AL  a thakbe

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
  

  
  MOV AH, 4CH  ; EXIT TO DOS
  INT 21H 
  MAIN ENDP
 END MAIN 
  
