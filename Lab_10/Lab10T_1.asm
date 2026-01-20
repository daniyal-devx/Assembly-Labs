.MODEL SMALL
.STACK 100H
.DATA
    prompt db 'Enter a string: $'
    result db 0Dh, 0Ah, 'Modified string: $'
    input db 50, ?, 50 dup('$')
    ; Translation table: A->D, B->E, ..., Z->C
    table db 'DEFGHIJKLMNOPQRSTUVWXYZABC'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

    ; Display prompt
    MOV AH, 09H
    MOV DX, OFFSET prompt
    INT 21H

    ; Read string input
    MOV AH, 0AH
    MOV DX, OFFSET input
    INT 21H

    ; Set up XLAT
    MOV BX, OFFSET table
    MOV SI, OFFSET input + 2  ; Point to actual string

convert_loop:
    MOV AL, [SI]        ; Get character
    CMP AL, '$'         ; End of string?
    JE display_result
    CMP AL, 'A'         ; Check if uppercase letter
    JB skip_char
    CMP AL, 'Z'
    JA skip_char
    
    ; Convert using XLAT
    SUB AL, 'A'         ; Convert A=0, B=1, ..., Z=25
    XLAT                ; AL = table[AL]
    MOV [SI], AL        ; Store converted character

skip_char:
    INC SI
    JMP convert_loop

display_result:
    ; Display result message
    MOV AH, 09H
    MOV DX, OFFSET result
    INT 21H

    ; Display modified string
    MOV DX, OFFSET input + 2
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN