.Model Small
.Stack 100
.Data
    CRLF        DB 13,10,'$'
    ChaoTay    DB 'hello!$'
    ChaoTa      DB 'Chao ban!$'
.Code
MAIN Proc
    MOV AX, @Data ;//khoi dau thanh ghi DS
    MOV DS, AX 
    ;//hien thi loi chao dung ham 9 cua INT 21H
    MOV AH, 9
    LEA DX, ChaoTay
    INT 21H
    ;//cach 5 dong dung ham 9 cua INT 21H
    LEA DX, CRLF
    MOV CX, 6 ;//CX chua so dong cach +1
    
    LAP: INT 21H
         LOOP LAP 
         ;//hien thi loi chao dung ham 9 cua INT 21H
         LEA DX, ChaoTa
         INT 21H 
         ;//tro ve DOS dung ham 4 CH cua INT 21H
         MOV AH, 4CH
         INT 21H
    MAIN endp
         END MAIN
         
  


