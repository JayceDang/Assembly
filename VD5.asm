.Model Small
.Stack 100
.Data
    Str1    DB 'a','b','c','d','e','f','g','h'
    Tbao    DB 'chuoi da duoc doi: '
    Str2    DB 8 DUP(0)
            DB '$'
.Code
MAIN proc
    MOV AX,@Data    ;khoi dau cho DS va ES
    MOV DS,AX
    MOV ES,AX
    LEA SI,Str1+7   ;SI chi vao cuoi chuoi cu
    LEA DI,Str2+7   ;DI chi vao cuoi chuoi moi
    STD             ;dinh huong lui
    MOV CX,8        ;CX chua so byte phai doi
LAP:LODSB           ;lay 1 ky tu cua chuoi cu
    SUB AL,20H      ;doi thanh chu hoa
    STOSB           ;cat vao chuoi moi
    LOOP LAP        ;lam cho den het
    LEA DX,Tbao     ;chuan bi hien chuoi moi
    MOV AH,9
    INT 21H
    MOV AH,4CH      ;ve DOS
    INT 21H
MAIN endp
    END MAIN