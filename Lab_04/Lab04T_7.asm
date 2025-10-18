.model small
.stack 100h
.data

cp db "CAPITAL$"
sm db "SMALL$"
str db "Enter a character : $" 

.code
main proc
mov ax,@data
mov ds,ax
mov dx, offset str
mov ah,09h
int 21h
mov ah,01h
int 21h
mov dl,0Dh
mov ah,02h
int 21h
mov dl,0Ah
mov ah,02h
int 21h
cmp al,61h
jae small
jmp capital
capital:
	mov ah,09h
	mov dx, offset cp
	int 21h
	jmp exit

small:
	mov ah,09h
	mov dx,offset sm
	int 21h
	jmp exit
	 
exit:
	mov ah,4ch
	int 21h
	main endp
	end main
