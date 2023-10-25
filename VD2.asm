.Model Small
.Stack 100
.Data

    CRLF        DB 13, 10, '$'
    ChaoTay     DB 'Hello!$'
    ChaoTa      DB 'Chao ban!$'
    Thongbao    DB 'go vao so dong cach:$'
    SoCRLF      DB ?   

.Code
    MAIN Proc
        MOV AX, @Data ;khoi dau thanh ghi DS
        MOV DS, AX
            ;hien thong bao dung ham 9 cua INT 21H 
        MOV AH, 9
        LEA DX, Thongbao
        INT 21H
            ;doc so dong cach dung ham 1 cua INT 21H
             
        MOV AH, 1
        INT 21H     ;doc so dong cach
        AND AL, 0FH ;doi ra he hai
        MOV SoCRLF, AL ;cat di
            ;cach 1 dong dung ham 9 cua INT 21H
        MOV AH, 9
        LEA DX, CRLF
        INT 21H
            ;hien thi loi chao dung ham 9 cua INT 21H
        MOV AH, 9
        LEA DX, ChaoTay
        INT 21H
        LEA DX, CRLF
        XOR CX, CX
        MOV CL, SoCRLF ;CX chua so dong cach  
        
     LAP:INT 21H
        LOOP LAP
            ;hien thi loi chao dong ham 9 cua INT 21H
            LEA DX, ChaoTa
            INT 21H
            ;tro ve DOS dung ham 4CH cua INT 21H
        MOV AH, 4CH
        INT 21H
     MAIN Endp
        END MAIN