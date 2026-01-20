.MODEL SMALL
.STACK 100H
.DATA
    prompt db 'Enter a string: $'
    encoded_msg db 0Dh, 0Ah, 'Encoded string: $'
    decoded_msg db 0Dh, 0Ah, 'Decoded string: $'
    input db 50, ?, 50 dup('$')
    encoded db 50 dup('$')
    table db 'FVXCHSAIYQWGOTBNZKMJPLURDE'
    table2 db 'GODYZALEHTRVSPMUJXFNWBKCIQ'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

    MOV AH, 09H
    MOV DX, OFFSET prompt
    INT 21H

    MOV AH, 0AH
    MOV DX, OFFSET input
    INT 21H

    ; ENCODE using table1
    MOV BX, OFFSET table
    MOV SI, OFFSET input + 2
    MOV DI, OFFSET encoded

encode_loop:
    MOV AL, [SI]
    CMP AL, 0Dh
    JE display_encoded
    CMP AL, 'A'
    JB skip_encode
    CMP AL, 'Z'
    JA skip_encode
    
    SUB AL, 'A'
    XLAT
    MOV [DI], AL
    JMP next_encode

skip_encode:
    MOV [DI], AL

next_encode:
    INC SI
    INC DI
    JMP encode_loop

display_encoded:
    MOV AH, 09H
    MOV DX, OFFSET encoded_msg
    INT 21H
    MOV DX, OFFSET encoded
    INT 21H

    ; DECODE using table2
    MOV BX, OFFSET table2
    MOV SI, OFFSET encoded

decode_loop:
    MOV AL, [SI]
    CMP AL, '$'
    JE display_decoded
    CMP AL, 'A'
    JB skip_decode
    CMP AL, 'Z'
    JA skip_decode
    
    SUB AL, 'A'
    XLAT
    MOV [SI], AL

skip_decode:
    INC SI
    JMP decode_loop

display_decoded:
    MOV AH, 09H
    MOV DX, OFFSET decoded_msg
    INT 21H
    MOV DX, OFFSET encoded
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN