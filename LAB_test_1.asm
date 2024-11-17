.MODEL SMALL
.STACK 100H
.DATA
    sum DW 0
    terms DB ?
    prompt DB 'Enter number of terms: $'
    sum_msg DB 'Sum of series: $'
    result DB 6 DUP ('$')

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, prompt
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV terms, AL

    MOV AL, terms
    CBW
    IMUL AL
    MOV sum, AX

    MOV AH, 09H
    LEA DX, sum_msg
    INT 21H

    MOV AX, sum
    MOV CX, 5
    MOV BX, 10
    LEA DI, result + 5

CONVERT_LOOP:
    DEC DI
    XOR DX, DX
    DIV BX
    ADD DL, '0'
    MOV [DI], DL
    TEST AX, AX
    JNZ CONVERT_LOOP

    MOV AH, 09H
    LEA DX, DI
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
