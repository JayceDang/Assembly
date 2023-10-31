.Model Small
.Stack 100
.Data
    CRLF    DB 13,10,'$'
    Tbao    DB 'go vao 1 so he hai(max 16 bit,'
            DB 'CR de thoi):$'
.Code
MAIN proc
    MOV AX,@Data
    MOV DS,AX
    MOV AH,9    ;hien thi thong bao
    LEA DX,Tbao
    INT 21H
    XOR BX,BX   ;BX chua ket qua, luc dau la 0
    MOV AH,1    ;ham doc 1 so tu ban phim
    MOV CX,16
TIEP:INT 21H
    CMP AL,13   ;CR?
    JE THOIDOC  ;dung thoi doc
    CMP AL,'0'
    JB TIEP
    CMP AL,'1'
    JA TIEP
    AND AL,0FH  ;khong,doi ma ASCII ra so
    SHL BX,1    ;dich trai BX 1 bit de lay cho
    OR BL,AL    ;chen bit vua doc vao ket qua
    LOOP TIEP   ;doc tiep 1 ki tu
THOIDOC:MOV CX,16
    MOV AH,9
    LEA DX,CRLF
    INT 21H
    MOV AH,2    ;ham hien ky tu
    HIEN:XOR DL,DL;xoa DL de chuan bi doi
    ROL BX,1    ;dua bit MSB cua BX sang CF
    ADC DL,30H  ;doi gia tri bit do ra ASCII
    INT 21H     ;hien thi 1 bit cua BX
    LOOP HIEN   ;lap lai cho den het
    MOV AH,4CH  ;tro ve DOS
    INT 21H
MAIN endp
    END MAIN