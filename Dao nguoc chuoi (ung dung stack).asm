.model small
.stack 100
.data
    str db 50 dup('$')
    tb1 db 10, 13, 'Chuoi da duoc dao nguoc: $'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 0ah
        lea dx, str
        int 21h
        
        lea dx, tb1
        mov ah, 9
        int 21h
        mov cl, [str+1]
        lea si, [str+2]
        Lap:
            push [si]
            inc si
            loop Lap
        mov cl, [str+1]
        Lap2:
            pop dx
            mov ah, 2
            int 21h
            loop Lap2
        int 20h
    main endp
    end