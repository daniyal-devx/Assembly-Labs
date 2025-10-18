.model small
.stack 100h
.data

errormsg db "Error! Sum is greater than 9.$"
str1 db "Sum is $"
str2 db "Enter two digits : $" 

.code
main proc
mov ax,@data
mov ds,ax

mov dx, offset str2
mov ah,09h
int 21h

mov ah,01h
int 21h
sub al,30h
mov bl,al

mov ah,01h
int 21h
mov cl,al

mov dl,0Dh
mov ah,02h
int 21h
mov dl,0Ah
mov ah,02h
int 21h

mov al,cl
sub al,30h
add bl,al
cmp bl,10
jb sum
jmp error

error:
mov ah,09h
mov dx, offset errormsg
int 21h
jmp exit

sum:
mov dx,offset str1
mov ah,09h
int 21h
add bl,30h
mov dl,bl
mov ah,02h
int 21h
jmp exit

exit:
mov ah,4ch
int 21h
main endp
end main
