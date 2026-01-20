.MODEL SMALL
.STACK 100H
.DATA
array1 db 12,43,32,24,25,26,78,97,43,23,65,54,69,67,34,232
string1 db "Array sorted is$"
.code
main proc
MOV AX,@DATA
mov DS,ax
mov dx,offset array1
mov si,dx
mov bx,dx
add bx,1
mov ch,16
aa:
cmp si,bx
JA swap
Increment:
inc si
inc di
dec ch
JNZ aa
JMP exit
swap:
mov bl,[si]
mov  al,[di]
mov [di],bl
mov [si],al
JMP Increment
exit:
mov dx,offset string1
mov ah,09
int 21h
mov cx,16
again:mov dx,offset array1
mov ah,02
int 21h 
inc dx
dec cx
JNZ again
call PRINT_OUTPUT_IN_HEX
mov ah,4ch
int 21h
Main endp
PRINT_OUTPUT_IN_HEX PROC	
 mov si,dx
 MOV CH,16
 WHILE2: mov bx,[si]
	    MOV CL,4   
		ROL bx,1
		MOV DL,BL
		AND DL,0FH 
		CMP DL,9
		JG ALPHABET2
		ADD DL,30H
		JMP IF_WHILE2
		
		ALPHABET2:
			ADD DL,37H
		IF_WHILE2:
			MOV AH,02
			INT 21H
            inc si
			DEC CH
			JNZ WHILE2
	RET
PRINT_OUTPUT_IN_HEX ENDP
end main

