.model small
.stack 100h
.data
array1 db 63h,64h,65h,66h,67h,68h,69h,70h
array2 db 41h, 42h, 43h, 44h, 45h, 46h, 47h, 48h
.code
main proc
mov ax,@data
mov ds,ax
mov si, offset array1
mov di, offset array2
add di,7
mov cx,8
again:  mov al,[si]
	mov bl,[di]
	mov [si],bl
	mov [di],al
        inc si
        dec di
        dec cx
        jnz again
mov si, offset array1
mov di, offset array2
mov cx,8

mov ah,02h

ar1: mov dl,[si]
    mov ah,02h
	int 21h
	inc si
	dec cx
	jnz ar1

mov cx,8

ar2: mov dl,[di]
	mov ah,02
	int 21h
	inc di
	dec cx
	jnz ar2
mov ah,4ch
int 21h
main endp
end main
