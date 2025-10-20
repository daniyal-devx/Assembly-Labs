.model small
.stack 100h
.data
    msg1 db 0Dh, 0Ah, 'Enter a character: $'
    hex_msg db 0Dh, 0Ah, 'The ASCII code of $'
    char_msg db ' in HEX is $'
    hex_code db '00', '$'
    char db ?
.code
main proc
    mov ax, @data
    mov ds, ax

input_loop:
    mov ah, 9
    mov dx, offset msg1
    int 21h
    
    mov ah, 1
    int 21h
    
    cmp al, 0Dh
    je exit_program
    
    mov char, al
    
    mov ah, 9
    mov dx, offset hex_msg
    int 21h
    
    mov ah, 2
    mov dl, char
    int 21h
    
    mov ah, 9
    mov dx, offset char_msg
    int 21h
    
    mov bl, char
    mov cl, 4
    shr bl, cl
    cmp bl, 9
    jg letter1
    add bl, '0'
    jmp store1
letter1:
    add bl, 'A' - 10
store1:
    mov hex_code, bl
    
    mov bl, char
    and bl, 0Fh
    cmp bl, 9
    jg letter2
    add bl, '0'
    jmp store2
letter2:
    add bl, 'A' - 10
store2:
    mov hex_code+1, bl
    
    mov ah, 9
    mov dx, offset hex_code
    int 21h
    
    jmp input_loop

exit_program:
    mov ah, 4ch
    int 21h
main endp
end main