.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'Enter first 8-bit binary: $'
MSG2 DB 0DH,0AH,'Enter second 8-bit binary: $'
ERR DB 0DH,0AH,'Invalid digit, try again.$'
OUT1 DB 0DH,0AH,'Binary sum is: $'
OUT2 DB 0DH,0AH,'Hex sum is: $'
B1 DB ?
B2 DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

RESTART:
    MOV DX,OFFSET MSG1
    MOV AH,09
    INT 21H
    MOV AH,1
    INT 21H
    CALL CHECK_BIT
    MOV B1,AL

    MOV DX,OFFSET MSG2
    MOV AH,09
    INT 21H
    MOV AH,1
    INT 21H
    CALL CHECK_BIT
    MOV B2,AL

ADD_BIN:
    MOV AL,B1
    SUB AL,'0'
    MOV BL,B2
    SUB BL,'0'
    ADD AL,BL

    MOV DX,OFFSET OUT1
    MOV AH,09
    INT 21H

    CMP AL,2
    JE SHOW10
    CMP AL,1
    JE SHOW1
    JMP SHOW0

SHOW10:
    MOV DL,'1'
    MOV AH,2
    INT 21H
    MOV DL,'0'
    MOV AH,2
    INT 21H
    JMP NEXT
SHOW1:
    MOV DL,'1'
    MOV AH,2
    INT 21H
    JMP NEXT
SHOW0:
    MOV DL,'0'
    MOV AH,2
    INT 21H
NEXT:

    MOV DX,OFFSET OUT2
    MOV AH,09
    INT 21H

    MOV DL,AL
    ADD DL,48
    MOV AH,2
    INT 21H

    JMP EXIT

; ======================
; CHECK_BIT Procedure
; ======================
CHECK_BIT PROC
    CMP AL,'0'
    JE OK
    CMP AL,'1'
    JE OK
    MOV DX,OFFSET ERR
    MOV AH,09
    INT 21H
    JMP RESTART
OK:
    RET
CHECK_BIT ENDP

EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
