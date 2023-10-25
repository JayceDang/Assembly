.Model Small
.Stack 100
.Data
    Strl DB 'a','b','c','d','e','f','g','h'
    Tbao DB 'chuoi da duoc doi:', 10, 13
         DB '$'
.Code
MAIN proc
    MOV AX, @Data ;khoi dau cho DS va ES
    MOV DS, AX
    MOV ES, AX
    LEA SI, Strl+7 ;SI chi vao cuoi chuoi cu
    LEA DI, Strl+7 ;DI chi vao cuoi chuoi moi
    STD ;dinh huong lui
    MOV CX, 8 ;CX chua so byte phai doi
LAP: LODSB ;lay 1 ky tu cua chuoi cu
    SUB AL, 20H; doi thanh in hoa
    STOSB ;cat vao chuoi moi
    LOOP LAP
    LEA DX, Tbao
    MOV AH, 9
    INT 21H
    MOV AH, 4CH; ve DOS
    INT 21H
MAIN Endp
    END MAIN
    
    
    
    
    
    
    