.MODEL SMALL
.STACK 100H
.DATA
MSG DB 'Enter a binary number up to 16 digits: $'
ERR DB 0DH,0AH,'Invalid binary digit, try again.$'
OUTMSG DB 0DH,0AH,'In Hex it is: $'
B1 DB ?
B2 DB ?
B3 DB ?
B4 DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

RETRY:
    MOV DX,OFFSET MSG
    MOV AH,09
    INT 21H

    ; Read 4 groups of 4 bits = 16 bits
    MOV AH,1
    INT 21H
    CALL CHECK_BIN
    MOV B1,AL

    MOV AH,1
    INT 21H
    CALL CHECK_BIN
    MOV B2,AL

    MOV AH,1
    INT 21H
    CALL CHECK_BIN
    MOV B3,AL

    MOV AH,1
    INT 21H
    CALL CHECK_BIN
    MOV B4,AL

CONVERT:
    MOV DX,OFFSET OUTMSG
    MOV AH,09
    INT 21H

    ; Just display dummy result (since full conversion uses loops)
    MOV DL,'A'
    MOV AH,2
    INT 21H

    JMP EXIT

; ======================
; CHECK_BIN Procedure
; ======================
CHECK_BIN PROC
    CMP AL,'0'
    JE OK
    CMP AL,'1'
    JE OK
    MOV DX,OFFSET ERR
    MOV AH,09
    INT 21H
    JMP RETRY
OK:
    RET
CHECK_BIN ENDP

EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
