.model small
.stack 100h
.Data
MSG1 DB 'Enter a number to convert and display: for bin: 1,for hex: 2, for dec : 3$'
MSG2 DB 0DH,0AH,'Enter second 8-bit binary: $'
ERR DB 0DH,0AH,'Invalid digit, try again.$'
OUT1 DB 0DH,0AH,'Binary sum is: $'
OUT2 DB 0DH,0AH,'Hex sum is: $'
.code
main proc
mov ax,@Data
mov dx,ax
push MSG1
pop MSG1
mov ah,09
int 21h
Main endp
end main


