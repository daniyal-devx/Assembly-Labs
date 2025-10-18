.model small
.stack 100h
.data
array1 db 1,2,3,4,5,6,7,8
array2 db 8 dup(?)
count db 8
.code
main proc
mov ax,@data
mov ds,ax;
mov si,offset array1
mov di,offset array2
mov cl,count 
aa:
    mov al,[si]
    mov [di],al
    inc si
    inc di
    dec cl
    jnz aa
    mov ah,4ch
    int 21h
main endp
end main

