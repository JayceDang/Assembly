.Model Small
.Stack 100h
.Data
str DB 256 dup('$')
tb1 DB 10, 13, 'Chuyen sang chuoi in thuong: $'
tb2 DB 10, 13, 'Chuyen sang chuoi in hoa: $'
.Code
main proc
    MOV AX, @Data
    MOV DS, AX 
     
    LEA DX, str  
    MOV AH, 10  
    INT 21H 
    
    MOV AH, 9   
    LEA DX, tb1 
    INT 21H
    CALL inthuong  
    
    MOV AH, 9
    LEA DX, tb2 
    INT 21H
    CALL inhoa  
    
    MOV AH, 4ch
    INT 21H
main endp 

inthuong proc
    LEA SI, str+2 ;
    Lap1: 
        MOV DL, [SI]
        CMP DL, 'A' 
        JL In1  
        CMP DL, 'Z' 
        JG In1   
        ADD DL, 32  
    In1:
        MOV AH, 2 
        INT 21H
        INC SI  
        CMP [SI], '$' 
        JNE Lap1 
   RET  
inthuong endp     

inhoa proc
    LEA SI, str+2
    Lap2:
        MOV DL, [SI]
        CMP DL, 'a'
        JL In2
        CMP DL, 'z'
        JG In2
        SUB DL, 32  
    In2:
        MOV AH, 2
        INT 21H
        INC SI
        CMP [SI], '$'
        JNE Lap2
    RET
inhoa endp
end