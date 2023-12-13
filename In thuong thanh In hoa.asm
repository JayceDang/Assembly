.model small
.stack 100h
.data    
    msg1 db 13, 10, 'Chuyen sang ky tu in hoa la: '
    char db ?, '$'
.code
main proc
    mov ax, @data 
    mov ds, ax
    
    mov ah, 1       
    int 21h 
    
    sub al, 32    
    mov char, al    
    
    lea dx, msg1 
    
    mov ah, 9
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end        