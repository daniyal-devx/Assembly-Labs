.model small
.stack 100h
.data
msg1 db "enter a character: $"
msg2 db "the ascii code in binary is: $"
msg3 db "the number of 1 bits is: $"
binary db 8 dup('0'), '$'
countstr db "0$"
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09
mov dx, offset msg1
int 21h

mov ah, 1
int 21h
mov bl, al
mov bh, al

mov si, offset binary
mov cx, 8

_loop:
rol bl, 1
jc one
mov al, '0'
jmp store

one:
mov al, '1'

store:
mov [si], al
inc si
loop _loop

mov ah, 09
mov dx, offset msg2
int 21h

mov ah, 09
mov dx, offset binary
int 21h

mov cx, 8
mov dl, 0

count_loop:
shr bh, 1
jnc skip
inc dl

skip:
loop count_loop

add dl, '0'
mov countstr, dl

mov ah, 09
mov dx, offset msg3
int 21h

mov ah, 09
mov dx, offset countstr
int 21h

mov ah, 4ch
int 21h
main endp
end main