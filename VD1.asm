;in ra 2 chuoi: hello! va Chao ban!  cach nhau 1 so dong
.Model Small  ;bo nho small
.Stack 100    ;kich thuoc stack 100bytes
.Data         ;khai bao 
    CRLF        DB 13,10,'$'   ;13: cret (lui ve dau dong) | 10: newl(xuong dong)
    ChaoTay     DB 'hello!$'
    ChaoTa      DB 'Chao ban!$'
.Code
MAIN Proc   ;thu tuc chinh
    ;khoi tao DS **
    MOV AX, @Data ;//khoi tao thanh ghi DS
    MOV DS, AX    ;tro thanh ghi DS ve .DATA
    
    ;//hien thi loi chao dung ham 9 cua INT 21H
    MOV AH, 9    
    
    ;LEA : Load Effective Address: Tai con tro -> muc dang xu ly
    LEA DX, ChaoTay ;hello!
    INT 21H        
    
    LEA DX, CRLF    ;Xuong dong+quay ve dau dong
    INT 21H
        
    ;cach 2 dong
    LEA DX, CRLF
    MOV CX, 3       ;CX chua so dong cach +1
    LAP: INT 21H
        LOOP LAP  
        
        LEA DX, ChaoTa  ;Chao ban!
        INT 21H 

    ;tro ve DOS dung ham 4CH cua INT 21H
    MOV AH, 4CH         ;giong return 0; trong C/C++ (Co the khong can)
    INT 21H
    
MAIN endp
END MAIN
         
  


